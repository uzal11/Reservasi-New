@extends('layouts.app')

@section('content')
<div class="container">
   <div class="row">
       <div class="col-md-12">
           <a href="{{ url('home') }}" class="btn btn-primary">Kembali</a>

       </div>
        <div class="col-md-12 mt-3">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h4> {{ $menu->name }}</h4>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Harga</td>
                                        <td>:</td>
                                        <td>Rp. {{ number_format($menu->price) }}</td>
                                    </tr>
                                    <tr>
                                        <td>Deskripsi</td>
                                        <td>:</td>
                                        <td>{{ $menu->description }}</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Jumlah  </td>
                                        <td>:</td>
                                        <td>
                                            <form method="post" action="{{ url('order') }}/{{ $menu->id }}" >
                                            @csrf
                                            <input type="text" name="jumlah_order" class="form-control" required>
                                            <button type="submit" class="btn btn-success mt-3">Pesan</button>
                                        </td>
                                     </tr>
                                    </form>
                                    
                                    
                                </tbody>
                        </table>

                        </div>
                    </div>

                </div>

            </div>
        </div>
   </div>
</div>
@endsection
