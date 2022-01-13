<?php

namespace App\Http\Controllers;

use App\Models\Meja;
use App\Models\MenuPesanan;
use DB;
use App\Models\Pesanan;
use App\Models\Menu;

use App\Models\Table;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class PesananAdminController extends Controller
{
    //
    public function detail($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        $menu_pesanans = MenuPesanan::where('pesanan_id', $pesanan->id)->get();

        $mejas = Meja::where('id', $pesanan->meja_id)->get();

        return view('detail_pesanan', compact('pesanan', 'menu_pesanans', 'mejas'));
    }

    public function pesanan()
    {
        $pesanans = Pesanan::with('menu')
            ->with('menu.menu')
            ->with('meja')
            ->where('status_pesanan', '=', 'Diproses')
            ->whereDate('rencana_tiba', '=', date('Y-m-d'))
            ->orderBy('rencana_tiba', 'ASC')
            ->get();

        return view('live_pesanan', compact('pesanans'));
    }

    public function updatestatus($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        $pesanan->status_pesanan = 'Selesai';
        $pesanan->update();

        return redirect('live_pesanan')->with('success', 'Pesanan Selesai');
    }


    public function adminpesanan()
    {
        $pesanans = Pesanan::with('menu')
            ->with('menu.menu')
            ->with('meja')
            ->orderBy('rencana_tiba', 'ASC')
            ->get();

        return view('adminpesanan', compact('pesanans'));
    }

    public function adminmenupesanan()
    {
        $menu_pesanans = MenuPesanan::with('menu')->get();

        return view('adminmenupesanan', compact('menu_pesanans'));
    }
}
