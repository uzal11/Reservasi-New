<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NewRegisterController extends Controller
{
    public function index(){
        return view('newregister');
    }

}
