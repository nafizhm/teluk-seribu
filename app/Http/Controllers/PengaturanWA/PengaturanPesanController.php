<?php

namespace App\Http\Controllers\PengaturanWA;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Pengaturan\HakAksesController;
use App\Models\TemplatePesan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use League\Uri\UriTemplate\Template;
use Yajra\DataTables\DataTables;

class PengaturanPesanController extends Controller
{
    public function index(Request $request)
    {
        $permissions = HakAksesController::getUserPermissions();
        if ($request->ajax()) {
            $data = TemplatePesan::query();

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) use ($permissions) {
                    $editUrl   = route('template-pesan.edit', $row->id);
                    $deleteUrl = route('template-pesan.destroy', $row->id);

                    $btn = '<div class="d-flex justify-content-center">';
                    if ($permissions['edit']) {
                        $btn .= '<button class="btn btn-primary btn-sm mx-1 edit-button"
                                data-id="' . e($row->id) . '"
                                data-url="' . e($editUrl) . '">Edit</button>';
                    }

                    if ($permissions['hapus']) {
                        $btn .= '<form action="' . e($deleteUrl) . '" method="POST" style="display:inline;">
                                ' . csrf_field() . method_field('DELETE') . '
                                <button type="submit" class="delete-button btn btn-danger btn-sm mx-1">
                                    Hapus
                                </button>
                                </form>';
                    }
                    $btn .= '</div>';
                    return $btn;
                })

                ->rawColumns(['action'])
                ->make(true);
        }

        $permissions = HakAksesController::getUserPermissions();

        return view('admin.pengaturan_wa.template_pesan.index', compact('permissions'));
    }

    public function store(Request $request)
    {
        $rules = [
            'nama_template' => 'required|string|max:50',
            'isi_template'  => 'required|string|max:400',
            'jenis_pesan'   => 'required|string|unique:template_pesan|max:50',
        ];

        $messages = [
            'nama_template.required' => 'Nama template wajib diisi.',
            'nama_template.string'   => 'Nama template harus berupa teks.',
            'nama_template.max'      => 'Nama template maksimal 50 karakter.',

            'isi_template.required'  => 'Isi template wajib diisi.',
            'isi_template.string'    => 'Isi template harus berupa teks.',
            'isi_template.max'       => 'Isi template maksimal 400 karakter.',

            'jenis_pesan.required'   => 'Jenis pesan wajib diisi.',
            'jenis_pesan.unique'     => 'Jenis pesan sudah ada.',
            'jenis_pesan.string'     => 'Jenis pesan harus berupa teks.',
            'jenis_pesan.max'        => 'Jenis pesan maksimal 50 karakter.',
        ];

        $request->validate($rules, $messages);

        DB::beginTransaction();

        try {
            TemplatePesan::create([
                'nama_template' => $request->nama_template,
                'isi_template' => $request->isi_template,
                'jenis_pesan' => $request->jenis_pesan,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil disimpan.',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Data gagal disimpan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function edit($id)
    {
        $dt = TemplatePesan::findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $dt,
            'message' => 'Berhasil mengambil data'
        ]);
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'nama_template' => 'required|string|max:50',
            'isi_template'  => 'required|string|max:400',
            'jenis_pesan'   => 'required|string|max:50|unique:template_pesan,jenis_pesan,' . $id,
        ];

        $messages = [
            'nama_template.required' => 'Nama template wajib diisi.',
            'nama_template.string'   => 'Nama template harus berupa teks.',
            'nama_template.max'      => 'Nama template maksimal 50 karakter.',

            'isi_template.required'  => 'Isi template wajib diisi.',
            'isi_template.string'    => 'Isi template harus berupa teks.',
            'isi_template.max'       => 'Isi template maksimal 400 karakter.',

            'jenis_pesan.required'   => 'Jenis pesan wajib diisi.',
            'jenis_pesan.unique'     => 'Jenis pesan sudah ada.',
            'jenis_pesan.string'     => 'Jenis pesan harus berupa teks.',
            'jenis_pesan.max'        => 'Jenis pesan maksimal 50 karakter.',
        ];

        $request->validate($rules, $messages);

        DB::beginTransaction();

        try {
            TemplatePesan::where('id', $id)->update([
                'nama_template' => $request->nama_template,
                'isi_template' => $request->isi_template,
                'jenis_pesan' => $request->jenis_pesan,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil disimpan.',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Data gagal disimpan.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            TemplatePesan::where('id', $id)->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data berhasil dihapus.',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Data gagal dihapus.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
