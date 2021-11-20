<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function menu()
    {
        return $this->hasMany(\App\Models\MenuOrder::class);
    }

    public function customer()
    {
        return $this->hasMany(\App\User::class, 'user_id');
    }

    public function table()
    {
        return $this->belongsTo(\App\Models\Table::class, 'table_id');
    }
}
