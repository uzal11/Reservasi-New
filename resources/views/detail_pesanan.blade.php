@extends('crudbooster::admin_template')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-2">
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
                                        <th>Nama Menu</th>
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
                                            <td>Rp. {{ number_format($menu_order->menu->price) }}</td>
                                            <td>Rp. {{ number_format($menu_order->total_harga) }}</td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                        <td> <strong>Rp. {{ number_format($order->total_harga) }}</strong> </td>
                                    </tr>
                                    @if (empty($order->rencana_tiba))
                                        <tr>
                                            <td><a href="{{ url('/table') }}" class="btn btn-primary">Pilih Meja dan
                                                    Sektor</a></td>
                                        </tr>
                                    @endif
                                    <tr>
                                        <th>Nomor Meja</th>
                                        <th>Kapasitas</th>
                                        <th>Sektor</th>
                                        <th>Foto</th>
                                        <th>Bukti Pembayaran</th>
                                        <th>Waktu Reservasi</th>
                                    </tr>
                                    {{-- @foreach ($tables as $table) --}}
                                    <tr>
                                        <td>{{ $order->table->name }}</td>
                                        <td>{{ $order->table->capacity }}</td>
                                        <td>{{ $order->table->region->name }}</td>
                                        <td><img src="{{ asset($order->table->region->photo) }}" width="15%" alt="">
                                        </td>
                                        <td><img src="{{ asset($order->bukti_pembayaran) }}" width="15%" alt="">
                                        </td>
                                        <td>{{ date('d M Y H:i', strToTime($order->rencana_tiba)) }}</td>
                                    </tr>
                                    {{-- @endforeach --}}
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
