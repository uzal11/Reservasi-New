<?php

namespace App\Http\Controllers;

use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Http\Request;
use App\Models\Region;
use App\Models\Table;

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
        $data_table = Table::where('hashcode',$string)->get();
        $data_sector = Region::where('hashcode',$string)->get();
        //cek data_table ada berapa row
        //cek data_sector ada berapa row 
        if (count($data_table)>0)
        {
            //return value --> id dan nama meja
        }
        else if (count($data_sector)>0)
        {
            //return value --> id dan nama region
        }
        else 
        {
            return "INVALID";
        }

    }

    private static function _enkrispi($p1, $p2)
    {
        $string = $p1 . "-" . $p2;
        return hash("sha1", $string);
    }
}
