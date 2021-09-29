<?php

use App\Http\Controllers\PagesController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','PagesController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/customerhome','PagesController@index')->name('customerhome');

Route::get('/newlogin', 'NewLoginController@index')->name('newlogin');
Route::get('/newregister', 'NewRegisterController@index')->name('newregister');


/*Route::prefix('customer')
    ->as('customer.')
    ->group(function() {
    Route::get('home', 'Home\CustomerHomeController@index')->name('home');
Route::namespace('Auth\Login')
      ->group(function() {
    Route::get('login', 'CustomerController@showLoginForm')->name('login');
    Route::post('login', 'CustomerController@login')->name('login');
    Route::post('logout', 'CustomerController@logout')->name('logout');
      });
 });*/
