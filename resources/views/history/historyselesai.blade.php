@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('seluruh_riwayat') }}"><button style="margin-right: 5px">Seluruh Riwayat</button></a>
                <a href="{{ url('history_selesai') }}"><button style="margin-right: 5px">Pesanan Selesai</button></a>
                <a href="{{ url('history_diproses') }}"><button style="margin-right: 5px">Dalam Proses</button></a>
            </div>
            <div class="col-md-12 mt-3">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-history"></i>Pesanan Selesai</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td>No</td>
                                    <td>Tanggal</td>
                                    <td>Kode Pesanan</td>
                                    <td>Status</td>
                                    <td>Jumlah Harga</td>
                                    <td>Aksi</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                @foreach ($pesanans as $pesanan)
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>{{ date('d M Y H:i', strtotime($pesanan->created_at)) }}</td>
                                        <td>{{ $pesanan->kode }}</td>
                                        <td>
                                            @if ($pesanan->keranjang_status == 1)
                                                {{ $pesanan->status }}
                                            @else
                                                Sudah Dibayar
                                            @endif
                                        </td>
                                        <td>Rp. {{ number_format($pesanan->total_harga) }}</td>
                                        <td>
                                            <a href="{{ url('history') }}/{{ $pesanan->id }}" class="btn btn-primary">
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
