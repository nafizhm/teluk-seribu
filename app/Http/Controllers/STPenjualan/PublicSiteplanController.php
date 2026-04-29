<?php

namespace App\Http\Controllers\STPenjualan;

use App\Http\Controllers\Controller;
use App\Models\KavlingPeta;
use App\Models\LokasiKavling;
use App\Models\ProgresListPenjualan;
use App\Models\PengaturanMedia;
class PublicSiteplanController extends Controller
{
    /**
     * Display the public siteplan.
     */
    public function index()
{
        $lokasiKavling = LokasiKavling::with([
            'kavlingPeta.customer.piutangs',
        ])
        ->orderBy('urutan', 'asc')
        ->get();

    $legend = ProgresListPenjualan::whereNotNull('warna')
        ->where('warna', '!=', '')
        ->where('stt_tampil', 1)
        ->whereIn('status_progres', ['Ready', 'Kredit', 'Cash Tempo', 'Kredit Macet', 'Cash Keras'])
        ->orderBy('urutan', 'asc')
        ->get();

    $bg = PengaturanMedia::where('jenis_data', 'Background booking')->first();

    return view('public_siteplan.index', compact('lokasiKavling', 'legend', 'bg'));
}

    /**
     * Fetch kavling details for the public popup.
     */
    public function show($id)
    {
        $data = KavlingPeta::with(['lokasi'])->findOrFail($id);

        return response()->json([
            'success'       => true,
            'data'          => [
                'kode_kavling'   => $data->kode_kavling ?? '-',
                'tipe_bangunan'  => $data->tipe_bangunan ?? '-',
                'luas_tanah'     => $data->luas_tanah ?? 0,
                'luas_bangunan'  => $data->luas_bangunan ?? 0,
                'hrg_jual'       => $data->hrg_jual ?? 0,
                'status'         => (str_starts_with($data->kode_kavling, 'P') || str_starts_with($data->kode_kavling, 'Q')) ? 2 : $data->status,
                'lokasi'         => [
                    'nama_kavling' => $data->lokasi->nama_kavling ?? '-',
                ],
            ],
        ]);
    }
}
