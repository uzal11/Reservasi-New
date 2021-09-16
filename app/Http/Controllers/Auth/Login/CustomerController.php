<?php

namespace App\Http\Controllers\Auth\Login;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Auth\LoginController as DefaultLoginController;

class CustomerController extends DefaultLoginController
{
    protected $redirectTo ='/customer/home';

    public function __construct()
    {
        $this->middleware('guest:customer')->except('logout');
    }

    public function showLoginForm()
    {
        return view('auth.login.customerlogin');
    }

    public function username(){
        return ('email');
    }

    public function guard(){
        return Auth::guard('customer');
    }
}
