<?php

namespace App\Http\Controllers;

use App\Models\Sektor;
use Illuminate\Http\Request;

class SektorController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $regions = Sektor::paginate(20);
        return view('sektor', compact('regions'));
    }
}
