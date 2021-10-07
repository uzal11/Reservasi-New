<?php

namespace App\Http\Controllers;
use App\Region;
use Illuminate\Http\Request;

class SektorController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(){
        $regions = Region::paginate(20);
        return view('sektor', compact('regions'));
    }
}
