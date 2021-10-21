<?php

namespace App\Http\Controllers;
use App\Models\Menu;

use Illuminate\Http\Request;

class PagesController extends Controller
{
    public function index()
    {
        $menus = Menu::paginate(20);
        return view('welcome',compact('menus'));
    }
    

}
