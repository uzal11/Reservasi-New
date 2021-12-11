@extends('crudbooster::admin_template')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-2">
            </div>
            <div class="card mt-2">
                <div class="card-header">
                    <h3><i class="fa fa-shopping-cart"></i>Detail Pemesanan</h3>
                    @if (!empty($pesanan))
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
                                    @foreach ($menu_pesanans as $menu_pesanan)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>{{ $menu_pesanan->menu->nama }}</td>
                                            <td>{{ $menu_pesanan->jumlah }}</td>
                                            <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                                            <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                        <td> <strong>Rp. {{ number_format($pesanan->total_harga) }}</strong> </td>
                                    </tr>
                                    @if (empty($pesanan->rencana_tiba))
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
                                        <td>{{ $pesanan->meja->nama }}</td>
                                        <td>{{ $pesanan->meja->kapasitas }}</td>
                                        <td>{{ $pesanan->meja->sektor->nama }}</td>
                                        <td><img src="{{ asset($pesanan->meja->sektor->photo) }}" width="15%" alt="">
                                        </td>
                                        <td><img src="{{ asset($pesanan->bukti_pembayaran) }}" width="15%" alt="">
                                        </td>
                                        <td>{{ date('d M Y H:i', strToTime($pesanan->rencana_tiba)) }}</td>
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
