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
        $qrcode = QrCode::size(400)->generate($id . "_" . $type);
        // dd($qrcode);
        return view("qrcode", compact("qrcode")); //ini
    }
    public static function generateSTR($id, $type)
    {
        return QRFactory::_enkrispi($id, $type);
    }

    public static function scan($string)
    {
    }

    private static function _enkrispi($p1, $p2)
    {
        $string = $p1 . "-" . $p2;
        return hash("sha1", $string);
    }
}
