<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    public function menu()
    {
        return $this->hasMany(\App\Models\MenuPesanan::class);
    }

    public function user()
    {
        return $this->belongsTo(\App\User::class, 'user_id');
    }

    public function meja()
    {
        return $this->belongsTo(\App\Models\Meja::class, 'meja_id');
    }
}
