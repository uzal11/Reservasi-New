@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('pesan') }}" class="btn btn-primary">Kembali</a>

            </div>
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                        <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                @if (!empty($order))
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
                                            <input type="hidden" name="menu_order_id" value="{{ $menu_order->id }}">
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                onclick="return confirm('Anda yakin ingin menghapus menu?');"><i
                                                    class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            <tr>
                                <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                                <td> <strong>Rp. {{ number_format($order->total_harga) }}</strong> </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <div class="col-md-12">
                <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post"
                    onsubmit="return confirm('Anda yakin ingin check out?');">
                    @csrf
                    <h3>
                        <a href="{{ url('/table') }}" class="btn btn-primary">Pilih Meja dan
                            Sektor</a>
                    </h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Waktu Reservasi</th>
                                <th>Nomor Meja</th>
                                <th>Jumlah Kursi</th>
                                <th>Sektor</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>

                                @php
                                    $currentDate = date('Y-m-d');
                                @endphp
                                <td>

                                    <input type="date" id="tgl" name="tgl" value="{{ date('Y-m-d') }}"
                                        min="{{ date('Y-m-d') }}"
                                        max="{{ date('Y-m-d', strtotime('1 weeks', strtotime($currentDate))) }}">\
                                    <br>
                                    <select name="jam" id="jam" title="jam">
                                        @php
                                            $jam = 24;
                                        @endphp
                                        @for ($i = 0; $i < $jam; $i++)

                                            @php
                                                $strSel = '';
                                                if ($i == intval(date('H'))) {
                                                    $strSel = ' selected="selected"';
                                                }
                                            @endphp
                                            <option value="{{ $i }}" {{ $strSel }}>
                                                {{ $i }}</option>
                                        @endfor
                                    </select>
                                    :
                                    <select name="min" id="min" title="menit">
                                        @php
                                            $jam = 60;
                                        @endphp
                                        @for ($i = 0; $i < $jam; $i++)
                                            @php
                                                $strSel = '';
                                                if ($i == intval(date('i'))) {
                                                    $strSel = ' selected="selected"';
                                                }
                                            @endphp
                                            <option value="{{ $i }}" {{ $strSel }}>
                                                {{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>{{ $order->table->name }}</td>
                                <td>Jumlah Kursi : {{ $order->table->jumlah_kursi }}
                                    {{ '(+' . $order->tambahan_kursi . ')' }}
                                </td>
                                <td>{{ $order->table->region->name }}</td>
                                <td><img src="{{ $order->table->region->photo }}" width="120px" alt=""></td>
                            </tr>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                    @if (!empty($order->table_id))
                        <h3>
                            <button onclick="document.getElementById('formCO').submit();" class="btn btn-success">
                                <i class="fa fa-shopping-cart"></i>Check Out</button>
                        </h3>
                    @endif

                </form>
                @endif
            </div>
        </div>
    </div>
@endsection
