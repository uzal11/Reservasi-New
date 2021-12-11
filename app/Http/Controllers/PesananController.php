<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\MenuPesanan;
use App\Models\Pesanan;
use App\Models\Meja;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use UxWeb\SweetAlert\SweetAlert as SweetAlert;

class PesananController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($id)
    {
        $menu = Menu::where('id', $id)->first();
        return view('pesanan.index', compact('menu'));
    }

    public function pesanan(Request $request, $id)
    {

        // dd($request->all());
        $menu = Menu::where('id', $id)->first();
        $tanggal = Carbon::now();

        //cek validsi
        $cek_pesanan = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        //simpan ke database pesanans
        if (empty($cek_pesanan)) {
            $pesanan = new Pesanan();
            $pesanan->user_id = Auth::user()->id;
            $pesanan->kapan_pesan = $tanggal;
            $pesanan->keranjang_status = 0;
            $pesanan->total_harga = 0;
            $pesanan->jenis = 'Reservasi';
            $pesanan->status = 'Menunggu Pembayaran';
            $pesanan->check_in = 'Belum Hadir';
            $pesanan->kode = 'RS' . date("mdHi");
            $pesanan->save();
        }


        //simpan ke database menu_pesanan
        $pesanan_new = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();

        $cek_menu_pesanan = MenuPesanan::where('menu_id', $menu->id)->where('pesanan_id', $pesanan_new->id)->first();
        if (empty($cek_menu_pesanan)) {
            $menu_pesanan = new MenuPesanan;
            $menu_pesanan->menu_id = $menu->id;
            $menu_pesanan->pesanan_id = $pesanan_new->id;
            $menu_pesanan->jumlah = $request->jumlah_pesanan;
            $menu_pesanan->total_harga = $menu->harga * $request->jumlah_pesanan;
            $menu_pesanan->save();
        } else {
            $menu_pesanan = MenuPesanan::where('menu_id', $menu->id)->where('pesanan_id', $pesanan_new->id)->first();
            $menu_pesanan->jumlah = $menu_pesanan->jumlah + $request->jumlah_pesanan;

            //harga sekarang
            $harga_menu_pesanan_baru = $menu->harga * $request->jumlah_pesanan;
            $menu_pesanan->total_harga = $menu_pesanan->total_harga + $harga_menu_pesanan_baru;
            $menu_pesanan->update();
        }

        // if ($menu->cathegory == 'Makanan') {
        //     $pesanan->total_makanan = $menu_pesanan->jumlah;
        //     $pesanan->update();
        // } else if ($menu->cathegory == 'Minuman') {
        //     $pesanan->total_minuman = $menu_pesanan->jumlah;
        //     $pesanan->update();
        // } else {
        //     $pesanan->total_makanan = $menu_pesanan->jumlah;
        //     $pesanan->update();
        // }

        //jumlah total
        $pesanan = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        $pesanan->total_harga = $pesanan->total_harga + $menu->harga * $request->jumlah_pesanan;
        $pesanan->update();

        //SweetAlert::success('Success Message', 'Optional Title');

        return redirect('pesan')->with('success', 'Menu Masuk Keranjang');
    }

    public function check_out()
    {
        $pesanan = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        if (!empty($pesanan)) {
            $menu_pesanans = MenuPesanan::where('pesanan_id', $pesanan->id)->get();
        }
        $mejas = Meja::where('id', $pesanan->meja_id)->where('is_available', '')->get();

        return view('pesanan.check_out', compact('pesanan', 'menu_pesanans', 'mejas'));
    }

    public function destroy(Request $request)
    {
        //dd($request);
        $menu_pesanan = MenuPesanan::where('id', $request->menu_pesanan_id)->first();

        $pesanan = Pesanan::where('id', $menu_pesanan->pesanan_id)->first();
        $pesanan->total_harga = $pesanan->total_harga - $menu_pesanan->total_harga;
        $pesanan->update();

        $menu_pesanan->delete();

        return redirect('check-out')->with('warning', 'Berhasil Dihapus');
    }

    public function pilihmeja(Request $request, $id)
    {
        $tanggal = Carbon::now();

        $cek_pesanan = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        //simpan ke database pesanans
        if (empty($cek_pesanan)) {
            $pesanan = new Pesanan();
            $pesanan->user_id = Auth::user()->id;
            $pesanan->kapan_pesan = $tanggal;
            $pesanan->keranjang_status = 0;
            $pesanan->total_harga = 0;
            $pesanan->jenis = 'Reservasi';
            $pesanan->status = 'Menunggu Pembayaran';
            $pesanan->check_in = 'Belum Hadir';
            $pesanan->kode = 'RS' . date("mdHi");
            $pesanan->save();
        }

        $mejas = Meja::where('id', $id)->first();

        $pesanan->tambahan_kursi = $request->tambah_kursi;
        $pesanan->meja_id = $mejas->id;
        //dd($pesanan);
        $pesanan->update();

        return redirect('check-out')->with('success', 'Berhasil Pilih Meja');
    }

    public function konfirmasi(Request $request)
    {
        // dd($request->all());
        $pesanan = Pesanan::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        $pesanan_id = $pesanan->id;
        $pesanan->keranjang_status = 1;
        $pesanan->rencana_tiba = $request->tgl . ' ' . $request->jam . ':' . $request->min;

        $pesanan->update();

        return redirect('history/' . $pesanan_id)->with('success', 'Berhasil Check Out');
    }

    public function buktipembayaran(Request $request)
    {
        // dd($request->all());
        $pesanan = Pesanan::find($request->id);
        $file = $request->bukti_pembayaran;
        $file_name = time() . $file->getClientOriginalName();
        $file->move('uploads/bukti_pembayaran', $file_name);
        $pesanan->bukti_pembayaran = 'uploads/bukti_pembayaran/' . $file_name;
        $pesanan->save();

        return redirect('history/' . $pesanan->id)->with('success', 'Berhasil Upload');
    }
}
