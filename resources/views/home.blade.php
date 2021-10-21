@extends('layouts.app')

@section('content')
    <div class="container">
        <h1 style="text-align: center" class="font-weight-bold">Selamat Datang di Gartenhutte</h1>
        <h3 style="text-align: center" class="mt-5"><a href="{{ url('/scan') }}">Pesan Di Tempat</a></h3>
        <h3 style="text-align: center"><a href="{{ url('/pesan') }}">Reservasi</a></h3>
    @endsection
