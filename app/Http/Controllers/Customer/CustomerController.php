<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Pengaturan\HakAksesController;
use App\Models\ArsipCustomer;
use App\Models\Bank;
use App\Models\Customer;
use App\Models\KavlingPeta;
use App\Models\KonfigurasiAplikasi;
use App\Models\KonfigurasiMedia;
use App\Models\ListPenjualan;
use App\Models\LokasiKavling;
use App\Models\Marketing;
use App\Models\Pemasukan;
use App\Models\Pembayaran;
use App\Models\PersyaratanLegal;
use App\Models\Piutang;
use App\Models\Tagihan;
use App\Models\Transaksi;
use App\Models\TransaksiKavling;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use PgSql\Lob;
use PhpOffice\PhpWord\TemplateProcessor;
use TCPDF;
use Yajra\DataTables\Facades\DataTables;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        $permissions = HakAksesController::getUserPermissions();

        Carbon::setLocale('id');

        if ($request->ajax()) {
            $data = Customer::with(['marketing', 'kavling.lokasi', 'progres'])
                ->addSelect([
                    'latest_tgl_terima' => DB::table('transaksi_kavling')
                        ->select('tgl_terima')
                        ->whereColumn('id_customer', 'customer.id')
                        ->orderBy('tgl_terima', 'desc')
                        ->limit(1)
                ])
                ->orderBy('latest_tgl_terima', 'desc');

            return DataTables::of($data)
                ->addIndexColumn()

                ->editColumn('tgl_terima', function ($row) {
                    $firstKavling = $row->kavling->first();  // ambil yang pertama

                    $tglFinal = ($firstKavling && $firstKavling->pivot->tgl_terima)
                        ? Carbon::parse($firstKavling->pivot->tgl_terima)->translatedFormat('d F Y')
                        : '-';

                    $kode = $row->kode_customer
                        ? '<strong>' . $row->kode_customer . '</strong>'
                        : '';

                    $jenisPembelian = $row->jenis_pembelian
                        ? '<div><small><strong>' . strtoupper($row->jenis_pembelian) . '</strong></small></div>'
                        : '';

                    $btn = '<a href="' . route('cetak.subsidi', $row->id) . '" target="_blank" class="mt-1 btn btn-warning btn-sm">
                Cetak Akad
            </a>';

                    return "$tglFinal<br>$kode<br>$jenisPembelian$btn";
                })

                ->editColumn('id_marketing', function ($row) {
                    $namaMarketing = $row->marketing->nama_marketing ?? '<span class="badge bg-danger"> ' . 'None Marketing' . '</span>';

                    return $namaMarketing;
                })

                ->editColumn('id_lokasi', function ($row) {
                    if ($row->kavling->count() == 0) {
                        return '-';
                    }

                    $output = [];
                    foreach ($row->kavling as $item) {
                        $namaLokasi = $item->lokasi->nama_kavling ?? '-';
                        $kodeKavling = $item->kode_kavling ?? '-';

                        $output[] = '<strong>' . $namaLokasi . '</strong><br> ' . $kodeKavling;
                    }

                    return implode('<hr style="margin: 5px 0; border-top: 1px dashed #ccc;">', $output);
                })

                ->editColumn('id_status_progres', function ($row) {
                    $status = $row->progres->status_progres ?? '-';
                    $ketCashback = $row->progres->ket_cashback ?? '';

                    $badgeColors = [
                        'BF' => 'warning',
                        'WAWANCARA' => 'secondary',
                        'SP3K' => 'success',
                        'AKAD' => 'info',
                        'SERAH TERIMA' => 'dark',
                    ];

                    if (array_key_exists($status, $badgeColors)) {
                        $statusDisplay = '<span class="badge bg-' . $badgeColors[$status] . '">' . $status . '</span>';
                    } else {
                        $statusDisplay = $status;
                    }

                    $cashbackText = $ketCashback ? '<br><small>' . $ketCashback . '</small>' : '';

                    return $statusDisplay . $cashbackText;
                })

                ->editColumn('nama_lengkap', function ($row) {
                    $nama = '<strong>' . $row->nama_lengkap . '</strong>';
                    $wa = $row->no_wa ?? '-';
                    $ktp = $row->no_ktp ? '<span class="badge bg-info">NIK: ' . $row->no_ktp . '</span>' : '';
                    return "$nama<br>$wa<br>$ktp";
                })

                ->addColumn('action', function ($row) use ($permissions): string {
                    $editUrl = route('customer.edit', $row->id);
                    $deleteUrl = route('customer.destroy', $row->id);
                    $btn = '<div class="text-center">';

                    if ($permissions['edit']) {
                        $btn .= '<a href="' . e($editUrl) . '" class="btn btn-primary btn-sm" id="edit-button">
                        Edit
                        </a>';
                    }

                    if ($permissions['hapus']) {
                        $btn .= '<form action="' . e($deleteUrl) . '" method="POST" style="display:inline;">
                            ' . csrf_field() . method_field('DELETE') . '
                            <button type="submit" class="delete-button btn btn-danger btn-sm">
                                Hapus
                            </button>
                        </form>';
                    }

                    $btn .= '</div>';
                    return $btn;
                })

                ->rawColumns([
                    'tgl_terima',
                    'nama_lengkap',
                    'id_marketing',
                    'id_lokasi',
                    'id_status_progres',
                    'action'
                ])

                ->filter(function ($row) use ($request) {
                    if ($request->has('search.value')) {
                        $searchValue = $request->input('search.value');

                        $row->where('nama_lengkap', 'like', "%{$searchValue}%");
                    }
                })
                ->make(true);
        }

        $lokasi = LokasiKavling::select('id', 'nama_kavling')->orderBy('nama_kavling', 'ASC')->get();

        return view('admin.customer.customer.index', compact('permissions', 'lokasi'));
    }

    public function create()
    {
        $cust = null;
        $marketing = Marketing::all();
        $progres = ListPenjualan::all();
        $lokasi = LokasiKavling::all();
        $bankList = Bank::all();

        return view('admin.customer.customer.create', compact('cust', 'marketing', 'progres', 'lokasi', 'bankList'));
    }

    public function getKavling(Request $request, $idLokasi)
    {
        $customerId = $request->query('customer_id');

        $data = KavlingPeta::select('id', 'kode_kavling')
            ->where('id_lokasi', $idLokasi)
            ->where(function ($query) use ($customerId) {
                $query->doesntHave('customer');

                if ($customerId) {
                    $query->orWhereHas('customer', function ($q) use ($customerId) {
                        $q->where('id', $customerId);
                    });
                }
            })
            ->get();

        return response()->json($data);
    }

    public function getHargaKavling($ids)
    {
        $idArray = explode(',', $ids);
        $totalHarga = KavlingPeta::whereIn('id', $idArray)->sum('hrg_jual');

        $formatted = 'Rp. ' . number_format($totalHarga, 0, ',', '.');

        return response()->json([
            'hrg_jual' => $totalHarga,
            'formatted' => $formatted
        ]);
    }

    public function store(Request $request)
    {
        $request->merge([
            'pembayaran_booking' => $request->pembayaran_booking ? (int) str_replace(['.', ','], '', $request->pembayaran_booking) : 0,
            'jumlah_pembayaran' => $request->jumlah_pembayaran ? (int) str_replace(['.', ','], '', $request->jumlah_pembayaran) : 0,
            'inhouse_perbulan' => $request->inhouse_perbulan ? (int) str_replace(['.', ','], '', $request->inhouse_perbulan) : 0,
            'dp_kredit' => $request->dp_kredit ? (int) str_replace(['.', ','], '', $request->dp_kredit) : 0,
            'discount' => $request->discount ? (int) str_replace(['.', ','], '', $request->discount) : 0,
        ]);

        $request->validate([
            'tgl_terima'          => 'required|date',
            'id_lokasi'           => 'required',
            'id_kavling'          => 'required|array',
            'id_kavling.*'        => 'exists:kavling_peta,id',
            'id_status_progres'   => 'required',
            'nama_lengkap'        => 'required',
            'no_ktp'              => 'required',
            'no_ktp_p'            => 'nullable',
            'jenis_kelamin'       => 'nullable',
            'tempat_lahir'        => 'nullable',
            'tgl_lahir'           => 'required|date',
            'alamat'              => 'required',
            'alamat_domisili'     => 'nullable',
            'no_telp'             => 'required',
            'email'               => 'nullable|email',
            'npwp'                => 'nullable',
            'pekerjaan'           => 'nullable',
            'penghasilan'         => 'nullable',
            'nama_saudara'        => 'nullable',
            'no_telp_saudara'     => 'nullable',
            'kode_token'          => 'nullable',
            'id_marketing'        => 'nullable',
            'id_admin_pemberkasan' => 'nullable',
            'keterangan_stt'      => 'nullable',
            'ket_reject'          => 'nullable',
            'id_bank'             => 'required|exists:bank,id',
            'hrg_jual'           => 'required|numeric',
            'cashback'            => 'nullable|numeric',
            'harga_bersih'        => 'nullable|numeric',
            'referal_fee'         => 'nullable|numeric',
            'jenis_pembelian'     => 'required',
            'pembayaran_booking'  => 'nullable',
            'tgl_batas_booking'   => 'nullable|date',
            'sisa_bayar_ajb'      => 'nullable|numeric',
            'an_surat_cash'       => 'nullable',
            'jumlah_bulan_x'     => 'nullable',
            'dp_kredit'           => 'nullable|numeric',
            'inhouse_perbulan' => 'nullable|numeric',
            'inhouse_tenor'      => 'nullable|numeric',
            'inhouse_jatuh_tempo' => 'nullable|date',
        ], [
            'tgl_terima.required'        => 'Tanggal Terima wajib diisi!',
            'tgl_terima.date'            => 'Tanggal Terima harus berupa tanggal yang valid!',
            'id_lokasi.required'         => 'Lokasi wajib diisi!',
            'id_kavling.required'        => 'Kavling wajib diisi!',
            'id_kavling.array'           => 'Format Kavling tidak valid.',
            'id_kavling.*.exists'        => 'Salah satu ID Kavling tidak ditemukan.',
            'id_status_progres.required' => 'Status progres wajib diisi!',
            'nama_lengkap.required'      => 'Nama lengkap wajib diisi!',
            'no_ktp.required'            => 'Nomor KTP wajib diisi!',
            'tgl_lahir.date'             => 'Tanggal Lahir harus berupa tanggal yang valid!',
            'tgl_lahir.required'         => 'Tanggal Lahir wajib diisi!',
            'alamat.required'            => 'Alamat wajib diisi!',
            'no_telp.required'           => 'Nomor telepon wajib diisi!',
            'no_wa.numeric'              => 'Nomor WhatsApp harus berupa angka!',
            'email.email'                => 'Email harus berupa alamat email yang valid!',
            'id_freelance.integer'       => 'Freelance harus berupa angka bulat!',
            'id_bank.required'           => 'Bank wajib diisi!',
            'id_bank.exists'             => 'Bank tidak ditemukan!',
            'hrg_jual.required'         => 'Harga tanah kavling wajib diisi!',
            'hrg_jual.numeric'          => 'Harga tanah kavling harus berupa angka!',
            'cashback.numeric'           => 'Cashback harus berupa angka!',
            'harga_bersih.numeric'       => 'Harga bersih harus berupa angka!',
            'referal_fee.numeric'        => 'Referral fee harus berupa angka!',
            'jenis_pembelian.required'   => 'Jenis pembelian wajib diisi!',
            'tgl_batas_booking.date'     => 'Tanggal batas booking harus berupa tanggal yang valid!',
            'sisa_bayar_ajb.numeric'     => 'Sisa bayar AJB harus berupa angka!',
            'dp_kredit.numeric'          => 'DP kredit harus berupa angka!',
            'inhouse_perbulan.numeric' => 'Cicilan kredit harus berupa angka!',
            'inhouse_tenor.numeric'     => 'Lama cicilan kredit harus berupa angka!',
            'inhouse_jatuh_tempo.date'   => 'Tanggal tempo cicilan pertama harus berupa tanggal yang valid!',
        ]);

        DB::beginTransaction();
        try {
            $prefix = LokasiKavling::where('id', $request->id_lokasi)
                ->value('nama_singkat');

            $prefix = $prefix ?: 'GDI';

            $latest = Customer::where('kode_customer', 'LIKE', $prefix . '-%')
                ->latest('kode_customer')
                ->sharedLock()
                ->first();

            if ($latest && preg_match('/' . preg_quote($prefix, '/') . '-(\d+)/', $latest->kode_customer, $match)) {
                $number = (int)$match[1] + 1;
                $newKode = $prefix . '-' . str_pad($number, 4, '0', STR_PAD_LEFT);
            } else {
                $newKode = $prefix . '-0001';
            }

            $data = [
                'kode_customer'         => $newKode,
                'id_lokasi'             => $request->id_lokasi,
                'id_status_progres'     => $request->id_status_progres,
                'nama_lengkap'          => $request->nama_lengkap,
                'no_ktp'                => $request->no_ktp,
                'no_ktp_p'              => $request->no_ktp_p ?? '',
                'no_kk'                 => $request->no_kk ?? '',
                'jenis_kelamin'         => $request->jenis_kelamin ?? '',
                'tempat_lahir'          => $request->tempat_lahir ?? '',
                'tgl_lahir'             => $request->tgl_lahir ?? null,
                'alamat'                => $request->alamat,
                'alamat_domisili'       => $request->alamat_domisili ?? '',
                'no_telp'               => $request->no_telp ?? '',
                'no_wa'                 => $request->no_telp ?? '',
                'email'                 => $request->email ?? '',
                'npwp'                  => $request->npwp ?? null,
                'pekerjaan'             => $request->pekerjaan ?? '',
                'penghasilan'           => $request->penghasilan ?? 0,
                'nama_saudara'          => $request->nama_saudara ?? '',
                'no_telp_saudara'       => $request->no_telp_saudara ?? '',
                'ket_cashback'          => $request->ket_cashback ?? '',
                'kode_token'            => $request->kode_token ?? '',
                'id_marketing'          => $request->id_marketing ?? 0,
                'id_admin_pemberkasan'  => $request->id_admin_pemberkasan ?? 0,
                'keterangan_stt'        => $request->keterangan_stt ?? '',
                'ket_reject'            => $request->ket_reject ?? '',
                'id_bank'               => $request->id_bank ?? 0,
                'cashback'              => $request->cashback ?? 0,
                'discount'              => $request->discount ?? 0,
                'harga_bersih'          => $request->hrg_jual - ($request->discount ?? 0),
                'referal_fee'           => $request->referal_fee ?? 0,
                'jenis_pembelian'       => $request->jenis_pembelian,
                'pembayaran_booking'    => $request->pembayaran_booking ?? 0,
                'tgl_batas_booking'     => $request->tgl_batas_booking ?? null,
                'sisa_bayar_ajb'        => $request->sisa_bayar_ajb ?? 0,
                'an_surat_cash'         => $request->an_surat_cash ?? '',
                'jumlah_bulan_x'       => $request->jumlah_bulan_x ?? 0,
                'dp_kredit'             => $request->dp_kredit ?? 0,
                'inhouse_perbulan'   => $request->inhouse_perbulan ?? 0,
                'inhouse_tenor'        => $request->inhouse_tenor ?? 0,
                'inhouse_jatuh_tempo'   => $request->inhouse_jatuh_tempo ?? null,
            ];

            $customer = Customer::create($data);
            $tglNow = Carbon::now('Asia/Jakarta')->toDateString();

            $idKavlingArray = $request->id_kavling;
            $totalHrgJual = $request->hrg_jual;

            $kavlingPeta = KavlingPeta::whereIn('id', $idKavlingArray)->get();

            $pivotData = [];
            foreach ($kavlingPeta as $kavling) {
                $pivotData[$kavling->id] = [
                    'tgl_terima' => $request->tgl_terima,
                    'hrg_rumah'  => $kavling->hrg_jual,
                ];
            }

            $customer->kavling()->attach($pivotData);

            $customer->load('kavling', 'lokasiKavling');

            if ($request->jenis_pembelian == "Cash Keras") {
                $id_bank = $request->id_bank ?? 0;

                $nominal_piutang = $request->hrg_jual - ($request->discount ?? 0);
                $terbayar_kasar = $request->jumlah_pembayaran ?? 0;

                if ($terbayar_kasar < $nominal_piutang) {
                    DB::rollBack();
                    return response()->json([
                        'success' => false,
                        'message' => 'Untuk pembelian Cash Keras, Jumlah Pembayaran harus sama dengan Harga Jual (' . number_format($nominal_piutang) . ')',
                    ], 422);
                }

                $kavlingDesc = $customer->kavling->map(function ($k) {
                    return $k->kode_kavling;
                })->implode(', ');
                $lokasiNama = $customer->lokasiKavling->nama_kavling ?? 'Lokasi Tidak Ditemukan';
                $tipeBangunan = $customer->kavling->first()->tipe_bangunan ?? '0';
                $deskripsiPiutang = "Harga Tanah Kavling di $lokasiNama Blok $kavlingDesc";

                $pt = [
                    'id_customer' => $customer->id,
                    'id_bank' => $id_bank,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal_piutang,
                    'lampiran' => '',
                    'status' => 2,
                    'terbayar' => $nominal_piutang,
                    'sisa_bayar' => 0,
                    'tgl_pelunasan' => $tglNow,
                ];

                $piutang = Piutang::create($pt);

                $p2 = [
                    'id_bank' => $id_bank,
                    'id_piutang' => $piutang->id,
                    'id_customer' => $customer->id,
                    'tanggal' => $tglNow,
                    'nominal' => $terbayar_kasar,
                    'lampiran' => '',
                    'id_kategori_transaksi' => 5,
                    'keterangan' => $deskripsiPiutang,
                ];
                Pemasukan::create($p2);
            } elseif ($request->jenis_pembelian == "Booking") {
                $id_bank = $request->id_bank ?? 0;

                $terbayar = $request->pembayaran_booking ?? 0;
                $nominal = $request->hrg_jual - ($request->discount ?? 0);
                $sisa = $nominal - $terbayar;

                $status = ($sisa <= 0) ? 2 : 1;
                $sisa_bayar = max($sisa, 0);

                $kavlingDesc = $customer->kavling->map(function ($k) {
                    return $k->kode_kavling;
                })->implode(', ');
                $lokasiNama = $customer->lokasiKavling->nama_kavling ?? 'Lokasi Tidak Ditemukan';
                $tipeBangunan = $customer->kavling->first()->tipe_bangunan ?? 'Tipe Standar';
                $deskripsiPiutang = "Harga Tanah Kavling di $lokasiNama Blok $kavlingDesc";

                $pt = [
                    'id_bank' => $id_bank,
                    'id_customer' => $customer->id,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal,
                    'lampiran' => '',
                    'status' => $status,
                    'terbayar' => $terbayar,
                    'sisa_bayar' => $sisa_bayar,
                ];

                $piutang = Piutang::create($pt);

                $p1 = [
                    'id_bank' => $id_bank,
                    'id_piutang' => $piutang->id,
                    'id_customer' => $customer->id,
                    'tanggal' => $tglNow,
                    'nominal' => $terbayar,
                    'lampiran' => '',
                    'id_kategori_transaksi' => 1,
                    'keterangan' => "Booking Fee $deskripsiPiutang",
                ];
                Pemasukan::create($p1);
            } else if ($request->jenis_pembelian == 'Kredit') {
                $id_bank = $request->id_bank ?? 0;

                $nominal = $request->hrg_jual - ($request->discount ?? 0);

                $status = 1;

                $kavlingDesc = $customer->kavling->map(function ($k) {
                    return $k->kode_kavling;
                })->implode(', ');
                $lokasiNama = $customer->lokasiKavling->nama_kavling ?? 'Lokasi Tidak Ditemukan';
                $tipeBangunan = $customer->kavling->first()->tipe_bangunan ?? 'Tipe Standar';
                $deskripsiPiutang = "Harga Tanah Kavling di $lokasiNama Blok $kavlingDesc";

                $pt = [
                    'id_bank' => $id_bank,
                    'id_customer' => $customer->id,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal,
                    'lampiran' => '',
                    'status' => $status,
                    'terbayar' => 0,
                    'sisa_bayar' => $nominal,
                ];

                $piutang = Piutang::create($pt);
            }

            PersyaratanLegal::create([
                'id_customer' => $customer->id,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil disimpan',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan data: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function edit($id)
    {
        $cust = Customer::with(['kavling.lokasi', 'lokasi'])->find($id);

        if (!$cust) {
            return redirect()->route('customer.index')->with('error', 'Data tidak ditemukan');
        }

        $marketing = Marketing::all();
        $progres = ListPenjualan::all();
        $lokasi = LokasiKavling::all();
        $bankList = Bank::all();
        $transaksi = Pemasukan::where('id_customer', $id)
            ->where('id_kategori_transaksi', [5, 1])
            ->first();

        $selectedKavlingIds = $cust->kavling->pluck('id')->map(fn($id) => (string)$id)->toArray();

        $currentKavlings = $cust->kavling;

        return view(
            'admin.customer.customer.edit',
            compact('cust', 'marketing', 'progres', 'lokasi', 'bankList', 'selectedKavlingIds', 'currentKavlings', 'transaksi')
        );
    }

    public function update(Request $request, $id)
    {
        $request->merge([
            'pembayaran_booking' => $request->pembayaran_booking ? (int) str_replace(['.', ','], '', $request->pembayaran_booking) : 0,
            'jumlah_pembayaran' => $request->jumlah_pembayaran ? (int) str_replace(['.', ','], '', $request->jumlah_pembayaran) : 0,
            'inhouse_perbulan' => $request->inhouse_perbulan ? (int) str_replace(['.', ','], '', $request->inhouse_perbulan) : 0,
            'dp_kredit' => $request->dp_kredit ? (int) str_replace(['.', ','], '', $request->dp_kredit) : 0,
            'discount' => $request->discount ? (int) str_replace(['.', ','], '', $request->discount) : 0,
        ]);

        $request->validate([
            'tgl_terima'          => 'required|date',
            'id_status_progres'   => 'required',
            'nama_lengkap'        => 'required',
            'no_ktp'              => 'required',
            'no_ktp_p'            => 'nullable',
            'jenis_kelamin'       => 'nullable',
            'tempat_lahir'        => 'nullable',
            'tgl_lahir'           => 'required|date',
            'alamat'              => 'required',
            'alamat_domisili'     => 'nullable',
            'no_telp'             => 'required',
            'email'               => 'nullable|email',
            'npwp'                => 'nullable',
            'pekerjaan'           => 'nullable',
            'penghasilan'         => 'nullable',
            'nama_saudara'        => 'nullable',
            'no_telp_saudara'     => 'nullable',
            'kode_token'          => 'nullable',
            'id_marketing'        => 'nullable',
            'id_admin_pemberkasan' => 'nullable',
            'keterangan_stt'      => 'nullable',
            'ket_reject'          => 'nullable',
            'hrg_jual'            => 'required|numeric',
            'cashback'            => 'nullable|numeric',
            'harga_bersih'        => 'nullable|numeric',
            'referal_fee'         => 'nullable|numeric',
            'jenis_pembelian'     => 'required',
            'pembayaran_booking'  => 'nullable',
            'tgl_batas_booking'   => 'nullable|date',
            'sisa_bayar_ajb'      => 'nullable|numeric',
            'an_surat_cash'       => 'nullable',
            'jumlah_bulan_x'      => 'nullable',
            'dp_kredit'           => 'nullable|numeric',
            'inhouse_perbulan'    => 'nullable|numeric',
            'inhouse_tenor'       => 'nullable|numeric',
            'inhouse_jatuh_tempo' => 'nullable|date',
        ], [
            'tgl_terima.required'           => 'Tanggal Terima wajib diisi!',
            'tgl_terima.date'               => 'Tanggal Terima harus berupa tanggal yang valid!',
            'id_status_progres.required'    => 'Status progres wajib diisi!',
            'nama_lengkap.required'         => 'Nama lengkap wajib diisi!',
            'no_ktp.required'               => 'Nomor KTP wajib diisi!',
            'tgl_lahir.date'                => 'Tanggal Lahir harus berupa tanggal yang valid!',
            'tgl_lahir.required'            => 'Tanggal Lahir wajib diisi!',
            'alamat.required'               => 'Alamat wajib diisi!',
            'no_telp.required'              => 'Nomor telepon wajib diisi!',
            'email.email'                   => 'Email harus berupa alamat email yang valid!',
            'hrg_jual.required'             => 'Harga tanah kavling wajib diisi!',
            'hrg_jual.numeric'              => 'Harga tanah kavling harus berupa angka!',
            'jenis_pembelian.required'      => 'Jenis pembelian wajib diisi!',
            'tgl_batas_booking.date'        => 'Tanggal batas booking harus berupa tanggal yang valid!',
            'inhouse_perbulan.numeric'      => 'Cicilan kredit harus berupa angka!',
            'inhouse_tenor.numeric'         => 'Lama cicilan kredit harus berupa angka!',
        ]);

        $customer = Customer::with('kavling.lokasi', 'lokasi')->findOrFail($id);
        $tglNow = Carbon::now('Asia/Jakarta')->toDateString();

        DB::beginTransaction();
        try {
            $dataToUpdate = [
                'tgl_terima'          => $request->tgl_terima,
                'id_status_progres'   => $request->id_status_progres,
                'nama_lengkap'        => $request->nama_lengkap,
                'no_ktp'              => $request->no_ktp,
                'no_ktp_p'            => $request->no_ktp_p ?? '',
                'jenis_kelamin'       => $request->jenis_kelamin ?? '',
                'tempat_lahir'        => $request->tempat_lahir ?? '',
                'tgl_lahir'           => $request->tgl_lahir ?? null,
                'alamat'              => $request->alamat,
                'alamat_domisili'     => $request->alamat_domisili ?? '',
                'no_telp'             => $request->no_telp ?? '',
                'no_wa'               => $request->no_telp ?? '',
                'email'               => $request->email ?? '',
                'npwp'                => $request->npwp ?? null,
                'pekerjaan'           => $request->pekerjaan ?? '',
                'penghasilan'         => $request->penghasilan ?? 0,
                'nama_saudara'        => $request->nama_saudara ?? '',
                'no_telp_saudara'     => $request->no_telp_saudara ?? '',
                'ket_cashback'        => $request->ket_cashback ?? '',
                'kode_token'          => $request->kode_token ?? '',
                'id_marketing'        => $request->id_marketing ?? 0,
                'id_admin_pemberkasan' => $request->id_admin_pemberkasan ?? 0,
                'keterangan_stt'      => $request->keterangan_stt ?? '',
                'ket_reject'          => $request->ket_reject ?? '',
                'hrg_jual'            => $request->hrg_jual,
                'cashback'            => $request->cashback ?? 0,
                'discount'            => $request->discount ?? 0,
                'harga_bersih'        => $request->hrg_jual - ($request->discount ?? 0),
                'referal_fee'         => $request->referal_fee ?? 0,
                'jenis_pembelian'     => $request->jenis_pembelian,
                'pembayaran_booking'  => $request->pembayaran_booking ?? 0,
                'tgl_batas_booking'   => $request->tgl_batas_booking ?? null,
                'sisa_bayar_ajb'      => $request->sisa_bayar_ajb ?? 0,
                'an_surat_cash'       => $request->an_surat_cash ?? '',
                'jumlah_bulan_x'      => $request->jumlah_bulan_x ?? 0,
                'dp_kredit'           => $request->dp_kredit ?? 0,
                'inhouse_perbulan'    => $request->inhouse_perbulan ?? 0,
                'inhouse_tenor'       => $request->inhouse_tenor ?? 0,
                'inhouse_jatuh_tempo' => $request->inhouse_jatuh_tempo ?? null,
            ];

            unset($dataToUpdate['id_lokasi']);
            unset($dataToUpdate['id_kavling']);

            $customer->update($dataToUpdate);

            $customer->load('kavling.lokasi', 'lokasi');
            $kavlingPertama = $customer->kavling->first();

            $kavlingDesc = $customer->kavling->pluck('kode_kavling')->implode(', ');
            $lokasiNama = $customer->lokasi->nama_kavling ?? 'Lokasi Tidak Ditemukan';
            $tipeBangunan = $kavlingPertama->tipe_bangunan ?? 'Tipe Standar';
            $deskripsiPiutang = "Harga Tanah Kavling di $lokasiNama Blok $kavlingDesc";

            Piutang::where('id_customer', $customer->id)->delete();
            Pemasukan::where('id_customer', $customer->id)
                ->whereIn('id_kategori_transaksi', [1, 5])
                ->delete();

            if ($request->jenis_pembelian == "Cash Keras") {
                $id_bank = $request->id_bank ?? 0;
                $nominal_piutang = $request->hrg_jual - ($request->discount ?? 0);
                $terbayar_kasar = $request->jumlah_pembayaran ?? 0;

                if ($terbayar_kasar < $nominal_piutang) {
                    DB::rollBack();
                    return response()->json([
                        'success' => false,
                        'message' => 'Untuk pembelian Cash Keras, Jumlah Pembayaran harus sama dengan Harga Jual (' . number_format($nominal_piutang) . ')',
                    ], 422);
                }

                $pt = [
                    'id_customer' => $customer->id,
                    'id_bank' => $id_bank,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal_piutang,
                    'status' => 2,
                    'lampiran' => '',
                    'terbayar' => $nominal_piutang,
                    'sisa_bayar' => 0,
                    'tgl_pelunasan' => $tglNow,
                ];
                $piutang = Piutang::create($pt);

                $p2 = [
                    'id_bank' => $id_bank,
                    'id_piutang' => $piutang->id,
                    'id_customer' => $customer->id,
                    'tanggal' => $tglNow,
                    'nominal' => $terbayar_kasar,
                    'lampiran' => '',
                    'id_kategori_transaksi' => 5,
                    'keterangan' => $deskripsiPiutang,
                ];
                Pemasukan::create($p2);
            } elseif ($request->jenis_pembelian == "Booking") {
                $id_bank = $request->id_bank ?? 0;
                $terbayar = $request->pembayaran_booking ?? 0;
                $nominal = $request->hrg_jual - ($request->discount ?? 0);
                $sisa = $nominal - $terbayar;

                $status = ($sisa <= 0) ? 2 : 1;
                $sisa_bayar = max($sisa, 0);

                $pt = [
                    'id_bank' => $id_bank,
                    'id_customer' => $customer->id,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal,
                    'lampiran' => '',
                    'status' => $status,
                    'terbayar' => $terbayar,
                    'sisa_bayar' => $sisa_bayar,
                ];
                $piutang = Piutang::create($pt);

                $p1 = [
                    'id_bank' => $id_bank,
                    'id_piutang' => $piutang->id,
                    'id_customer' => $customer->id,
                    'tanggal' => $tglNow,
                    'nominal' => $terbayar,
                    'lampiran' => '',
                    'id_kategori_transaksi' => 1,
                    'keterangan' => "Booking Fee $deskripsiPiutang",
                ];
                Pemasukan::create($p1);
            } elseif ($request->jenis_pembelian == "Kredit") {
                $id_bank = $request->id_bank ?? 0;
                $nominal = $request->hrg_jual - ($request->discount ?? 0);

                $pt = [
                    'id_bank' => $id_bank,
                    'id_customer' => $customer->id,
                    'tanggal_piutang' => $tglNow,
                    'deskripsi' => $deskripsiPiutang,
                    'nominal' => $nominal,
                    'lampiran' => '',
                    'status' => 1,
                    'terbayar' => 0,
                    'sisa_bayar' => $nominal,
                ];

                Piutang::create($pt);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil diperbarui',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Gagal memperbarui data: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function cetakData(Request $request)
    {
        $query = Customer::with(['marketing', 'lokasi', 'kavling', 'progres']);

        if ($request->lokasi) {
            $query->where('id_lokasi', $request->lokasi);
        }

        $data = $query->get();

        $namaKavling = '';
        if ($request->lokasi) {
            $namaKavling = LokasiKavling::where('id', $request->lokasi)
                ->value('nama_kavling') ?? '';
        }

        // 2. Setup PDF
        $pdf = new TCPDF('P', 'mm', 'A4');
        $pdf->SetTitle('Data Customer');
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);
        $pdf->AddPage();

        $pengaturanMedia = KonfigurasiMedia::where('jenis_data', 'kop surat')->first();
        $kopSuratPath = null;

        if ($pengaturanMedia && $pengaturanMedia->nama_file) {
            $cekPath = public_path('config_media/' . $pengaturanMedia->nama_file);
            if (file_exists($cekPath)) {
                $kopSuratPath = $cekPath;
            }
        }

        if ($kopSuratPath) {
            // Tampilkan Gambar Full Width (210mm) di (0,0)
            $pdf->Image($kopSuratPath, 0, 0, 210);
        } else {
            // Fallback: Logo Default
            $logoPath = public_path('assets/img/header.png');
            if (file_exists($logoPath)) {
                $pdf->Image($logoPath, 20, 5, 30);
            }
        }

        // --- GARIS PEMBATAS DIHAPUS SESUAI PERMINTAAN ---

        // 4. Judul Laporan
        // Kita beri jarak aman (Y=35) agar tidak menabrak gambar kop surat
        $pdf->SetY(35);

        $pdf->SetFont('Times', 'B', 12);
        $pdf->SetTextColor(218, 0, 0); // Warna Merah
        $pdf->Cell(190, 8, 'DATA CUSTOMER', 0, 1, 'C');

        // Sub-Judul Lokasi (Jika ada filter)
        if (!empty($namaKavling)) {
            $pdf->SetFont('Times', 'B', 10);
            $pdf->SetTextColor(0, 0, 0);
            $pdf->Cell(190, 5, 'Lokasi: ' . strtoupper($namaKavling), 0, 1, 'C');
        }

        $pdf->Ln(5);

        // 5. Tabel Data
        $pdf->SetFont('Times', 'B', 9);
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFillColor(252, 203, 53); // Warna Kuning

        $tableWidth = 165;
        $pageWidth = $pdf->getPageWidth();
        $startX = ($pageWidth - $tableWidth) / 2;

        $pdf->SetX($startX);
        $pdf->Cell(10, 7, 'NO', 1, 0, 'C', true);
        $pdf->Cell(45, 7, 'PEMOHON', 1, 0, 'L', true);
        $pdf->Cell(15, 7, 'UNIT', 1, 0, 'C', true);
        $pdf->Cell(25, 7, 'NO. TELP', 1, 0, 'C', true);
        $pdf->Cell(40, 7, 'MARKETING', 1, 0, 'L', true);
        $pdf->Cell(30, 7, 'STATUS', 1, 1, 'C', true);

        $pdf->SetFont('Times', '', 8);
        $no = 1;

        if ($data->count() > 0) {
            foreach ($data as $d) {
                // Perbaikan untuk relasi Many-to-Many: Menggabungkan kode kavling
                $unitKavling = $d->kavling->pluck('kode_kavling')->implode(', ');
                $unitKavling = !empty($unitKavling) ? $unitKavling : '-';

                $pdf->SetX($startX); // Reset X ke tengah setiap baris

                $pdf->Cell(10, 7, $no++, 1, 0, 'C');
                $pdf->Cell(45, 7, $d->nama_lengkap, 1, 0, 'L');
                $pdf->Cell(15, 7, $unitKavling, 1, 0, 'C'); // Menggunakan string gabungan
                $pdf->Cell(25, 7, (!empty($d->no_wa) ? $d->no_wa : ($d->no_telp ?? '-')), 1, 0, 'C');
                $pdf->Cell(40, 7, ($d->marketing->nama_marketing ?? '-'), 1, 0, 'L');
                $pdf->Cell(30, 7, ($d->progres->status_progres ?? '-'), 1, 1, 'C');
            }
        } else {
            $pdf->SetX($startX);
            $pdf->Cell(165, 7, 'Tidak ada data ditemukan', 1, 1, 'C');
        }

        $pdf->Output('data_customer.pdf', 'I');
        exit;
    }

    public function cetakFormSubsidi($id_customer)
    {
        Carbon::setLocale('id');

        $customer = Customer::with(['kavling', 'lokasiKavling'])
            ->findOrFail($id_customer);

        $konfigurasi = KonfigurasiAplikasi::first();

        $alamat = $konfigurasi->alamat ?? '-';
        $email = $konfigurasi->email ?? '-';
        $no_telp_dev = $konfigurasi->telp ?? '-';

        $noKavling = $customer->kavling->pluck('no')->first() ?? '-';
        $kodeKavling = $customer->kavling->pluck('kode_kavling')->implode(', ') ?? '-';
        $luasTanah = $customer->kavling->sum('luas_tanah');
        $sumHrgKavling = $customer->kavling->sum('hrg_jual');

        // Net Harga Jual (Gross Kavling - Discount)
        $netHargaJual = $sumHrgKavling - ($customer->discount ?? 0);

        // DP Logic
        $dpTable = $customer->dp_kredit ?? 0;
        $booking = $customer->pembayaran_booking ?? 0;
        $totalDP = $dpTable + $booking;

        $sisa = $netHargaJual - $totalDP;

        if ($sisa < 0) {
            $sisa = 0;
        }

        $templatePath = public_path('template/ppjb_template.docx');

        $templateProcessor = new TemplateProcessor($templatePath);

        $tanggalNow = Carbon::now();
        $bulanRomawi = $this->bulanRomawi($tanggalNow->month);
        $bulan = $tanggalNow->translatedFormat('F');
        $tahun = $tanggalNow->year;
        $hari = $tanggalNow->translatedFormat('l');
        $tanggal = $tanggalNow->translatedFormat('d');

        $lastNumber = Customer::count() + 1;
        $nomorUrut = str_pad($lastNumber, 3, '0', STR_PAD_LEFT);

        $templateProcessor->setValue('alamat', $alamat);
        $templateProcessor->setValue('email', $email);
        $templateProcessor->setValue('no_telp_dev', $no_telp_dev);

        $templateProcessor->setValue('no', $nomorUrut);
        $templateProcessor->setValue('bulan_romawi', $bulanRomawi);
        $templateProcessor->setValue('tahun', $tahun);
        $templateProcessor->setValue('hari', $hari);
        $templateProcessor->setValue('tanggal', $tanggal);
        $templateProcessor->setValue('bulan', $bulan);

        $templateProcessor->setValue('nama_cust', $customer->nama_lengkap ?? '-');
        $templateProcessor->setValue('no_telp', $customer->no_telp ?? '-');
        $templateProcessor->setValue('alamat_ktp', $customer->alamat ?? '-');
        $templateProcessor->setValue('nik', $customer->no_ktp ?? '-');

        $templateProcessor->setValue('kode_kavling', $kodeKavling);
        $templateProcessor->setValue('no_kavling', $noKavling);
        $templateProcessor->setValue('luas_tanah', $luasTanah);

        $templateProcessor->setValue('harga_jual', number_format($netHargaJual, 0, ',', '.'));
        $templateProcessor->setValue('harga_jual_terbilang', $this->terbilang($netHargaJual));

        $templateProcessor->setValue('dp', number_format($totalDP, 0, ',', '.'));
        $templateProcessor->setValue('dp_terbilang', $this->terbilang($totalDP));

        $templateProcessor->setValue('sisa_bayar', number_format($sisa, 0, ',', '.'));
        $templateProcessor->setValue('sisa_bayar_terbilang', $this->terbilang($sisa));

        $templateProcessor->setValue('tenor', $customer->inhouse_tenor ?? 0);
        $templateProcessor->setValue('cicilan', number_format($customer->inhouse_perbulan ?? 0, 0, ',', '.'));

        $fileName = 'akad_' . $customer->id . '_' . $customer->nama_lengkap . '.docx';
        $savePath = storage_path('app/public/' . $fileName);
        $templateProcessor->saveAs($savePath);

        return response()->download($savePath)->deleteFileAfterSend(true);
    }

    private function terbilang($angka)
    {
        $f = new \NumberFormatter("id", \NumberFormatter::SPELLOUT);
        return ucwords($f->format($angka)) . ' Rupiah';
    }

    private function convertTanggal($number)
    {
        $huruf = ["", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas"];

        if ($number < 12) {
            return $huruf[$number];
        } elseif ($number < 20) {
            return $this->convertTanggal($number - 10) . " Belas";
        } elseif ($number < 100) {
            return $this->convertTanggal(floor($number / 10)) . " Puluh " . $this->convertTanggal($number % 10);
        } elseif ($number < 200) {
            return "Seratus " . $this->convertTanggal($number - 100);
        } elseif ($number < 1000) {
            return $this->convertTanggal(floor($number / 100)) . " Ratus " . $this->convertTanggal($number % 100);
        } elseif ($number < 2000) {
            return "Seribu " . $this->convertTanggal($number - 1000);
        } elseif ($number < 1000000) {
            return $this->convertTanggal(floor($number / 1000)) . " Ribu " . $this->convertTanggal($number % 1000);
        } elseif ($number < 1000000000) {
            return $this->convertTanggal(floor($number / 1000000)) . " Juta " . $this->convertTanggal($number % 1000000);
        }
    }

    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            $data = Customer::findOrFail($id);

            Pemasukan::where('id_customer', $data->id)->delete();
            Piutang::where('id_customer', $data->id)->delete();
            PersyaratanLegal::where('id_customer', $data->id)->delete();
            TransaksiKavling::where('id_customer', $data->id)->delete();

            $data->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil dihapus.',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error deleting customer: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Data gagal dihapus.',
                'error'  => $e->getMessage(),
            ], 500);
        }
    }

    private function bulanRomawi($bulan)
    {
        $romawi = [
            1  => 'I',
            2  => 'II',
            3  => 'III',
            4  => 'IV',
            5  => 'V',
            6  => 'VI',
            7  => 'VII',
            8  => 'VIII',
            9  => 'IX',
            10 => 'X',
            11 => 'XI',
            12 => 'XII',
        ];

        return $romawi[(int) $bulan] ?? '';
    }
}
