<?php

use App\Http\Controllers\PesananController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\PesananAdminController;
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
//buat PWA
Route::view('/offline', 'vendor.laravelpwa.offline');

Route::get('/scan', 'ScanController@index');
Route::get('/scan/{id}', 'QRFactory@scan');
Auth::routes();
Route::get('/sektor', 'SektorController@index');
Route::get('/meja', 'MejaController@index');
Route::get('order/{id}', 'PesananController@index');
//Route::get('/user/{id}', 'UserController@index');
Route::post('order/{id}', 'PesananController@pesanan');
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/pesan', 'PesanController@index')->name('pesan');
Route::get('/newlogin', 'NewLoginController@index')->name('newlogin');
Route::get('/newregister', 'NewRegisterController@index')->name('newregister');

Route::group(['middleware' => 'auth'], function () {
  Route::get('profile', 'UserController@edit')->name('profile.edit');
  Route::patch('profile', 'UserController@update')->name('profile.update');
});
Route::post('ordermeja/{id}', 'PesananController@pilihmeja');
Route::get('check-out', 'PesananController@check_out');
Route::post('delete/check-out', 'PesananController@destroy');
Route::post('konfirmasi-check-out', 'PesananController@konfirmasi');
Route::post('bukti-pembayaran', 'PesananController@buktipembayaran');

Route::get('qrcode/{id}/{type}', [QRFactory::class, 'generateQR'])->name('generate');
Route::get('history_selesai', 'HistoryController@index');
Route::get('history/{id}', 'HistoryController@detail');

Route::get('pesanan/{id}', 'PesananAdminController@pesanan');
Route::get('live_pesanan', 'PesananAdminController@detail');
Route::get('history_diproses', 'HistoryController@diproses');
Route::get('seluruh_riwayat', 'HistoryController@seluruhriwayat');
Route::post('update_status/{id}', 'PesananAdminController@updatestatus');
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
