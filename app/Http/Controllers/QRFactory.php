<?php

namespace App\Http\Controllers;

use App\Models\Meja;
use App\Models\Pesanan;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Http\Request;
use App\Models\Region;
use App\Models\Sektor;
use Carbon\Carbon;
use App\Models\Table;
use Illuminate\Support\Facades\Auth;

class QRFactory extends Controller
{
    //$type = MJ (meja), SCT (Sector)
    //$id = pk dari masing-masing table
    //$kode = nama atau kode dari masing-masing table
    public static function generateQR($id, $type)
    {
        $stringhash = QRFactory::_enkrispi($id, $type);
        $qrcode = QrCode::size(400)->generate($stringhash);
        // dd($qrcode);
        return view("qrcode", compact("qrcode")); //ini
    }
    public static function generateSTR($id, $type)
    {
        return QRFactory::_enkrispi($id, $type);
    }

    public static function scan($string)
    {
        $tanggal = Carbon::now();
        $data_table = Meja::where('hashcode', $string)->first();
        $data_sector = Sektor::where('hashcode', $string)->get();
        //cek data_table ada berapa row
        //cek data_sector ada berapa row 
        if ($data_table) {
            //return value --> id dan nama meja
            $data_table->is_available = false;
            $data_table->update();

            $pesanan = new Pesanan();
            $pesanan->user_id = Auth::user()->id;
            $pesanan->meja_id = $data_table->id;
            $pesanan->kapan_pesan = $tanggal;
            $pesanan->rencana_tiba = $tanggal;
            $pesanan->kapan_tiba = $tanggal;
            $pesanan->meja->is_available = 0;
            $pesanan->status = 'Menunggu Pembayaran';
            $pesanan->keranjang_status = 0;
            $pesanan->jenis = 'Dine In';
            $pesanan->kode = 'DI' . date("mdHi");
            $pesanan->save();


            return redirect('pesan');
        }
        // else if (count($data_sector)>0)
        // {
        //     //return value --> id dan nama region

        // }
        // else 
        // {
        //     return "INVALID";
        // }

    }

    private static function _enkrispi($p1, $p2)
    {
        $string = $p1 . "-" . $p2;
        return hash("sha1", $string);
    }
}
