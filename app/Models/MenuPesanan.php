<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuPesanan extends Model
{
    public function menu()
    {
        return $this->belongsTo(\App\Models\Menu::class, 'menu_id');
    }

    public function pesanan()
    {
        return $this->belongsTo(\App\Models\Pesanan::class, 'pesanan_id');
    }
}
