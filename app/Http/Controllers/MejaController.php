<?php

namespace App\Http\Controllers;

use App\Models\Meja;
use Illuminate\Http\Request;

class MejaController extends Controller
{

    public function index()
    {
        $mejas = Meja::paginate(20);
        return view('meja', compact('mejas'));
    }

    public function set_status_meja($id)
    {
        $meja = Meja::where('id', $id)->first();
        if (!$meja->is_available) {
            return \redirect("//");
        }
        $meja->is_available = true;
        $meja->update();
        return \redirect("//");
    }
}
