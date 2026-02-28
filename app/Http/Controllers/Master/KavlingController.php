<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Pengaturan\HakAksesController;
use App\Models\FotoKavling;
use App\Models\KavlingPeta;
use App\Models\LokasiKavling;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use TCPDF;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

class KavlingController extends Controller
{
    public function index(Request $request)
    {
        $permissions = HakAksesController::getUserPermissions();

        if ($request->ajax()) {
            $data = KavlingPeta::select(
                'kavling_peta.*',
                'lokasi_kavling.nama_kavling as nama_cluster'
            )
                ->leftJoin('lokasi_kavling', 'kavling_peta.id_lokasi', '=', 'lokasi_kavling.id')
                ->orderByRaw("SUBSTRING_INDEX(kode_kavling, '-', 1) ASC")
                ->orderByRaw("CAST(SUBSTRING_INDEX(kode_kavling, '-', -1) AS UNSIGNED) ASC")
                ->get();

            return datatables()->of($data)
                ->addIndexColumn()
                ->addColumn('panjang', function ($row) {
                    return '
                        <p>pjg kanan: <strong>' . $row->panjang_kanan . ' m</strong></p>
                        <p>pjg kiri: <strong>' . $row->panjang_kiri . ' m</strong></p>
                    ';
                })
                ->addColumn('lebar', function ($row) {
                    return '
                        <p>lebar depan: <strong>' . $row->lebar_depan . ' m</strong></p>
                        <p>lebar belakang: <strong>' . $row->lebar_belakang . ' m</strong></p>
                    ';
                })
                ->addColumn('luas', function ($row) {
                    return '
                        <p>luas tanah: <strong>' . $row->luas_tanah . ' m</strong></p>
                    ';
                })

                ->addColumn('harga', function ($row) {
                    return number_format($row->hrg_jual, 0, ',', '.');
                })
                ->addColumn('lokasi', function ($row) {
                    return $row->kode_kavling;
                })
                ->addColumn('action', function ($row) use ($permissions) {
                    $btn = '<div class="text-center">';
                    if ($permissions['edit']) {
                        $btn .= '<a href="' . route('kavling.edit', $row->id) . '" class="edit btn btn-warning btn-sm mx-1">Edit</a>';
                    }
                    $btn .= '<a href="' . route('kavling.lampiran', $row->id) . '" class="btn btn-success btn-sm">Lampiran</a>';

                    return $btn;
                })
                ->rawColumns(['panjang', 'lebar', 'luas', 'action'])
                ->make(true);
        }

        return view('admin.master.kavling.index', compact('permissions'));
    }

    public function edit($id)
    {
        $data = KavlingPeta::with('lokasi')->findOrFail($id);
        return view('admin.master.kavling.edit', compact('data'));
    }

