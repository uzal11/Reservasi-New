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
    public function pesanan($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        $menu_pesanans = MenuPesanan::where('pesanan_id', $pesanan->id)->get();

        $mejas = Meja::where('id', $pesanan->meja_id)->get();

        return view('detail_pesanan', compact('pesanan', 'menu_pesanans', 'mejas'));
    }

    public function detail()
    {
        $pesanans = Pesanan::whereDate('rencana_tiba', date('Y-m-d'))->orderBy('rencana_tiba', 'ASC')->get();
        foreach ($pesanans as $key => $value) {
            $menupesanan = MenuPesanan::where('pesanan_id', $value->id)->get();
            foreach ($menupesanan as $key => $menu) {

                $pesanans[$key]["menus"] = Menu::whereId($menu->menu_id)->first();
            }
            $pesanans[$key]["meja"] = Meja::where('id', $value->meja_id)->first();
        }


        //return $pesanans;

        return view('live_pesanan', compact('pesanans'));
    }

    public function updatestatus($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        $pesanan->status = 'Selesai';
        $pesanan->update();

        return redirect('live_pesanan')->with('success', 'Pesanan Selesai');
    }
}
