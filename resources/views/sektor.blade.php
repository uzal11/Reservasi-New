@extends('layouts.app')

@section('content')
    <div class="container">
        <h2 style="text-align: center">Pilih Sektor</h2>
        <div class="row justify-content-center">
            @foreach ($sektors as $sektor)
                <div class="col-md-4">
                    <div class="card">
                        <img src="{{ $sektor->photo }}" class="card-img-top" alt="" />
                        <div class="card-body">
                            <h5 class="card-title">{{ $sektor->nama }}</h5>
                            <a href="#" class="btn btn-success">Pilih</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
