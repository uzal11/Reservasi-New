<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuOrder extends Model
{
    public function menu()
    {
        return $this->belongsTo(\App\Models\Menu::class, 'menu_id');
    }

    public function product()
    {
        return $this->belongsTo(\App\Models\Order::class, 'order_id');
    }
}
