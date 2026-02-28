<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KonfigurasiWa extends Model
{
    protected $table = 'konfigurasi_wa';
    protected $fillable = [
        'api_key',
        'number_key',
    ];
    public $timestamps = false;
}
