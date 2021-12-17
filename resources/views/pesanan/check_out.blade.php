@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <a href="{{ url('pesan') }}" class="btn btn-primary">Pilih Menu</a>

        </div>
        <div class="col-md-12 mt-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                    <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                </ol>
            </nav>
        </div>
        <div class="col-md-12">
            @if(!empty($pesanan))
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Menu</th>
                        <th>Jumlah</th>
                        <th>Harga</th>
                        <th>Total Harga</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; ?>
                    @foreach ($pesanan->menu as $menu_pesanan)
                    <tr>
                        <td>{{ $no++ }}</td>
                        <td>{{ $menu_pesanan->menu->nama }}</td>
                        <td>{{ $menu_pesanan->jumlah }}</td>
                        <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                        <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                        <td>
                            <form action="{{ url('delete/check-out') }}" method="post">
                                @csrf
                                <input type="hidden" name="menu_pesanan_id" value="{{ $menu_pesanan->id }}">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Anda yakin ingin menghapus menu?');"><i class="fa fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                    <tr>
                        <td colspan="4" align="right"><strong>Sub Total :</strong> </td>
                        <td> <strong>Rp. {{ number_format($pesanan->total_harga) }}</strong> </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-12">
            <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post" onsubmit="return confirm('Anda yakin ingin check out?');">
                @csrf
                @if($pesanan->jenis == "Reservasi")
                <h3>
                    <a href="{{ url('/meja') }}" class="btn btn-primary">Pilih Meja dan
                        Sektor</a>
                </h3>
                @endif
                <table class="table table-striped">
                    <thead>
                        <tr>

                            @if($pesanan->jenis == "Reservasi")
                            <th>Waktu Reservasi</th>
                            @endif
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
                            @if($pesanan->jenis == "Reservasi")
                            <td>
                                <input type="datetime-local" min="{{date('Y-m-d')}}T08:00" id="tgl" name="tgl" value="{{ date('Y-m-d') }}" min="{{ date('Y-m-d') }}" max="{{ date('Y-m-d', strtotime('1 weeks', strtotime($currentDate))) }}">
                                <!-- \ -->
                                <!-- <br>
                                <select name="jam" id="jam" title="jam">
                                    @php
                                    $jam = 24;
                                    @endphp
                                    @for ($i = 0; $i < $jam; $i++) @php $strSel='' ; if ($i==intval(date('H'))) { $strSel=' selected="selected"' ; } @endphp <option value="{{ $i }}" {{ $strSel }}>
                                        {{ $i }}</option>
                                        @endfor
                                </select>
                                :
                                <select name="min" id="min" title="menit">
                                    @php
                                    $jam = 60;
                                    @endphp
                                    @for ($i = 0; $i < $jam; $i++) @php $strSel='' ; if ($i==intval(date('i'))) { $strSel=' selected="selected"' ; } @endphp <option value="{{ $i }}" {{ $strSel }}>
                                        {{ $i }}</option>
                                        @endfor
                                </select> -->
                            </td>
                            @endif
                            <td>{{ $pesanan->meja->nama }}</td>
                            <td>Jumlah Kursi : {{ $pesanan->meja->jumlah_kursi }}
                                {{ '(+' . $pesanan->tambahan_kursi . ')' }}
                            </td>
                            <td>{{ $pesanan->meja->sektor->nama }}</td>
                            <td><img src="{{ $pesanan->meja->sektor->photo }}" width="120px" alt=""></td>
                        </tr>
                        <tr>

                        </tr>
                    </tbody>
                </table>
                @if (!empty($pesanan->meja_id))
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