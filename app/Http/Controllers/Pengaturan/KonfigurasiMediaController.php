<?php

namespace App\Http\Controllers\Pengaturan;

use App\Http\Controllers\Controller;
use App\Models\KonfigurasiMedia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class KonfigurasiMediaController extends Controller
{
    public function index(Request $request)
    {
        $permissions = HakAksesController::getUserPermissions();

        if ($request->ajax()) {
            $data = KonfigurasiMedia::query();

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('gambar', function ($row) {
                    $url = asset('config_media/' . $row->nama_file);

                    return '<img src="' . $url . '" class="img-fluid" style="max-width:100px; max-height:50px;">';
                })
                ->addColumn('action', function ($row) use ($permissions) {
                    $editUrl   = route('pengaturan-media.edit', $row->id);
                    $fileUrl = asset('config_media/' . $row->nama_file);

                    $previewBtn = '<button class="btn btn-sm btn-warning preview-button"
                        data-id="' . $row->id . '"
                        data-file="' . $fileUrl . '"
                        data-nama="' . $row->nama_file . '"
                        data-bs-toggle="modal"
                        data-bs-target="#previewModal">
                        Preview
                    </button>';

                    $uploadBtn = '';
                    if (isset($permissions['edit']) && $permissions['edit'] == 1) {
                        $uploadBtn = '<button class="btn btn-sm btn-primary edit-button"
                            data-id="' . e($row->id) . '"
                            data-url="' . e($editUrl) . '"
                            data-bs-toggle="modal"
                            data-bs-target="#modalForm">
                            Update
                        </button>';
                    }

                    return $previewBtn . ' ' . $uploadBtn;
                })
                ->rawColumns(['gambar', 'action'])
                ->make(true);
        }

        $data = KonfigurasiMedia::first();
        $permissions = HakAksesController::getUserPermissions();

        return view('admin.pengaturan.pengaturan_media.index', compact('data', 'permissions'));
    }

    public function edit($id)
    {
        $konfigurasiMedia = KonfigurasiMedia::findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $konfigurasiMedia
        ], 200);
    }

    public function update(Request $request)
    {
        $id = $request->input('id');
        $konfigurasiMedia = KonfigurasiMedia::findOrFail($id);

        if (!$konfigurasiMedia) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
            ], 404);
        }

        $request->validate(
            [
                'nama_file' => 'required|image|max:3048',
            ],
            [
                'nama_file.required' => 'Foto wajib diisi',
                'nama_file.image' => 'Format gambar tidak didukung',
                'nama_file.max' => 'Ukuran gambar maksimal 3MB',
            ]
        );

        DB::beginTransaction();
        try {
            if ($request->hasFile('nama_file')) {
                $file = $request->file('nama_file');
                $extension = strtolower($file->getClientOriginalExtension());

                $imagePath = $file->getPathname();
                $filename = Str::slug($konfigurasiMedia->jenis_data) . '_' . time();
                $webpName = $filename . '.webp';

                $destinationPath = public_path('config_media');
                $fullSavePath = $destinationPath . '/' . $webpName;

                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }

                $oldFilePath = $destinationPath . '/' . $konfigurasiMedia->nama_file;
                if ($konfigurasiMedia->nama_file && file_exists($oldFilePath)) {
                    unlink($oldFilePath);
                }

                switch ($extension) {
                    case 'jpeg':
                    case 'jpg':
                        $img = imagecreatefromjpeg($imagePath);
                        break;
                    case 'png':
                        $img = @imagecreatefrompng($imagePath);
                        imagepalettetotruecolor($img);
                        imagealphablending($img, true);
                        imagesavealpha($img, true);
                        break;
                    default:
                        return response()->json([
                            'success' => false,
                            'error' => 'Format gambar tidak didukung',
                            'message' => 'Format gambar tidak didukung'
                        ], 422);
                }

                imagewebp($img, $fullSavePath, 80);
                imagedestroy($img);

                $konfigurasiMedia->update([
                    'nama_file' => $webpName,
                ]);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Media berhasil diupdate'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Terjadi kesalahan saat mengunggah foto'
            ], 422);
        }
    }
}
