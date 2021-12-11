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
                    <h3>Sukses Check Out <button style="float: right; margin:5px 5px 0px 0px;" class="btn btn-primary"
                            data-toggle="modal" data-target="#myModal">Upload
                            Bukti Pembayaran</button></h3>
                    <label>Kode Pesanan: {{ $pesanan->kode }}</label>
                    <h5>Pesanan anda berhasil check out selanjutnya silahkan transfer dan upload bukti pembayaran</h5>

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
                                            <th>Nama Barang</th>
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
                                            <td>{{ $pesanan->meja->jumlah_kursi }}</td>
                                            <td>{{ $pesanan->meja->sektor->nama }}</td>
                                            <td><img src="{{ asset($pesanan->meja->sektor->photo) }}" width="120px"
                                                    alt="">
                                            </td>
                                            <td><img src="{{ asset($pesanan->bukti_pembayaran) }}" width="120px" alt="">
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

    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Uploud Bukti Pembayaran</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="{{ url('bukti-pembayaran') }}" method="POST" enctype='multipart/form-data'>
                    @csrf
                    <input type="hidden" id="id" name="id" value="{{ $pesanan->id }}">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <input type="file" name="bukti_pembayaran" id="bukti_pembayaran">
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Upload</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
