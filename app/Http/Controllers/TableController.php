<?php

namespace App\Http\Controllers;

use App\Models\Table;
use Illuminate\Http\Request;

class TableController extends Controller
{

    public function index()
    {
        $tables = Table::paginate(20);
        return view('table', compact('tables'));
    }

    public function set_status_meja($id)
    {
        $table = Table::where('id', $id)->first();
        if (!$table->is_available) {
            return \redirect("//");
        }
        $table->is_available = true;
        $table->update();
        return \redirect("//");
    }
}
