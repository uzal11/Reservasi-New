@extends('layouts.app')

@section('content')
    <div class="container">
        <h2 style="text-align: center">Menu Gartenhutte</h2>
        <div class="row justify-content-center">
            @foreach ($menus as $menu)
                <div class="col-md-4">
                    <div class="card">
                        <img src="{{ $menu->photo }}" class="card-img-top" alt="" />
                        <div class="card-body">
                            <h5 class="card-title">{{ $menu->nama }}</h5>
                            <p class="card-text">{{ $menu->deskripsi }}</p>
                            <p class="card-text">
                                <strong> Harga Rp.{{ number_format($menu->harga) }}</strong>
                            </p>
                            <a href="{{ url('order') }}/{{ $menu->id }}" class="btn btn-success">Tambah</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
