@extends('layouts.app')

<style>
    .card-menu {

        height: 100px;

        text-align: center;

        padding-top: 30px;

        background-color: #1A1A40;

        color: white;

        border: 1px;

        border-radius: 100px;

        font-size: 20px
    }

</style>



@section('content')

    <div class="container">

        <h2 style="text-align: center">Selamat Datang Di Gartenhutte</h2>

        <br>

        <div class="row justify-content-center">

            <div href="{{ url('/meja') }}" class="col-6 col-md-6 col-sm-6 back">

                <a href="{{ url('/meja') }}" class="card card-menu"
                    style="text-decoration:none;color:white; background-color: #1A1A40;">

                    Reservasi

                </a>

            </div>

            <div class="col-6 col-md-6 col-sm-6">

                <a href="{{ url('/scan') }}" class="card card-menu"
                    style="text-decoration:none;color:white; background-color: #1A1A40;">

                    Pesan Di Tempat

                </a>

            </div>

        </div>

    </div>

    <br>

    <div class="container">

        <div class="row justify-content-center">

            @foreach ($menus as $menu)

                <div class="col-6 col-md-4 col-sm-6">

                    <div class="card">

                        <img src="{{ $menu->photo }}" class="card-img-top" alt="" />

                        <div class="card-body">

                            <h5 class="card-title">{{ $menu->nama }}</h5>

                            <p class="card-text">{{ $menu->deskripsi }}</p>

                            <p class="card-text">

                                <strong> Harga Rp.{{ number_format($menu->harga) }}</strong>

                            </p>

                        </div>

                    </div>

                </div>

            @endforeach

        </div>

    </div>

    </div>

@endsection
