<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    public function region()
    {
        return $this->belongsTo(\App\Models\Region::class, 'region_id');
    }
}
