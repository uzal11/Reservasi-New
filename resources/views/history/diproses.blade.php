@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('seluruh_riwayat') }}"><button class="btn btn-primary"
                        style="margin-right: 5px; margin-bottom: 5px">Seluruh
                        Riwayat</button></a>
                <a href="{{ url('history_selesai') }}"><button class="btn btn-primary"
                        style="margin-right: 5px; margin-bottom: 5px">Pesanan
                        Selesai</button></a>
                <a href="{{ url('history_diproses') }}"><button class="btn btn-primary"
                        style="margin-right: 5px; margin-bottom: 5px">Dalam
                        Proses</button></a>
            </div>
            <div class="col-md-12 mt-3">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-history"></i>Pesanan Diproses</h3>
                        <table id="example" class="table table-striped table-bordered dt-responsive nowrap"
                            style="width: 100%">
                            <thead>
                                <tr>
                                    <td>No</td>
                                    <td>Tanggal Pesan</td>
                                    <td>Tanggal Reservasi</td>
                                    <td>Kode Pesanan</td>
                                    <td>Status Pesanan</td>
                                    <td>Jumlah Harga</td>
                                    <td>Aksi</td>
                                    <td>Pindah Meja</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                @foreach ($pesanans as $pesanan)
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>{{ date('d M Y H:i', strtotime($pesanan->created_at)) }}</td>
                                        <td>{{ date('d M Y H:i', strtotime($pesanan->rencana_tiba)) }}</td>
                                        <td>{{ $pesanan->kode }}</td>
                                        <td>
                                            @if ($pesanan->keranjang_status == 1)
                                                {{ $pesanan->status_pesanan }}
                                            @else
                                                Sudah Dibayar
                                            @endif
                                        </td>
                                        <td>Rp. {{ number_format($pesanan->total_harga) }}</td>
                                        <td>
                                            <a href="{{ url('history') }}/{{ $pesanan->id }}" class="btn btn-primary">
                                                <i class="fa fa-info"></i>Detail</a>
                                        </td>
                                        <td>
                                            <a href="{{ url('/scan-pindah-meja/' . $pesanan->id) }}"
                                                class="btn btn-success">
                                                <i class="fa fa-table"></i>Pindah Meja</a>
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
    <script>
        $(document).ready(function() {
            $("table").DataTable();
        });
    </script>
@endsection
