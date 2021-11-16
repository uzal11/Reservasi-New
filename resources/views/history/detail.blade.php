@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('history') }}" class="btn btn-primary">Kembali</a>

            </div>
            <div class="col-md-12 mt-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                        <li class="breadcrumb-item"><a href="{{ url('history') }}"></a>Riwayat Pemesanan</li>

                        <li class="breadcrumb-item active" aria-current="page">Detail Pemesanan</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card body">
                    <h3>Sukses Check Out</h3>
                    <h5>Pesanan anda berhasil check out selanjutnya silahkan transfer dan uploud bukti pembayaran</h5>
                </div>
                <div class="card mt-2">
                    <div class="card-header">
                        <h3><i class="fa fa-shopping-cart"></i>Detail Pemesanan</h3>
                        @if (!empty($order))
                            <div class="body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama Barang</th>
                                            <th>Jumlah</th>
                                            <th>Harga</th>
                                            <th>Total Harga</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $no = 1; ?>
                                        @foreach ($menu_orders as $menu_order)
                                            <tr>
                                                <td>{{ $no++ }}</td>
                                                <td>{{ $menu_order->menu->name }}</td>
                                                <td>{{ $menu_order->jumlah }}</td>
                                                <td>{{ $menu_order->menu->price }}</td>
                                                <td>Rp. {{ number_format($menu_order->total_harga) }}</td>
                                            </tr>
                                        @endforeach
                                        <tr>
                                            <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                            <td> <strong>Rp. {{ number_format($order->total_harga) }}</strong> </td>
                                        </tr>
                                        <tr>
                                            <td><a href="{{ url('/table') }}" class="btn btn-primary">Pilih Meja dan
                                                    Sektor</a></td>
                                        </tr>
                                        <tr>
                                            <th>Nomor Meja</th>
                                            <th>Kapasitas</th>
                                            <th>Sektor</th>
                                            <th>Foto</th>
                                            <th>Waktu Reservasi</th>
                                        </tr>
                                        @foreach ($tables as $table)
                                            <tr>
                                                <td>{{ $table->name }}</td>
                                                <td>{{ $table->capacity }}</td>
                                                <td>{{ $table->region->name }}</td>
                                                <td><img src="{{ $table->region->photo }}" width="15%" alt=""></td>
                                                <td></td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                        @endif
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
@endsection