@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('pesan') }}" class="btn btn-primary">Kembali</a>

            </div>
            <div class="col-md-12 mt-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                        <li class="breadcrumb-item active" aria-current="page">Riwayat Pemesanan</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-history"></i>Riwayat Pemesanan</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td>No</td>
                                    <td>Tanggal</td>
                                    <td>Status</td>
                                    <td>Jumlah Harga</td>
                                    <td>Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                @foreach ($orders as $order)
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>{{ $order->kapan_pesan }}</td>
                                        <td>
                                            @if ($order->keranjang_status == 1)
                                                Sudah Pesan & Belum Dibayar
                                            @else
                                                Sudah Dibayar
                                            @endif
                                        </td>
                                        <td>Rp. {{ number_format($order->total_harga) }}</td>
                                        <td>
                                            <a href="{{ url('history') }}/{{ $order->id }}" class="btn btn-primary">
                                                <i class="fa fa-info"></i>Detail</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
@endsection
