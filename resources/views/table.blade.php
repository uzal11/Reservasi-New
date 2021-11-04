@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('pesan') }}" class="btn btn-primary">Kembali</a>

            </div>
            <div class="col-md-12 mt-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                        <li class="breadcrumb-item active" aria-current="page">Pilih Meja</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-table"></i>Pilih Meja</h3>
                        <div class="body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nomor Meja</th>
                                        <th>Kapasitas</th>
                                        <th>Sektor</th>
                                        {{-- <th>Waktu Reservasi</th> --}}
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $no = 1; ?>
                                    @foreach ($tables as $table)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>{{ $table->name }}</td>
                                            <td>{{ $table->capacity }}</td>
                                            <td><img src="{{ $table->region->photo }}" class="img-thumbnail" width="15%"
                                                    alt="">
                                            </td>
                                            {{-- <td>
                                                <input type="text" id="date">
                                            </td> --}}
                                            <td>
                                                <form action="{{ url('ordermeja') }}/{{ $table->id }}" method="post">
                                                    @csrf
                                                    <button type="submit" class="btn btn-primary btn-sm">
                                                        Pilih
                                                    </button>
                                                </form>
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
