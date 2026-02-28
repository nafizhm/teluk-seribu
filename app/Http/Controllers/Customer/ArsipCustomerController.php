<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Pengaturan\HakAksesController;
use App\Models\ArsipCustomer;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class ArsipCustomerController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $program = ArsipCustomer::query();
            $permissions = HakAksesController::getUserPermissions();

            return DataTables::of($program)
                ->addIndexColumn()

                ->addColumn('tgl_terima', function ($row) {
                    $tgl = Carbon::parse($row->tgl_terima)->format('d-m-Y');
                    return "$tgl<br><strong>{$row->kode_customer}</strong>";
                })

                ->addColumn('nama_lengkap', function ($row) {
                    $nama = "<strong>{$row->nama_lengkap}</strong>";
                    $nik = "<span class='badge bg-info text-dark'>NIK: {$row->no_ktp}</span>";
                    $wa  = "<div class='text-left'>{$row->no_wa}</div>";
                    return "$nama<br>$wa $nik";
                })

                ->addColumn('id_marketing', function ($row) {
                    if ($row->id_marketing && $row->marketing) {
                        $namaMarketing = $row->marketing->nama_marketing;
                    } else {
                        $namaMarketing = null;
                    }

                    if ($row->id_freelance && $row->freelance) {
                        $namaFreelance = "<span class='badge bg-info text-dark'><strong style='font-size: 0.75rem'>{$row->freelance->nama_freelance}</strong></span>";
                    } else {
                        $namaFreelance = null;
                    }

                    if (!$namaMarketing && !$namaFreelance) {
                        return "<span class='badge bg-danger'>Non Marketing</span>";
                    }

                    return ($namaMarketing ?? '') . '<br>' . ($namaFreelance ?? '');
                })

                ->addColumn('id_lokasi', function ($row) {
                    $lokasi = $row->lokasi ? $row->lokasi->nama_kavling : '-';
                    $kavling = $row->kavling ? $row->kavling->kode_kavling : '-';
                    return "<strong style='font-size: 1.1rem'>$lokasi</strong><br>$kavling";
                })

                ->addColumn('id_status_progres', function ($row) {
                    $status = $row->progres ? $row->progres->status_progres : '-';
                    $badgeClass = match (strtolower($status)) {
                        'booking fee' => 'bg-warning text-dark',
                        'akad' => 'bg-info text-dark',
                        'serah terima' => 'bg-dark',
                        'soldout' => 'bg-danger',
                        'sp3k' => 'bg-success',
                        default => ''
                    };

                    if ($badgeClass) {
                        return "<span class='badge $badgeClass'>" . ucfirst($status) . "</span>";
                    }

                    return $status;
                })

                ->addColumn('action', function ($row) use ($permissions) {
                    $deleteUrl = route('arsip-customer.destroy', $row->id);

                    $btn = '<div class="d-flex justify-content-center">';

                    if ($permissions['hapus']) {
                        $btn .= '<form action="' . e($deleteUrl) . '" method="POST" style="display:inline;">'
                            . csrf_field() . method_field('DELETE') .
                            '<button type="submit" class="delete-button btn btn-danger btn-sm mx-1">Hapus</button></form>';
                    }
                    $btn .= '</div>';

                    return $btn;
                })

                ->rawColumns(['tgl_terima', 'nama_lengkap', 'id_marketing', 'id_lokasi', 'id_status_progres', 'no_wa', 'action'])
                ->make(true);
        }

        $permissions = HakAksesController::getUserPermissions();
        $data = ArsipCustomer::first();

        return view('admin.customer.arsip.index', compact('data', 'permissions'));
    }

    public function destroy($id)
    {
        $data = ArsipCustomer::find($id);

        if (!$data) {
            return response()->json(['success' => false, 'message' => 'Data tidak ditemukan'], 404);
        }

        DB::beginTransaction();
        try {
            $data->delete();

            DB::commit();

            return response()->json(['success' => true, 'message' => 'Data berhasil dihapus'], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json(['success' => false, 'message' => 'Terjadi Kesalahan', 'error' => $e->getMessage()], 500);
        }
    }
}
