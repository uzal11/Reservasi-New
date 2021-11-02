<?php

use App\Http\Controllers\OrderController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\QRFactory;
use App\Http\Controllers\UserController;
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

Route::get('/', 'PagesController@index');

Route::get('/scan', 'ScanController@index');
Auth::routes();
Route::get('/sektor', 'SektorController@index');
Route::get('/table', 'TableController@index');
Route::get('order/{id}', 'OrderController@index');
//Route::get('/user/{id}', 'UserController@index');
Route::post('order/{id}', 'OrderController@order');
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/pesan', 'ReservasiController@index')->name('pesan');
Route::get('/newlogin', 'NewLoginController@index')->name('newlogin');
Route::get('/newregister', 'NewRegisterController@index')->name('newregister');

Route::group(['middleware' => 'auth'], function () {
  Route::get('profile', 'UserController@edit')->name('profile.edit');
  Route::patch('profile', 'UserController@update')->name('profile.update');
});
// Route::post('order/{id}', 'OrderController@pilihmeja');
Route::get('check-out', 'OrderController@check_out');
Route::post('delete/check-out', 'OrderController@destroy');
Route::get('konfirmasi-check-out', 'OrderController@konfirmasi');

Route::get('qrcode/{id}/{type}', [QRFactory::class, 'generateQR'])->name('generate');

/*Nanti dilindungi dengan admin*/


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
