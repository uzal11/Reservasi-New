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
                            <th>Nama Menu</th>
                            <th>Jumlah</th>
                            <th>Status Pesanan</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; ?>
                        @foreach ($menu_pesanans as $menu_pesanan)
                            <tr>
                                <td>{{ $no++ }}</td>
                                <td>{{ $menu_pesanan->pesanan->user->name }}</td>
                                <td>{{ $menu_pesanan->pesanan->kode }}</td>
                                <td>{{ $menu_pesanan->menu->nama }}</td>
                                <td>{{ $menu_pesanan->jumlah }}</td>
                                <td>{{ $menu_pesanan->pesanan->status_pesanan }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

        @endsection
