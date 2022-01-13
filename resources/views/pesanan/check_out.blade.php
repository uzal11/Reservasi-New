@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12 mt-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                            <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-12">
                    {{-- <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post"
                        onsubmit="if(!confirm('Anda yakin ingin check out?')){return false;}">
                        @csrf --}}
                    {{-- @if ($pesanan->jenis == 'Reservasi')
                            <h3>
                                <a href="{{ url('/meja') }}" class="btn btn-primary">Pilih Meja dan
                                    Sektor</a>
                            </h3>
                        @endif --}}
                    <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                        <thead>
                            <tr>
                                {{-- @if ($pesanan->jenis == 'Reservasi')
                                <th>Waktu Reservasi</th>
                                @endif --}}
                                <th>Nomor Meja</th>
                                <th>Jumlah Kursi</th>
                                <th>Sektor</th>
                                <th>Foto</th>
                                <th>Status dan Bukti Pembayaran</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if (!empty($pesanan))
                                <tr>
                                    <td>
                                        {{-- <a href="{{ url('/meja') }}" class="btn btn-primary">Pilih Meja dan
                                            Sektor</a>
                                        <br> --}}
                                        {{ $pesanan->meja->nama }}
                                    </td>
                                    <td>Jumlah Kursi : {{ $pesanan->meja->jumlah_kursi }}
                                        {{ '(+' . $pesanan->tambahan_kursi . ')' }}
                                    </td>
                                    <td>{{ $pesanan->meja->sektor->nama }}</td>
                                    <td><img src="{{ $pesanan->meja->sektor->photo }}" width="120px" alt=""></td>
                                    <td>
                                        <p>{{ $pesanan->status_pembayaran }}</p>
                                        <img src="{{ asset($pesanan->bukti_pembayaran) }}" width="120px" alt="">
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12">
                    {{-- <a href="{{ url('pesan') }}" class="btn btn-primary">Pilih Menu</a> --}}
                    <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Menu</th>
                                <th>Catatan</th>
                                <th>Jumlah</th>
                                <th>Harga</th>
                                <th>Sub Total Harga</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if (!empty($pesanan->menu))
                                <?php $no = 1; ?>
                                <?php $total_harga = 0; ?>
                                @foreach ($pesanan->menu as $menu_pesanan)
                                    <?php $total_harga += $menu_pesanan->total_harga; ?>
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>{{ $menu_pesanan->menu->nama }}</td>
                                        <td>{{ $menu_pesanan->catatan }}</td>
                                        <td>{{ $menu_pesanan->jumlah }}</td>
                                        <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                                        <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                                        <td>
                                            {{-- <button class="btn btn-primary btn-sm mb-3" data-toggle="modal"
                                            data-target="#modalEdit"><i class="fa fa-edit"></i></button></h3> --}}
                                            <form action="{{ url('delete/check-out') }}" method="post">
                                                @csrf
                                                <input type="hidden" name="menu_pesanan_id"
                                                    value="{{ $menu_pesanan->id }}">
                                                <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Anda yakin ingin menghapus menu?');"><i
                                                        class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                        </tbody>
                        {{-- <tfoot>
                            <tr>
                                <td colspan="5" align="right"><strong>Sub Total :</strong> </td>
                                <td> <strong>Rp. {{ number_format($pesanan->total_harga) }}</strong> </td>
                                <td></td>
                            </tr>
                        </tfoot> --}}
                    </table>
                    <h4>Total Harga : <strong>Rp.
                            {{ number_format($total_harga) }}</strong></h4>
                    @if ($pesanan->menu && sizeof($pesanan->menu) > 0)
                        <h3>
                            <button class="btn btn-success" data-toggle="modal" data-target="#myModal"><i
                                    class="fa fa-shopping-cart"></i>Check Out</button>
                        </h3>
                    @else
                        {{-- @if (empty($pesanan)) --}}
                        {{-- <h3>Belum ada pesanan</h3> --}}
                        <h3>
                            <button class="btn btn-success" data-toggle="modal" disabled data-target="#myModal"><i
                                    class="fa fa-shopping-cart"></i>Check Out</button>
                        </h3>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="modalEdit">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Edit Pesanan</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post" enctype='multipart/form-data'
                    onsubmit="if(!confirm('Anda yakin ingin check out?')){return false;}">
                    @csrf
                    <input type="hidden" id="id" name="id" value="{{ $pesanan->id }}">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <H4>Detail Pesanan</H4>
                        <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Nama Menu</th>
                                    <th>Jumlah</th>
                                    <th>Harga</th>
                                    <th>Sub Total Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (!empty($pesanan->menu))
                                    @foreach ($pesanan->menu as $menu_pesanan)
                                        <tr>
                                            <td>{{ $menu_pesanan->menu->nama }}</td>
                                            <td>{{ $menu_pesanan->jumlah }}</td>
                                            <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                                            <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                                        </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"><strong>Bayar dan Upload Bukti Pembayaran</strong></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post" enctype='multipart/form-data'
                    onsubmit="if(!confirm('Anda yakin ingin check out?')){return false;}">
                    @csrf
                    <input type="hidden" id="id" name="id" value="{{ $pesanan->id }}">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <h3>Atur Waktu Reservasi</h3>
                        <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
                            <thead>
                                <tr>
                                    @if ($pesanan->jenis == 'Reservasi')
                                        <th>Waktu Reservasi</th>
                                    @endif
                                    <th>Nomor Meja</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $currentDate = date('Y-m-d');
                                @endphp
                                @if ($pesanan->jenis == 'Reservasi')
                                    <td>
                                        <input type="datetime-local" min="{{ date('Y-m-d') }}T08:00" id="tgl" name="tgl"
                                            value="{{ date('Y-m-d') }}" min="{{ date('Y-m-d') }}"
                                            max="{{ date('Y-m-d', strtotime('1 weeks', strtotime($currentDate))) }}"
                                            required>
                                    </td>
                                @endif
                                </>
                                <td>{{ $pesanan->meja->nama }}</td>
                            </tbody>
                        </table>
                        <br>
                        <H6>Silahkan Transfer Ke Rekening Tujuan dan Upload Bukti Pembayaran</H6>
                        <p><strong>Total Pembayaran: Rp. {{ number_format($total_harga) }}</strong></p>
                        <p>BCA : 0899278987</p>
                        <p>BNI : 3403980984</p>
                        <input type="file" name="bukti_pembayaran" id="bukti_pembayaran" accept="image/png, image/jpeg"
                            required>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Konfirmasi Pesanan</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
                    </div>
                </form>
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
