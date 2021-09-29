<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NewLoginController extends Controller
{
    public function index()
    {
        return view('newlogin');
    }
}
