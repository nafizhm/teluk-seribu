<?php

namespace App\Models;

use DateTime;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customer';

    protected $fillable = [
        'id_reg',
        'nama_lengkap',
        'kode_customer',
        'no_ktp',
        'tempat_lahir',
        'jenis_kelamin',
        'no_wa',
        'no_telp',
        'email',
        'npwp',
        'alamat',
        'alamat_domisili',
        'pekerjaan',
        'id_marketing',
        'id_status_progres',
        'ket_cashback',
        'jenis_pembelian',
        'no_ktp_p',
        'id_lokasi',
        'tgl_lahir',
        'id_freelance',
        'no_kk',
        'penghasilan',
        'id_bank',
        'id_admin_pemberkasan',
        'jumlah_bulan',
        'pembayaran_booking',
        'tgl_batas_booking',
        'keterangan_booking',
        'jumlah_bulan_x',
        'inhouse_perbulan',
        'inhouse_tenor',
        'inhouse_jatuh_tempo',
        'dp_kredit',
        'discount',
        'atas_nama',
        'no_surat',
        'keterangan_legalitas',
    ];

    public function marketing()
    {
        return $this->belongsTo(Marketing::class, 'id_marketing');
    }

    public function lokasi()
    {
        return $this->belongsTo(LokasiKavling::class, 'id_lokasi');
    }

    // Tetap SINGULAR (kavling) sesuai request
    public function kavling()
    {
        return $this->belongsToMany(
            KavlingPeta::class,
            'transaksi_kavling',
            'id_customer',
            'id_kavling'
        )->withPivot('tgl_terima', 'hrg_rumah');
    }

    public function progres()
    {
        return $this->belongsTo(ListPenjualan::class, 'id_status_progres');
    }

    public function lokasiKavling()
    {
        return $this->belongsTo(LokasiKavling::class, 'id_lokasi');
    }

    public function piutangs()
    {
        return $this->hasMany(Piutang::class, 'id_customer');
    }

    public function pemasukans()
    {
        return $this->hasMany(Pemasukan::class, 'id_customer');
    }

    public function bank()
    {
        return $this->belongsTo(Bank::class, 'id_bank');
    }

    // protected static function boot()
    // {
    //     parent::boot();

    //     static::deleting(function ($customer) {
    //         $tglLahir = $customer->tgl_lahir;

    //         if (empty($tglLahir) || $tglLahir == '0000-00-00' || $tglLahir == '0000-00-00 00:00:00') {
    //             $tglLahir = null;
    //         } else {
    //             try {
    //                 new DateTime($tglLahir);
    //             } catch (\Exception $e) {
    //                 $tglLahir = null;
    //             }
    //         }

    //         // Load relasi singular
    //         $customer->load('kavling');

    //         if ($customer->kavling->count() > 0) {
    //             // PERBAIKAN: Ubah '$item' menjadi '$kavling' agar cocok dengan logic di dalamnya
    //             foreach ($customer->kavling as $kavling) {

    //                 ArsipCustomer::create([
    //                     'id_customer'       => $customer->id,
    //                     'nama_lengkap'      => $customer->nama_lengkap,
    //                     'kode_customer'     => $customer->kode_customer,
    //                     'no_ktp'            => $customer->no_ktp,
    //                     'no_ktp_p'          => $customer->no_ktp_p,
    //                     'tempat_lahir'      => $customer->tempat_lahir,
    //                     'jenis_kelamin'     => $customer->jenis_kelamin,
    //                     'no_wa'             => $customer->no_wa,
    //                     'no_telp'           => $customer->no_telp,
    //                     'alamat'            => $customer->alamat,
    //                     'alamat_domisili'   => $customer->alamat_domisili,
    //                     'pekerjaan'         => $customer->pekerjaan,
    //                     'tgl_lahir'         => $tglLahir,
    //                     'id_marketing'      => $customer->id_marketing,
    //                     'id_freelance'      => $customer->id_freelance,

    //                     // Ambil data dari objek $kavling yang sedang di-loop
    //                     'id_lokasi'         => $kavling->id_lokasi,
    //                     'id_kavling'        => $kavling->id,

    //                     // Data status mungkin null jika tidak diset di kavling
    //                     'id_status_progres' => $kavling->id_status_progres ?? null,

    //                     // Ambil dari PIVOT TABLE
    //                     'tgl_terima'        => $kavling->pivot->tgl_terima ?? null,
    //                 ]);
    //             }
    //         } else {
    //             ArsipCustomer::create([
    //                 'id_customer'       => $customer->id,
    //                 'nama_lengkap'      => $customer->nama_lengkap,
    //                 'kode_customer'     => $customer->kode_customer,
    //                 'no_ktp'            => $customer->no_ktp,
    //                 'no_ktp_p'          => $customer->no_ktp_p,
    //                 'tempat_lahir'      => $customer->tempat_lahir,
    //                 'jenis_kelamin'     => $customer->jenis_kelamin,
    //                 'no_wa'             => $customer->no_wa,
    //                 'no_telp'           => $customer->no_telp,
    //                 'alamat'            => $customer->alamat,
    //                 'alamat_domisili'   => $customer->alamat_domisili,
    //                 'pekerjaan'         => $customer->pekerjaan,
    //                 'tgl_lahir'         => $tglLahir,
    //                 'id_marketing'      => $customer->id_marketing,
    //                 'id_freelance'      => $customer->id_freelance,

    //                 'id_lokasi'         => null,
    //                 'id_kavling'        => null,
    //                 'id_status_progres' => null,
    //                 'tgl_terima'        => null,
    //             ]);
    //         }
    //     });
    // }

    public $timestamps = false;
}
