@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Pilih Meja</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-table"></i>Pilih Meja</h3>
                        <div class="body">
                            <table id="example" class="table table-striped table-bordered dt-responsive nowrap"
                                style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Sektor</th>
                                        <th>Nomor Meja</th>
                                        <th>Info Meja</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $no = 1; ?>
                                    @foreach ($mejas as $meja)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td>
                                                <h6>{{ $meja->sektor->nama }}</h6>
                                                <img src="{{ $meja->sektor->photo }}" class="img-thumbnail" width="120px"
                                                    alt="">
                                            </td>
                                            <td>{{ $meja->nama }}</td>
                                            <td>
                                                <form id="frm{{ $no }}"
                                                    action="{{ url('ordermeja/' . $meja->id) }}" method="post">
                                                    @csrf
                                                    Kapasitas Umum : {{ $meja->jumlah_kursi }}
                                                    <br>
                                                    <br>
                                                    Tambahan Kursi :
                                                    <input type="number" name="tambah_kursi" id="tambah_kursi" value="0"
                                                        min="0" max="{{ $meja->max_kursi - $meja->jumlah_kursi }}">
                                                </form>
                                            </td>
                                            <td>
                                                <button
                                                    onclick="if (document.getElementById('tambah_kursi').value > {{ $meja->max_kursi - $meja->jumlah_kursi }}) 
                                                                                                                                        { 
                                                                                                                                            alert('jumlah tambah kursi melebihi kapasitas!!!'); 
                                                                                                                                        } 
                                                                                                                                            else if (document.getElementById('tambah_kursi').value < 0) 
                                                                                                                                        { 
                                                                                                                                            alert ('kapasitas tidak boleh dibawah nol'); 
                                                                                                                                        } 
                                                                                                                                            else {document.getElementById('frm{{ $no }}').submit();
                                                                                                                                        }
                                                                                                                                                                                
                                                                                                                                        "
                                                    class="btn btn-primary btn-sm">
                                                    Pilih
                                                </button>
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
            $("table").dataTable({
                "paging": false,
                "searching": false
            });
        });
    </script>
@endsection
