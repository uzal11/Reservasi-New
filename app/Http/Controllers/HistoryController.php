<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\MenuOrder;
use App\Models\Order;
use App\Models\Table;
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
        $orders = Order::where('user_id', Auth::user()->id)->where('keranjang_status', '!=', 0)->get();
        return view('history.index', compact('orders'));
    }

    public function detail($id)
    {
        $order = Order::where('id', $id)->first();
        $menu_orders = MenuOrder::where('order_id', $order->id)->get();

        $tables = Table::where('id', $order->table_id)->get();

        return view('history.detail', compact('order', 'menu_orders', 'tables'));
    }
}
