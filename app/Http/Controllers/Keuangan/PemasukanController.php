<?php
namespace App\Http\Controllers\Keuangan;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Pengaturan\HakAksesController;
use App\Models\Bank;
use App\Models\KategoriTransaksi;
use App\Models\Pemasukan;
use App\Models\Piutang;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class PemasukanController extends Controller
{
    public function index(Request $request)
    {
        Carbon::setLocale('id');

        $permissions = HakAksesController::getUserPermissions();

        if ($request->ajax()) {
            $data = Pemasukan::orderBy('tanggal', 'desc')->orderBy('id', 'desc');

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('tanggal', function ($row) {
                    return Carbon::parse($row->tanggal)->translatedFormat('j F Y');
                })
                ->editColumn('nominal', function ($row) {
                    return '
                    <div class="d-flex justify-content-between harga-format w-100">
                        <span>Rp.</span>
                        <span>' . number_format($row->nominal, 0, ',', '.') . '</span>
                    </div>';
                })
                ->addColumn('rekening', function ($row) {
                    $bank = Bank::find($row->id_bank);
                    return $bank ? $bank->nama : 'Bank Tidak Diketahui';
                })
                ->addColumn('id_kategori_transaksi', function ($row) {
                    $kategori = KategoriTransaksi::find($row->id_kategori_transaksi);
                    $nama     = $kategori ? $kategori->kategori : 'Tidak Diketahui';
                    return $nama;
                })
                ->filter(function ($query) use ($request) {
                    if ($request->has('search') && $request->input('search.value') != '') {
                        $search = $request->input('search.value');

                        $bankIds     = Bank::where('nama', 'like', "%$search%")->pluck('id');
                        $kategoriIds = KategoriTransaksi::where('kategori', 'like', "%$search%")->pluck('id');

                        $query->where(function ($q) use ($bankIds, $kategoriIds, $search) {
                            $q->whereIn('id_bank', $bankIds)
                                ->orWhereIn('id_kategori_transaksi', $kategoriIds)
                                ->orWhere('keterangan', 'like', "%$search%");
                        });
                    }
                })
                ->filterColumn('tanggal', function ($query, $keyword) {
                    $query->where(function ($q) use ($keyword) {
                        $q->WhereDate('tanggal', 'like', "%{$keyword}%");
                    });
                })
                ->addColumn('action', function ($row) use ($permissions) {
                    $editUrl   = route('pemasukan.edit', $row->id);
                    $detailUrl = route('pemasukan.show', $row->id);
                    $deleteUrl = route('pemasukan.destroy', $row->id);

                    $disabledKategori = in_array($row->id_kategori_transaksi, [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]);

                    $btn = '<div class="d-flex justify-content-center">';

                    if ($row->id_hutang != 0 || $row->id_customer != 0 || $row->id_mutasi != 0) {
                        $btn .= '<button class="btn btn-primary btn-sm mx-1 detail-button"
            data-id="' . e($row->id) . '"
            data-url="' . e($detailUrl) . '">
            Detail
        </button>';
                    } else {
                        if ($permissions['edit']) {
                            $btn .= '<button class="btn btn-primary btn-sm mx-1 edit-button ' . ($disabledKategori ? 'disabled' : '') . '"
                data-id="' . e($row->id) . '"
                data-url="' . ($disabledKategori ? '#' : e($editUrl)) . '" ' . ($disabledKategori ? 'disabled' : '') . '>Edit</button>';
                        }
                    }

                    if ($permissions['hapus']) {
                        $btn .= '<form action="' . ($disabledKategori ? '#' : e($deleteUrl)) . '" method="POST" style="display:inline;">
        ' . csrf_field() . method_field('DELETE') . '
        <button type="submit" class="delete-button btn btn-danger btn-sm mx-1 ' . ($disabledKategori ? 'disabled' : '') . '" ' . ($disabledKategori ? 'disabled' : '') . '>
            Hapus
        </button>
        </form>';
                    }

                    $btn .= '</div>';
                    return $btn;
                })

                ->rawColumns(['action', 'tanggal', 'nominal', 'id_kategori_transaksi'])
                ->make(true);
        }

        $kategoriTransaksi = KategoriTransaksi::where('jenis_kategori', 'PEMASUKAN')
            ->whereNotIn('id', [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36])
            ->get();

        $kategoriTransaksiDetail = KategoriTransaksi::where('jenis_kategori', 'PEMASUKAN')
            ->whereIn('id', [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36])
            ->get();

        $PiutangList = Piutang::where('status', 1)->where('id_customer', 0)->get();

        $bankList = Bank::all();

        return view('admin.keuangan.pemasukan.index', compact('permissions', 'kategoriTransaksi', 'kategoriTransaksiDetail', 'PiutangList', 'bankList'));
    }

    public function edit($id)
    {
        $list = Pemasukan::findOrFail($id);

        return response()->json([
            'status' => 'success',
            'data'   => $list,
        ]);
    }

    public function show($id)
    {
        $list = Pemasukan::findOrFail($id);

        return response()->json([
            'status' => 'success',
            'data'   => $list,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'tanggal'               => 'required|date',
            'nominal'               => 'required',
            'id_kategori_transaksi' => 'required',
            'id_piutang'            => 'required_if:id_kategori_transaksi,6',
        ], [
            'tanggal.required'               => 'Tanggal wajib diisi.',
            'tanggal.date'                   => 'Tanggal harus berupa tanggal.',
            'nominal.required'               => 'Nominal wajib diisi.',
            'id_kategori_transaksi.required' => 'Kategori transaksi wajib dipilih.',
            'id_piutang.required_if'         => 'Piutang wajib dipilih',
        ]);

        if (! empty($request->id_piutang)) {
            $piutang = Piutang::find($request->id_piutang);

            if ($piutang) {
                $nominalInput = (int) str_replace('.', '', $request->nominal);

                if ($nominalInput > $piutang->sisa_bayar) {
                    return response()->json([
                        'errors' => ['nominal' => ['Nominal tidak boleh lebih besar dari sisa piutang.']],
                    ], 422);
                }
            }
        }

        $db = [
            'id_piutang'            => $request->id_piutang ?? 0,
            'id_hutang'             => 0,
            'id_invoice'            => 0,
            'id_mutasi'             => 0,
            'id_bank'               => 0,
            'tanggal'               => $request->tanggal,
            'nominal'               => str_replace('.', '', $request->nominal),
            'id_kategori_transaksi' => $request->id_kategori_transaksi,
            'keterangan'            => $request->keterangan ?? '',
            'lampiran'              => '',
        ];

        Pemasukan::create($db);

        if (! empty($request->id_piutang)) {
            $piutang = Piutang::find($request->id_piutang);

            if ($piutang) {
                $nominalBayar  = $piutang->terbayar + str_replace('.', '', $request->nominal);
                $sisaBayarBaru = $piutang->sisa_bayar - str_replace('.', '', $request->nominal);

                $updateData = [
                    'terbayar'   => $nominalBayar,
                    'sisa_bayar' => $sisaBayarBaru,
                ];

                if ($sisaBayarBaru == 0) {
                    $updateData['status']        = 2;
                    $updateData['tgl_pelunasan'] = Carbon::now();
                }

                $piutang->update($updateData);
            }
        }

        return response()->json(['status' => 'success']);
    }

    public function update(Request $request, $id)
    {
        $data = Pemasukan::findOrFail($id);

        $rules = [
            'tanggal' => 'required|date',
            'nominal' => 'required',
        ];

        if ($request->id_kategori_transaksi == 2) {
            $rules['id_kategori_transaksi'] = 'required';
        }

        $request->validate($rules, [
            'tanggal.required' => 'Tanggal wajib diisi.',
            'tanggal.date'     => 'Tanggal harus berupa tanggal.',
            'nominal.required' => 'Nominal wajib diisi.',
        ]);

        $db = [
            'tanggal'    => $request->tanggal,
            'keterangan' => $request->keterangan ?? '',
            'nominal'    => str_replace('.', '', $request->nominal),
        ];

        if ($data->id_kategori_transaksi == 6) {
            if ($request->id_piutang != $data->id_piutang) {
                $hutanglama = Piutang::find($data->id_piutang);
                if ($hutanglama) {
                    $hutanglama->update([
                        'terbayar'      => $hutanglama->terbayar - $data->nominal,
                        'sisa_bayar'    => $hutanglama->sisa_bayar + $data->nominal,
                        'status'        => 1,
                        'tgl_pelunasan' => null,
                    ]);
                }

                $hutangbaru = Piutang::find($request->id_piutang);
                if ($hutangbaru) {
                    $nominalBayar  = str_replace('.', '', $request->nominal);
                    $sisaBayarBaru = $hutangbaru->sisa_bayar - $nominalBayar;

                    $updateData = [
                        'terbayar'   => $nominalBayar,
                        'sisa_bayar' => $sisaBayarBaru,
                    ];

                    if ($sisaBayarBaru == 0) {
                        $updateData['status']        = 2;
                        $updateData['tgl_pelunasan'] = Carbon::now();
                    }

                    $hutangbaru->update($updateData);
                }
            } else {
                $hutanglama2 = Piutang::find($data->id_piutang);
                if ($hutanglama2) {
                    $hutanglama2->update([
                        'terbayar'      => $hutanglama2->terbayar - $data->nominal,
                        'sisa_bayar'    => $hutanglama2->sisa_bayar + $data->nominal,
                        'status'        => 1,
                        'tgl_pelunasan' => null,
                    ]);

                    $nominalBayar  = $hutanglama2->terbayar + str_replace('.', '', $request->nominal);
                    $sisaBayarBaru = $hutanglama2->sisa_bayar - str_replace('.', '', $request->nominal);

                    $updateData = [
                        'terbayar'   => $nominalBayar,
                        'sisa_bayar' => $sisaBayarBaru,
                    ];

                    if ($sisaBayarBaru == 0) {
                        $updateData['status']        = 2;
                        $updateData['tgl_pelunasan'] = Carbon::now();
                    }

                    $hutanglama2->update($updateData);
                }
            }
        }

        $data->update($db);

        return response()->json(['status' => 'success']);
    }

    public function destroy($id)
    {
        $data = Pemasukan::findOrFail($id);
        if (! empty($data->lampiran) && file_exists(public_path('assets/keuangan/pemasukan/' . $data->lampiran))) {
            unlink(public_path('assets/keuangan/pemasukan/' . $data->lampiran));
        }

        if ($data->id_piutang != 0) {
            $hutanglama = Piutang::find($data->id_piutang);
            if ($hutanglama) {
                $hutanglama->update([
                    'terbayar'      => $hutanglama->terbayar - $data->nominal,
                    'sisa_bayar'    => $hutanglama->sisa_bayar + $data->nominal,
                    'status'        => 1,
                    'tgl_pelunasan' => null,
                ]);
            }
        }

        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
