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
                        <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-shopping-cart"></i>Check Out</h3>
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
                                            <th>Aksi</th>
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
                                                <td>
                                                    <form action="{{ url('delete/check-out') }}" method="post">
                                                        @csrf
                                                        <input type="hidden" name="menu_order_id"
                                                            value="{{ $menu_order->id }}">
                                                        <button type="submit" class="btn btn-danger btn-sm"><i
                                                                class="fa fa-trash"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                        <tr>
                                            <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                            <td> <strong>Rp. {{ number_format($order->total_harga) }}</strong> </td>
                                            <td>
                                                <a href="{{ url('konfirmasi-check-out') }}" class="btn btn-success">
                                                    <i class="fa fa-shopping-cart"></i>Check Out</a>
                                            </td>
                                        </tr>
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
