<?php

namespace App\Http\Controllers;

use App\Models\Order;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Http\Request;
use App\Models\Region;
use App\Models\Table;
use Auth;

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
        $data_table = Table::where('hashcode', $string)->first();
        $data_sector = Region::where('hashcode', $string)->get();
        //cek data_table ada berapa row
        //cek data_sector ada berapa row 
        if ($data_table) {
            //return value --> id dan nama meja
            $data_table->is_available = false;
            $data_table->update();

            $order = new Order();
            $order->user_id = Auth::user()->id;
            $order->table_id = $data_table->id;
            $order->jenis = 'Dinein';
            $order->kode = 'DI' . date("ymdHi");
            $order->save();

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
