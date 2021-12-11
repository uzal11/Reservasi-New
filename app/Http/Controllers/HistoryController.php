<?php

namespace App\Http\Controllers;

use App\Models\Meja;
use App\Models\Menu;
use App\Models\MenuPesanan;
use App\Models\Pesanan;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $pesanans = Pesanan::where('user_id', Auth::user()->id)->where('status', '=', 'Selesai')->orderBy('created_at', 'DESC')->get();
        return view('history.historyselesai', compact('pesanans'));
    }

    public function detail($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        $menu_pesanans = MenuPesanan::where('pesanan_id', $pesanan->id)->get();

        $mejas = Meja::where('id', $pesanan->table_id)->get();

        return view('history.detail', compact('pesanan', 'menu_pesanans', 'mejas'));
    }


    public function diproses()
    {
        $pesanans = Pesanan::where('user_id', Auth::user()->id)->where('status', '=', 'Diproses')->orderBy('created_at', 'DESC')->get();
        return view('history.diproses', compact('pesanans'));
    }

    public function seluruhriwayat()
    {
        $pesanans = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', '!=', 0)->orderBy('created_at', 'DESC')->get();
        return view('history.seluruhriwayat', compact('pesanans'));
    }
}