    public function update(Request $request, $id)
    {
        $request->merge([
            'hrg_meter' => str_replace('.', '', $request->hrg_meter),
            'hrg_jual' => str_replace('.', '', $request->hrg_jual),
        ]);

        $request->validate([
            'panjang_kanan'         => 'required|numeric',
            'panjang_kiri'          => 'required|numeric',
            'lebar_depan'           => 'required|numeric',
            'lebar_belakang'        => 'required|numeric',
            'luas_tanah'            => 'required|numeric',
            'hrg_meter'             => 'required|integer',
            'hrg_jual'              => 'required|string',
            'keterangan'            => 'nullable|string|max:100',
            'no_sertifikat'         => 'nullable|string|max:35',
        ], [
            'panjang_kanan.required'        => 'Panjang kanan wajib diisi.',
            'panjang_kanan.numeric'         => 'Panjang kanan harus berupa angka.',

            'panjang_kiri.required'         => 'Panjang kiri wajib diisi.',
            'panjang_kiri.numeric'          => 'Panjang kiri harus berupa angka.',

            'lebar_depan.required'          => 'Lebar depan wajib diisi.',
            'lebar_depan.numeric'           => 'Lebar depan harus berupa angka.',

            'lebar_belakang.required'       => 'Lebar belakang wajib diisi.',
            'lebar_belakang.numeric'        => 'Lebar belakang harus berupa angka.',

            'luas_tanah.required'           => 'Luas tanah wajib diisi.',
            'luas_tanah.numeric'            => 'Luas tanah harus berupa angka.',

            'hrg_meter.required'            => 'Harga per meter wajib diisi.',
            'hrg_meter.integer'             => 'Harga per meter harus berupa angka.',

            'hrg_jual.required'             => 'Harga jual wajib diisi.',
            'hrg_jual.string'               => 'Harga jual harus berupa teks.',

            'keterangan.string'             => 'Keterangan harus berupa teks.',
            'keterangan.max'                => 'Keterangan maksimal 100 karakter.',

            'no_sertifikat.string'         => 'Nomor sertifikat harus berupa teks.',
            'no_sertifikat.max'             => 'Nomor sertifikat maksimal 35 karakter.',
        ]);

        $data = KavlingPeta::find($id);

        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan.'
            ], 404);
        }

        try {
            $data->update([
                'panjang_kanan' => $request->panjang_kanan,
                'panjang_kiri' => $request->panjang_kiri,
                'lebar_depan' => $request->lebar_depan,
                'lebar_belakang' => $request->lebar_belakang,
                'luas_tanah' => $request->luas_tanah,
                'hrg_meter' => $request->hrg_meter,
                'hrg_jual' => $request->hrg_jual,
                'keterangan' => $request->keterangan ?? '',
                'id_rumah_sikumbang' => '',
                'no_sertifikat' => $request->no_sertifikat ?? '',
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil disimpan'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => true,
                'message' => 'Data berhasil disimpan'
            ], 500);
        }
    }

    public function lampiran($id)
    {
        $kavling = KavlingPeta::with('lokasi')->findOrFail($id);

        if (!$kavling) {
            return redirect()->route('kavling.index')->with('error', 'Data kavling tidak ditemukan.');
        }

        $fotos = FotoKavling::where('id_kavling', $id)->get();

        return view('admin.master.kavling.lampiran', compact('kavling', 'fotos'));
    }

    public function uploadLampiran(Request $request)
    {
        $id = $request->input('id');

        $request->validate([
            'tanggal'    => 'required|date',
            'nama_file'  => 'required|string|max:255',
            'lampiran'   => 'required|file|mimes:jpg,jpeg,png,pdf|max:5120',
            'keterangan' => 'required|string|max:500',
        ], [
            'tanggal.required'    => 'Tanggal upload wajib diisi.',
            'keterangan.required'    => 'keterangan wajib diisi.',
            'tanggal.date'        => 'Tanggal upload tidak valid.',
            'nama_file.required'  => 'Nama file wajib diisi.',
            'nama_file.string'    => 'Nama file harus berupa teks.',
            'nama_file.max'       => 'Nama file maksimal 255 karakter.',
            'lampiran.required'   => 'File wajib diunggah.',
            'lampiran.file'       => 'Lampiran harus berupa file.',
            'lampiran.mimes'      => 'File harus berupa JPG, JPEG, PNG, atau PDF.',
            'lampiran.max'        => 'Ukuran file maksimal 5MB.',
            'keterangan.string'   => 'Keterangan harus berupa teks.',
            'keterangan.max'      => 'Keterangan maksimal 500 karakter.',
        ]);

        DB::beginTransaction();
        try {
            $file = $request->file('lampiran');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('foto_kavling'), $filename);

            FotoKavling::create([
                'tanggal'    => $request->tanggal,
                'id_kavling' => $id,
                'file_name'  => $request->nama_file,
                'lampiran'   => $filename,
                'keterangan' => $request->keterangan,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Lampiran berhasil diunggah.'
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'error'   => $e->getMessage(),
                'message' => 'Terjadi kesalahan saat mengunggah lampiran.'
            ]);
        }
    }

    public function destroyLampiran($id)
    {
        $lampiran = FotoKavling::find($id);

        if (!$lampiran) {
            return response()->json([
                'success' => false,
                'id'      => $id,
                'message' => 'Lampiran tidak ditemukan.'
            ], 404);
        }

        try {
            if (File::exists(public_path('foto_kavling/' . $lampiran->lampiran))) {
                File::delete(public_path('foto_kavling/' . $lampiran->lampiran));
            }

            $lampiran->delete();

            return response()->json([
                'success' => true,
                'message' => 'Lampiran berhasil dihapus.'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error'   => $e->getMessage(),
                'message' => 'Terjadi kesalahan saat menghapus lampiran.'
            ], 500);
        }
    }

    public function cetakPdf(Request $request, $id_lokasi)
    {
        $query = KavlingPeta::with('lokasi');

        if ($id_lokasi && $id_lokasi != 0) {
            $query->where('id_lokasi', $id_lokasi);
        }

        $data = $query->get();

        $pdf = new TCPDF('L', 'mm', 'A4', true, 'UTF-8', false);
        $pdf->SetCreator('Rhabayu Property');
        $pdf->SetAuthor('Rhabayu Property');
        $pdf->SetTitle('Data Kavling');
        $pdf->SetMargins(10, 10, 10);
        $pdf->SetAutoPageBreak(true, 10);
        $pdf->SetPrintHeader(false);
        $pdf->SetPrintFooter(false);
        $pdf->AddPage();

        $namaLokasi = 'Semua Lokasi';
        if ($id_lokasi && $id_lokasi != 0) {
            $lokasiData = LokasiKavling::find($id_lokasi);
            $namaLokasi = $lokasiData ? $lokasiData->nama_kavling : 'Semua Lokasi';
        }

        // Industrial Formal Header
        $pdf->SetFont('helvetica', 'B', 16);
        $pdf->Cell(0, 10, 'DATA KAVLING ' . strtoupper($namaLokasi), 0, 1, 'C');
        $pdf->SetFont('helvetica', '', 10);
        $pdf->Cell(0, 5, 'Dicetak pada tanggal: ' . date('d F Y'), 0, 1, 'C');
        $pdf->Ln(5);

        // Configure Table
        $pdf->SetFont('helvetica', 'B', 8);
        $pdf->SetFillColor(240, 240, 240); // Light gray for industrial look
        $pdf->SetLineWidth(0.1);

        // Column Widths
        // Column Widths
        $w = [10, 30, 25, 35, 35, 35, 35, 40, 45];

        // Headers
        // Headers
        $headers = ['No', 'Kode Kavling', 'Luas Tanah', 'Harga Rumah', 'Biaya Surat', 'Pening. Mutu', 'Kelebihan Tanah', 'Adm. Posisi', 'Total Harga'];

        $pdf->Cell($w[0], 10, $headers[0], 1, 0, 'C', true);
        $pdf->Cell($w[1], 10, $headers[1], 1, 0, 'C', true);
        $pdf->Cell($w[2], 10, $headers[2], 1, 0, 'C', true);
        $pdf->Cell($w[3], 10, $headers[3], 1, 0, 'C', true);
        $pdf->Cell($w[4], 10, $headers[4], 1, 0, 'C', true);
        $pdf->Cell($w[5], 10, $headers[5], 1, 0, 'C', true);
        $pdf->Cell($w[6], 10, $headers[6], 1, 0, 'C', true);
        $pdf->Cell($w[7], 10, $headers[7], 1, 0, 'C', true);
        $pdf->Cell($w[8], 10, $headers[8], 1, 1, 'C', true);

        $pdf->SetFont('helvetica', '', 8);
        $no = 1;

        foreach ($data as $row) {
            $total = $row->hrg_jual + $row->biaya_surat + $row->peningkatan_mutu + $row->biaya_kelebihan_tanah + $row->admin_posisi_rumah;

            $pdf->Cell($w[0], 8, $no++, 1, 0, 'C');
            $pdf->Cell($w[1], 8, $row->kode_kavling ?? '-', 1, 0, 'C');
            $pdf->Cell($w[2], 8, $row->luas_tanah . ' m²', 1, 0, 'C');

            // Format prices with Rp. prefix and right alignment
            $pdf->Cell($w[3], 8, 'Rp. ' . number_format($row->hrg_jual, 0, ',', '.'), 1, 0, 'R');
            $pdf->Cell($w[4], 8, 'Rp. ' . number_format($row->biaya_surat, 0, ',', '.'), 1, 0, 'R');
            $pdf->Cell($w[5], 8, 'Rp. ' . number_format($row->peningkatan_mutu, 0, ',', '.'), 1, 0, 'R');
            $pdf->Cell($w[6], 8, 'Rp. ' . number_format($row->biaya_kelebihan_tanah, 0, ',', '.'), 1, 0, 'R');
            $pdf->Cell($w[7], 8, 'Rp. ' . number_format($row->admin_posisi_rumah, 0, ',', '.'), 1, 0, 'R');
            $pdf->Cell($w[8], 8, 'Rp. ' . number_format($total, 0, ',', '.'), 1, 1, 'R');
        }

        $filename = 'Data Kavling ' . Str::slug($namaLokasi) . '.pdf';
        $pdf->Output($filename, 'I');
    }

    public function cetakExcel(Request $request, $id_lokasi = 0)
    {
        $query = KavlingPeta::with('lokasi');

        if ($id_lokasi && $id_lokasi != 0) {
            $query->where('id_lokasi', $id_lokasi);
        }

        $data = $query->get();

        $spreadsheet = new Spreadsheet;
        $sheet = $spreadsheet->getActiveSheet();

        $namaLokasi = 'Semua Lokasi';
        if ($id_lokasi && $id_lokasi != 0) {
            $lokasiData = LokasiKavling::find($id_lokasi);
            $namaLokasi = $lokasiData ? $lokasiData->nama_kavling : 'Semua Lokasi';
        }

        $sheet->setTitle('Data Kavling');

        // Main Header
        $sheet->mergeCells('A1:J1');
        $sheet->setCellValue('A1', 'DATA KAVLING ' . strtoupper($namaLokasi));
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(14)->setName('Arial');
        $sheet->getStyle('A1')->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

        // Date Header
        $sheet->mergeCells('A2:J2');
        $sheet->setCellValue('A2', 'Dicetak pada: ' . date('d F Y'));
        $sheet->getStyle('A2')->getFont()->setSize(10)->setName('Arial');
        $sheet->getStyle('A2')->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

        $headers = [
            'No',
            'Kode Kavling',
            'Luas Tanah',
            'Harga Rumah',
            'Biaya Surat',
            'Peringkatan Mutu',
            'Biaya Kelebihan Tanah',
            'Admin Posisi Rumah',
            'Total Harga',
        ];

        $col = 'A';
        foreach ($headers as $header) {
            $sheet->setCellValue($col . '4', $header);
            $sheet->getStyle($col . '4')->getFont()->setBold(true)->setName('Arial');
            $sheet->getStyle($col . '4')->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            $sheet->getStyle($col . '4')->getFill()
                ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                ->getStartColor()->setARGB('FFE0E0E0'); // Light Gray Background
            $sheet->getColumnDimension($col)->setAutoSize(true);
            $col++;
        }

        $rowNum = 5;
        $no = 1;
        foreach ($data as $row) {
            $total = $row->hrg_jual + $row->biaya_surat + $row->peningkatan_mutu + $row->biaya_kelebihan_tanah + $row->admin_posisi_rumah;

            $sheet->setCellValue("A{$rowNum}", $no++);
            $sheet->setCellValue("B{$rowNum}", $row->kode_kavling ?? '-');
            $sheet->setCellValue("C{$rowNum}", $row->luas_tanah . ' m²');
            $sheet->setCellValue("D{$rowNum}", $row->hrg_jual);
            $sheet->setCellValue("E{$rowNum}", $row->biaya_surat);
            $sheet->setCellValue("F{$rowNum}", $row->peningkatan_mutu);
            $sheet->setCellValue("G{$rowNum}", $row->biaya_kelebihan_tanah);
            $sheet->setCellValue("H{$rowNum}", $row->admin_posisi_rumah);
            $sheet->setCellValue("I{$rowNum}", $total);

            $sheet->getStyle("A{$rowNum}:I{$rowNum}")->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("A{$rowNum}:C{$rowNum}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

            // Format number columns (Currency Accounting-like format without symbol in Excel often prefer standard number)
            $sheet->getStyle("D{$rowNum}:I{$rowNum}")
                ->getNumberFormat()
                ->setFormatCode('#,##0');

            $rowNum++;
        }

        // Borders
        $styleArray = [
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color' => ['argb' => 'FF000000'],
                ],
            ],
        ];
        $sheet->getStyle('A4:I' . ($rowNum - 1))->applyFromArray($styleArray);

        // Filename
        $fileName = 'Data Kavling ' . Str::slug($namaLokasi) . '.xlsx';

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"{$fileName}\"");
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit;
    }
}
