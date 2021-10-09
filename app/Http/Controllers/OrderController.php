<?php

namespace App\Http\Controllers;
use App\Models\Menu;
use App\Models\MenuOrder;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($id){
        $menu= Menu::where('id', $id)->first();
        return view('order.index', compact('menu'));
    }

    public function order(Request $request, $id){
        /*$menu = Menu::where('id', $id)->first();
        $tanggal = Carbon::now();

        //simpan ke database orders
        $order = new Order;
        $order->user_id = Auth::user()->id;
        $order->table_id= 
        $order->kapan_pesan = $tanggal;
        $order->keranjang_status = 0;
        $order->total_harga = $menu->price*$request->jumlah_order;
        $order->save();

        //simpan ke database menu_order
        $order_new = Order::where('user_id', Auth::user()->id)->where('keranjang_status',0)->first();

        $menu_order = new MenuOrder;
        $menu_order->menu->id = $menu->id;
        $menu_order->order->id = $order_new->id;
        $menu_order->jumlah = $request->jumlah_order;
        $menu_order->jumlah_harga = $menu->price*$request->jumlah_order;
        $menu_order->save();  
        
        return redirect('home');
        */

    }
}
