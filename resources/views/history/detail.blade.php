@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('seluruh_riwayat') }}" class="btn btn-primary">Kembali</a>

            </div>
            <div class="col-md-12 mt-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('seluruh_riwayat') }}">Riwayat Pemesanan</a></li>

                        <li class="breadcrumb-item active" aria-current="page">Detail Pemesanan</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card mt-2">
                    <div class="card-header">

                        <h3>Berhasil Pesan</h3>
                        <label>Kode Pesanan: {{ $pesanan->kode }}</label>
                    </div>
                </div>
                <div class="card mt-2">
                    <div class="card-header">
                        <h3><i class="fa fa-shopping-cart"></i>Detail Pemesanan</h3>
                        @if (!empty($pesanan))
                            <div class="body">
                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap"
                                    style="width: 100%">
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
                                        <?php $no = 1; ?>
                                        <?php $total_harga = 0; ?>
                                        @foreach ($menu_pesanans as $menu_pesanan)
                                            <?php $total_harga += $menu_pesanan->total_harga; ?>
                                            <tr>
                                                <td>{{ $no++ }}</td>
                                                <td>{{ $menu_pesanan->menu->nama }}</td>
                                                <td>{{ $menu_pesanan->jumlah }}</td>
                                                <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                                                <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                                            </tr>
                                        @endforeach
                                        @if (empty($pesanan->rencana_tiba))
                                            <tr>
                                                <td><a href="{{ url('/table') }}" class="btn btn-primary">Pilih Meja dan
                                                        Sektor</a></td>
                                            </tr>
                                        @endif
                                    </tbody>
                                    {{-- <tfoot>
                                        <tr>
                                            <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                            <td> <strong>Rp. {{ number_format($pesanan->total_harga) }}</strong> </td>
                                        </tr>
                                    </tfoot> --}}
                                </table>
                                <h4>Sub Total : <strong>Rp.
                                        {{ number_format($total_harga) }}</strong></h4>
                            </div>

                            <div class="body">
                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap"
                                    style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th>Nomor Meja</th>
                                            <th>Kapasitas</th>
                                            <th>Sektor</th>
                                            <th>Foto</th>
                                            <th>Status dan Bukti Pembayaran</th>
                                            <th>Waktu Reservasi</th>
                                        </tr>

                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>{{ $pesanan->meja->nama }}</td>
                                            <td>{{ $pesanan->meja->jumlah_kursi }}</td>
                                            <td>{{ $pesanan->meja->sektor->nama }}</td>
                                            <td><img src="{{ asset($pesanan->meja->sektor->photo) }}" width="120px"
                                                    alt="">
                                            </td>
                                            <td>
                                                <p>{{ $pesanan->status_pembayaran }}</p>
                                                <img src="{{ asset($pesanan->bukti_pembayaran) }}" width="120px" alt="">
                                            </td>
                                            <td>{{ date('d M Y H:i', strToTime($pesanan->rencana_tiba)) }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        @endif
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $("table").dataTable({
                "paging": false,
                "searching": false,
                "language": {
                    "emptyTable": "Belum Ada Data Yang Dipilih"
                }
            });

        });
    </script>
@endsection
