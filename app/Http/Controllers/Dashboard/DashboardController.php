<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\KavlingPeta;
use App\Models\ListPenjualan;
use App\Models\LokasiKavling;
use App\Models\Marketing;
use App\Models\Pemasukan;
use App\Models\Pembayaran;
use App\Models\Piutang;
use App\Models\ProgresUnitReady;
use App\Models\Tagihan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class DashboardController extends Controller
{
    public function index()
    {
        if (!Auth::check()) {
            return redirect()->route('login')->withError('Silahkan Login terlebih dahulu');
        }

        $dateNow = Carbon::now()->format('d F Y');

        $kuning = Customer::whereIn('id_status_progres', [1])->count();
        $hijau = Customer::whereIn('id_status_progres', [3])->count();
        $abu = Customer::where('id_status_progres', [18])->count();

        $customers = Customer::with(['piutangs', 'pemasukans'])->orderBy('id', 'desc')->get();

        $lunas = $customers->filter(function ($row) {
            $totalTagihan = $row->piutangs->sum('nominal');

            $totalBayar = $row->pemasukans

                ->where('keterangan', '!=', 'GANTI NAMA')

                ->sum('nominal');

            $sisa = $totalTagihan - $totalBayar;

            return $sisa == 0 && $totalTagihan > 0;
        });

        $totalLunas = $lunas->count();

        $status = ProgresUnitReady::find(3)->id;

        $totalLokasiReady = KavlingPeta::where('status_ready', $status)->count();

        $kolomStatus = ListPenjualan::where('status_progres', '!=', 'HOLD')
            ->where('stt_tampil', 1)
            ->orderBy('urutan', 'asc')
            ->get();

        $dataLokasi = LokasiKavling::whereIn('stt_tampil', [1, 3])
            ->orderByRaw("
                CASE
                    WHEN nama_kavling LIKE 'SIRANDU 1' THEN 1
                    WHEN nama_kavling LIKE 'SIRANDU 2' THEN 2
                    ELSE 3
                END
            ")
            ->get()
            ->map(function ($lokasi) use ($kolomStatus) {
            $id = $lokasi->id;

            $countKavlingBy = function ($callback) use ($id) {
                $query = Customer::whereHas('kavling', function ($q) use ($id) {
                    $q->where('id_lokasi', $id);
                });

                $callback($query);

                return $query->withCount(['kavling' => function ($q) use ($id) {
                    $q->where('id_lokasi', $id);
                }])->get()->sum('kavling_count');
            };

            $data = [
                'id' => $id,
                'nama' => $lokasi->nama_kavling,
                'nama_singk_1' => $lokasi->nama_singkat,
                'jumlah' => KavlingPeta::where('id_lokasi', $id)->count(),
                'cash' => $countKavlingBy(fn($q) => $q->whereIn('jenis_pembelian', ['Cash Keras', 'Cash Bertahap'])),
                'kredit' => $countKavlingBy(fn($q) => $q->where('jenis_pembelian', 'Kredit')),
                'hold' => $countKavlingBy(fn($q) => $q->where('id_status_progres', 19)),
            ];

            foreach ($kolomStatus as $status) {
                $key = strtolower(str_replace(' ', '_', $status->short_name));
                $data[$key] = $countKavlingBy(fn($q) => $q->where('id_status_progres', $status->id));
            }

            return $data;
        });

        $totalLokasi = [
            'jumlah' => 0,
            'hold'   => 0,
            'cash'   => 0,
            'kredit' => 0
        ];

        foreach ($kolomStatus as $status) {
            $key = strtolower(str_replace(' ', '_', $status->short_name));
            $totalLokasi[$key] = 0;
        }

        foreach ($dataLokasi as $lokasi) {
            $totalLokasi['jumlah'] += $lokasi['jumlah'];
            $totalLokasi['hold']   += $lokasi['hold'];
            $totalLokasi['cash']   += $lokasi['cash'];
            $totalLokasi['kredit'] += $lokasi['kredit'];

            foreach ($kolomStatus as $status) {
                $key = strtolower(str_replace(' ', '_', $status->short_name));
                $totalLokasi[$key] += $lokasi[$key] ?? 0;
            }
        }

        $totalData = 0;

        foreach ($dataLokasi as $lokasi) {
            $totalData += ($lokasi['bf'] ?? 0);
        }

        $kolomStatusReady = ProgresUnitReady::all();

        $dataLokasiReady = LokasiKavling::all()->map(function ($lokasi) use ($kolomStatusReady) {
            $id = $lokasi->id;
            $data = [
                'id'     => $id,
                'nama'   => $lokasi->nama_kavling,
                'jumlah' => KavlingPeta::where('id_lokasi', $id)->count(),
            ];

            foreach ($kolomStatusReady as $status) {
                $key = strtolower(str_replace(' ', '_', $status->keterangan));
                $data[$key] = KavlingPeta::where('id_lokasi', $id)
                    ->where('status_ready', $status->id)
                    ->count();
            }

            return $data;
        });

        $totalCustomer = Customer::count();

        $progresList = ListPenjualan::all();
        $dataProgres = [];

        $noProgres = 1;
        foreach ($progresList as $progres) {
            $jumlah = Customer::where('id_status_progres', $progres->id)->count();
            $persentase = $totalCustomer > 0 ? round(($jumlah / $totalCustomer) * 100) : 0;

            $dataProgres[] = [
                'no' => $noProgres++,
                'status_progres' => $progres->status_progres,
                'jumlah' => $jumlah,
                'persentase' => $persentase,
                'id_status_progres' => $progres->id,
            ];
        }

        $marketingList = Marketing::all();
        $dataMarketing = [];

        $noMarketing = 1;
        foreach ($marketingList as $marketing) {
            $jumlah = Customer::where('id_marketing', $marketing->id)->count();
            $persentase = $totalCustomer > 0 ? round(($jumlah / $totalCustomer) * 100) : 0;

            $dataMarketing[] = [
                'no' => $noMarketing++,
                'marketing' => $marketing->nama_marketing,
                'jumlah' => $jumlah,
                'persentase' => $persentase,
                'id_marketing' => $marketing->id,
            ];
        }

        return view('admin.dashboard.index', compact(
            'dateNow',
            'kuning',
            'hijau',
            'totalLunas',
            'totalLokasiReady',
            'kolomStatus',
            'dataLokasi',
            'totalLokasi',
            'totalData',
            'kolomStatusReady',
            'dataLokasiReady',
            'dataProgres',
            'dataMarketing'
        ));
    }

    public function totalUnit(Request $request)
    {
        if ($request->ajax()) {
            $data = KavlingPeta::select(
                'kavling_peta.*',
                'lokasi_kavling.nama_kavling as nama_cluster'
            )
                ->leftJoin('lokasi_kavling', 'kavling_peta.id_lokasi', '=', 'lokasi_kavling.id');

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
                        <p>luas bangunan: <strong>' . $row->luas_bangunan . ' m</strong></p>
                    ';
                })
                ->addColumn('harga', function ($row) {
                    return number_format($row->hrg_jual, 0, ',', '.');
                })
                ->addColumn('lokasi', function ($row) {
                    return $row->kode_kavling;
                })
                ->rawColumns(['panjang', 'lebar', 'luas'])
                ->make(true);
        }

        return view('admin.dashboard.totalUnit');
    }

    public function booking(Request $request)
    {
        if ($request->ajax()) {
            $data = Customer::with(['lokasi', 'progres'])
                ->whereIn('id_status_progres', [1, 22]);

            return datatables()->of($data)
                ->addIndexColumn()
                ->addColumn('id_lokasi', function ($row) {
                    return $row->lokasi ? $row->lokasi->nama_kavling : '-';
                })
                ->addColumn('id_status_progres', function ($row) {
                    return $row->progres ? $row->progres->status_progres : '-';
                })
                ->make(true);
        }

        return view('admin.dashboard.booking');
    }

    public function akad(Request $request)
    {
        if ($request->ajax()) {
            $data = Customer::with(['lokasi', 'progres'])
                ->whereIn('id_status_progres', [3]);

            return datatables()->of($data)
                ->addIndexColumn()
                ->addColumn('id_lokasi', function ($row) {
                    return $row->lokasi ? $row->lokasi->nama_kavling : '-';
                })
                ->addColumn('id_status_progres', function ($row) {
                    return $row->progres ? $row->progres->status_progres : '-';
                })
                ->make(true);
        }

        return view('admin.dashboard.akad');
    }

    public function lunasUnit(Request $request)
    {
        if ($request->ajax()) {

            $customers = Customer::with(['lokasi', 'progres', 'kavling', 'piutangs', 'pemasukans'])
                ->orderBy('id', 'desc')
                ->get();

            $data = $customers->filter(function ($row) {
                $totalTagihan = $row->piutangs->sum('nominal');

                $totalBayar = $row->pemasukans
                    ->where('keterangan', '!=', 'GANTI NAMA')
                    ->sum('nominal');

                $sisa = $totalTagihan - $totalBayar;

                return $sisa == 0 && $totalTagihan > 0;
            });

            return datatables()->of($data)
                ->addIndexColumn()
                ->addColumn('nama_lengkap', fn($row) => $row->nama_lengkap ?? '')
                ->addColumn('perumahan', fn($row) => $row->lokasi->nama_kavling ?? '')

                ->addColumn('kode_kavling', function ($row) {
                    $namaLokasi = $row->lokasi->nama_kavling ?? '-';
                    $kodeKavlingGabungan = $row->kavling->pluck('kode_kavling')->implode(', ');

                    return '<strong>' . $namaLokasi . '</strong><br> ' . ($kodeKavlingGabungan ?: '-');
                })

                ->addColumn('harga_jual', function ($row) {
                    $totalHargaJual = $row->kavling->sum(function ($kav) {
                        return $kav->pivot->hrg_rumah;
                    });
                    return number_format($totalHargaJual, 0, ',', '.');
                })

                ->addColumn('tanggal_lunas', function ($row) {
                    $totalTagihan = $row->piutangs->sum('nominal');
                    $pemasukansFiltered = $row->pemasukans->where('keterangan', '!=', 'GANTI NAMA');
                    $totalBayar = $pemasukansFiltered->sum('nominal');

                    if ($totalTagihan > 0 && $totalTagihan <= $totalBayar) {
                        $lastPayment = $pemasukansFiltered->sortByDesc('tanggal')->first();

                        return $lastPayment ? date('d-m-Y', strtotime($lastPayment->tanggal)) : '';
                    }
                    return '';
                })
                ->rawColumns(['kode_kavling'])
                ->make(true);
        }

        return view('admin.dashboard.lunas');
    }

    public function kavlingReady(Request $request)
    {
        if ($request->ajax()) {
            $statusReadyId = ProgresUnitReady::find(3)->id;

            $data = KavlingPeta::with('lokasi')
                ->where('status_ready', $statusReadyId)
                ->get();

            return datatables()->of($data)
                ->addIndexColumn()
                ->addColumn('lokasi', function ($row) {
                    $namaLokasi = $row->lokasi->nama_kavling ?? '-';
                    $kodeKavling = $row->kavling->kode_kavling ?? '-';
                    return '<strong>' . $namaLokasi . '</strong><br> ' . $kodeKavling;
                })
                ->addColumn('panjang', fn($row) => $row->panjang ?? '')
                ->addColumn('lebar', fn($row) => $row->lebar ?? '')
                ->addColumn('luas', fn($row) => $row->luas_tanah ?? '')
                ->addColumn('harga_jual', fn($row) => number_format($row->hrg_jual, 0, ',', '.'))
                ->make(true);
        }

        return view('admin.dashboard.kavling_ready');
    }

    public function showLokasiPenjualan(string $id)
    {
        $getName = LokasiKavling::where('id', $id)->first();
        $viewData = [
            'lokasi_id' => $id,
            'scope' => 'Lokasi Kavling',
            'nama' => $getName->nama_kavling ?? '-'
        ];

        $query = Customer::with(['progres', 'marketing', 'kavling'])
            ->whereHas('kavling', function ($q) use ($id) {
                $q->where('id_lokasi', $id);
            });

        if (request()->ajax()) {
            return DataTables::of($query)
                ->addIndexColumn()
                ->editColumn('id_status_progres', function ($row) {
                    return $row->progres->status_progres ?? '-';
                })
                ->editColumn('nama_lengkap', function ($row) {
                    return $row->nama_lengkap ?? '-';
                })
                ->editColumn('id_marketing', function ($row) {
                    return $row->marketing->nama_marketing ?? '-';
                })
                ->addColumn('kode_kavling', function ($row) use ($id) {
                    $kavlings = $row->kavling->where('id_lokasi', $id);
                    return $kavlings->pluck('kode_kavling')->implode(', ') ?: '-';
                })
                ->rawColumns(['kode_kavling'])
                ->make(true);
        }

        return view('admin.dashboard.statistik.lokasi', $viewData);
    }

    public function showCustomer(string $id)
    {
        $routeName = request()->route()->getName();
        $getName = [];
        $viewData = [];
        $query = Customer::query();

        if ($routeName === 'dashboard.customer-status-progres-show') {
            $query->where('id_status_progres', $id);
            $getName = ListPenjualan::where('id', $id)->first();
            $viewData = [
                'status_progres_id' => $id,
                'scope' => 'Progres Penjualan',
                'nama' => $getName->status_progres ?? '-'
            ];
        } elseif ($routeName === 'dashboard.customer-marketing-show') {
            $query->where('id_marketing', $id);
            $getName = Marketing::where('id', $id)->first();
            $viewData = [
                'marketing_id' => $id,
                'scope' => 'Marketing',
                'nama' => $getName->nama_marketing ?? '-'
            ];
        }

        if (request()->ajax()) {
            Carbon::setLocale('id');

            $program = $query->with(['marketing', 'lokasi', 'kavling', 'progres']);

            return DataTables::of($program)
                ->addIndexColumn()
                ->editColumn('tgl_terima', function ($row) {
                    $tgl = $row->tgl_terima ? Carbon::parse($row->tgl_terima)->translatedFormat('d F Y') : '-';
                    $kode = $row->kode_customer ? '<strong>' . $row->kode_customer . '</strong>' : '';
                    return "$tgl<br>$kode";
                })
                ->editColumn('id_marketing', function ($row) {
                    $namaMarketing = $row->marketing->nama_marketing ?? '<span class="badge bg-danger">None Marketing</span>';
                    $namaFreelance = $row->freelance->nama_freelance ?? null;
                    $freelanceBadge = $namaFreelance ? '<br><span class="badge bg-info">' . $namaFreelance . '</span>' : '';

                    return $namaMarketing . $freelanceBadge;
                })
                ->editColumn('id_lokasi', function ($row) {
                    $namaLokasi = $row->lokasi->nama_kavling ?? '-';
                    $kodeKavling = $row->kavling->pluck('kode_kavling')->implode(', ');

                    return '<strong>' . $namaLokasi . '</strong><br>' . ($kodeKavling ?: '-');
                })
                ->editColumn('id_status_progres', function ($row) {
                    $status = $row->progres->status_progres ?? '-';
                    $ketCashback = $row->ket_cashback ?? '';

                    $badgeColors = [
                        'BF' => 'warning',
                        'AKAD' => 'info',
                        'HOLD' => 'dark',
                        'LUNAS' => 'success',
                    ];

                    $badgeClass = $badgeColors[$status] ?? 'secondary';
                    $statusDisplay = '<span class="badge bg-' . $badgeClass . '">' . $status . '</span>';

                    $cashbackText = $ketCashback ? '<br><small>' . $ketCashback . '</small>' : '';
                    return $statusDisplay . $cashbackText;
                })
                ->editColumn('nama_lengkap', function ($row) {
                    $nama = '<strong>' . $row->nama_lengkap . '</strong>';
                    $wa = $row->no_wa ?? '-';
                    $ktp = $row->no_ktp ? '<span class="badge bg-info">NIK: ' . $row->no_ktp . '</span>' : '';

                    return "$nama<br>$wa<br>$ktp";
                })
                ->rawColumns([
                    'tgl_terima',
                    'nama_lengkap',
                    'id_marketing',
                    'id_lokasi',
                    'id_status_progres',
                    'kode_kavling'
                ])
                ->make(true);
        }

        return view('admin.dashboard.statistik.customer', $viewData);
    }
}
