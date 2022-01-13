@extends('crudbooster::admin_template')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Pelanggan</th>
                            <th>Kode Pesanan</th>
                            <th>Jenis Pesanan</th>
                            <th>Nomor Meja</th>
                            <th>Sektor</th>
                            <th>Tanggal Pesan/Reservasi</th>
                            <th>Rencana Tiba</th>
                            <th>Tambahan Kursi</th>
                            <th>Status Pesanan</th>
                            <th>Bukti Pembayaran</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; ?>
                        @foreach ($pesanans as $pesanan)
                            <tr>
                                <td>{{ $no++ }}</td>
                                <td>{{ $pesanan->user->name }}</td>
                                <td>{{ $pesanan->kode }}</td>
                                <td>{{ $pesanan->jenis }}</td>
                                <td>{{ $pesanan->meja->nama }}</td>
                                <td>{{ $pesanan->meja->sektor->nama }}</td>
                                <td>{{ $pesanan->kapan_pesan }}</td>
                                <td>{{ $pesanna->rencana_tiba }}</td>
                                <td>{{ $pesanan->tambahan_kursi }}</td>
                                <td>{{ $pesanan->status_pesanan }}</td>
                                <td>{{ $pesanan->bukti_pembayaran }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

        @endsection
