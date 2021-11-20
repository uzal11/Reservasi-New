<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\MenuOrder;
use App\Models\Order;
use App\Models\Table;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use UxWeb\SweetAlert\SweetAlert as SweetAlert;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($id)
    {
        $menu = Menu::where('id', $id)->first();
        return view('order.index', compact('menu'));
    }

    public function order(Request $request, $id)
    {

        // dd($request->all());
        $menu = Menu::where('id', $id)->first();
        $tanggal = Carbon::now();

        //cek validsi
        $cek_order = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        //simpan ke database orders
        if (empty($cek_order)) {
            $order = new Order();
            $order->user_id = Auth::user()->id;
            $order->kapan_pesan = $tanggal;
            $order->keranjang_status = 0;
            $order->total_harga = 0;
            $order->jenis = 'Reservasi';
            $order->kode = 'RS' . date("ymdHi");
            $order->save();
        }


        //simpan ke database menu_order
        $order_new = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();

        $cek_menu_order = MenuOrder::where('menu_id', $menu->id)->where('order_id', $order_new->id)->first();
        if (empty($cek_menu_order)) {
            $menu_order = new MenuOrder;
            $menu_order->menu_id = $menu->id;
            $menu_order->order_id = $order_new->id;
            $menu_order->jumlah = $request->jumlah_order;
            $menu_order->total_harga = $menu->price * $request->jumlah_order;
            $menu_order->save();
        } else {
            $menu_order = MenuOrder::where('menu_id', $menu->id)->where('order_id', $order_new->id)->first();
            $menu_order->jumlah = $menu_order->jumlah + $request->jumlah_order;

            //harga sekarang
            $harga_menu_order_baru = $menu->price * $request->jumlah_order;
            $menu_order->total_harga = $menu_order->total_harga + $harga_menu_order_baru;
            $menu_order->update();
        }

        //jumlah total
        $order = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        $order->total_harga = $order->total_harga + $menu->price * $request->jumlah_order;
        $order->update();

        //SweetAlert::success('Success Message', 'Optional Title');

        return redirect('pesan')->with('success', 'Menu Masuk Keranjang');
    }

    public function check_out()
    {
        $order = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        if (!empty($order)) {
            $menu_orders = MenuOrder::where('order_id', $order->id)->get();
        }
        $tables = Table::where('id', $order->table_id)->get();

        return view('order.check_out', compact('order', 'menu_orders', 'tables'));
    }

    public function destroy(Request $request)
    {
        //dd($request);
        $menu_order = MenuOrder::where('id', $request->menu_order_id)->first();

        $order = Order::where('id', $menu_order->order_id)->first();
        $order->total_harga = $order->total_harga - $menu_order->total_harga;
        $order->update();

        $menu_order->delete();

        return redirect('check-out')->with('warning', 'Berhasil Dihapus');
    }

    public function pilihmeja(Request $request, $id)
    {
        $order = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();

        $tables = Table::where('id', $id)->first();
        $order->tambahan_kursi = $request->tambah_kursi;
        $order->table_id = $tables->id;
        //dd($order);
        $order->update();

        return redirect('check-out')->with('success', 'Berhasil Pilih Meja');
    }

    public function konfirmasi(Request $request)
    {
        // dd($request->all());
        $order = Order::where('user_id', Auth::user()->id)->where('keranjang_status', 0)->first();
        $order_id = $order->id;
        $order->keranjang_status = 1;
        $order->rencana_tiba = $request->tgl . ' ' . $request->jam . ':' . $request->min;
        $order->update();

        return redirect('history/' . $order_id)->with('success', 'Berhasil Check Out');
    }

    public function buktipembayaran(Request $request)
    {
        // dd($request->all());
        $order = Order::find($request->id);
        $file = $request->bukti_pembayaran;
        $file_name = time() . $file->getClientOriginalName();
        $file->move('uploads/bukti_pembayaran', $file_name);
        $order->bukti_pembayaran = 'uploads/bukti_pembayaran/' . $file_name;
        $order->save();

        return redirect('history/' . $order->id)->with('success', 'Berhasil Upload');
    }
}
