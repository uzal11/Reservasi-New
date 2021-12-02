<?php

namespace App\Http\Controllers;

use App\Models\MenuOrder;
use App\Models\Order;
use App\Models\Table;
use Illuminate\Http\Request;

class PesananAdminController extends Controller
{
    //
    public function pesanan($id)
    {
        $order = Order::where('id', $id)->first();
        $menu_orders = MenuOrder::where('order_id', $order->id)->get();

        $tables = Table::where('id', $order->table_id)->get();

        return view('detail_pesanan', compact('order', 'menu_orders', 'tables'));
    }
}
