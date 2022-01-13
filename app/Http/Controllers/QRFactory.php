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
        //cek data_table ada berapa row
        //cek data_sector ada berapa row 
        $pesanan = Pesanan::where('user_id', Auth::user()->id)
            // ->with('meja')
            // ->with('menu')
            // ->with('menu.menu')
            ->where('keranjang_status', 0)
            ->where('status_pesanan', '!=', 'Selesai')
            ->orderBy('created_at', "DESC")
            // ->count()
            ->first();


        if ($pesanan) {
            if ($pesanan->meja_id == $data_table->id) {
                if ($pesanan->jenis != 'Dine In') {
                    $pesanan->meja_id = $data_table->id;
                    $pesanan->kapan_pesan = $tanggal;
                    $pesanan->rencana_tiba = $tanggal;
                    $pesanan->kapan_tiba = $tanggal;
                    $pesanan->status_pembayaran = 'Belum Bayar';
                    $pesanan->status_pesanan = 'Menunggu Pembayaran';
                    $pesanan->keranjang_status = 0;
                    $pesanan->jenis = 'Dine In';
                    $pesanan->kode = 'DI' . date("mdHi");
                    $pesanan->update();
                }
            } else {
                $curentTable = Meja::where('id', $pesanan->meja_id)->first();
                $curentTable->is_available = true;
                $curentTable->update();

                $data_table->is_available = false;
                $data_table->update();

                $pesanan->meja_id = $data_table->id;
                $pesanan->update();
            }
        } else {
            $pesanan = new Pesanan();
            $pesanan->user_id = Auth::user()->id;
            $pesanan->meja_id = $data_table->id;
            $pesanan->kapan_pesan = $tanggal;
            $pesanan->rencana_tiba = $tanggal;
            $pesanan->kapan_tiba = $tanggal;
            $pesanan->meja->is_available = 0;
            $pesanan->status_pembayaran = 'Belum Bayar';
            $pesanan->status_pesanan = 'Menunggu Pembayaran';
            $pesanan->keranjang_status = 0;
            $pesanan->jenis = 'Dine In';
            $pesanan->kode = 'DI' . date("mdHi");
            $pesanan->save();
        }
        return redirect("pesan")->with('success', 'Meja Berhasil Dipilih, Silahkan Pilih Menu!');
    }

    private static function _enkrispi($p1, $p2)
    {
        $string = $p1 . "-" . $p2;
        return hash("sha1", $string);
    }

    public function scanPindahMeja($id)
    {
        return view('scanqrcodepindah')->with("id", $id);
    }

    public function updatePindahMeja($id, $meja)
    {
        $data_table = Meja::where('hashcode', $meja)->first();
        $pesanan = Pesanan::whereId($id)->first();

        if ($pesanan) {
            $curentTable = Meja::where('id', $pesanan->meja_id)->first();
            $curentTable->is_available = true;
            $curentTable->update();

            $data_table->is_available = false;
            $data_table->update();

            $pesanan->meja_id = $data_table->id;
            $pesanan->update();

            return redirect("history_diproses")->with('success', 'Data Meja telah diperbarui!!');
        } else {
            return redirect("pesan")->with('warning', 'Order Tidak Ada!!');
        }
    }
}
