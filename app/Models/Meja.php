<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Meja extends Model
{
    public function sektor()
    {
        return $this->belongsTo(\App\Models\Sektor::class, 'sektor_id');
    }
}
