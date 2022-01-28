@extends('crudbooster::admin_template')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-3">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fa fa-search"></i>Pesanan</h3>
                        <table class="table table-striped" id="example">
                            <thead>
                                <tr>
                                    <td>No</td>
                                    <td>Transaksi</td>
                                    <td>Nama Menu</td>
                                    <td>Action</td>

                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                @foreach ($pesanans as $pesanan)
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>
                                            <div class="card" style="width: 100%;">
                                                <img class="card-img-top" src="{{ $pesanan->meja->sektor->photo }}"
                                                    alt="Card image cap"
                                                    style="float: left; width:120px; margin-right:5px; ">
                                                <div class="card-body" style="float: left">
                                                    <h5 class="card-title">Pesanan Meja
                                                        <b>{{ $pesanan->meja->nama }}
                                                            ({{ $pesanan->meja->sektor->nama }})</b>
                                                    </h5>
                                                    <p class="card-text">
                                                        Kode Pesananan : <b>{{ $pesanan->kode }}</b>
                                                        <br>
                                                        Waktu Penyiapan :
                                                        <b>{{ date('d M Y H:i', strtotime($pesanan->rencana_tiba)) }}</b>
                                                        <br>
                                                        Status :
                                                        @if ($pesanan->keranjang_status == 1)
                                                            <b>{{ $pesanan->status_pesanan }}</b>
                                                        @else
                                                            <b>Sudah Dibayar</b>
                                                        @endif
                                                        <br>
                                                        Total : Rp.
                                                        {{ number_format($pesanan->total_harga, 0, ',', '.') }}
                                                        <br>
                                                    <form action="{{ url('update_status') }}/{{ $pesanan->id }}"
                                                        method="post">
                                                        @csrf
                                                        <button type="submit">Selesai</button>
                                                    </form>
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            @foreach ($pesanan->menu as $pesananmenu)
                                                <span class="label label rage label-info" style="margin: 5px;">
                                                    {{ $pesananmenu->jumlah }} {{ $pesananmenu->menu->nama }} -
                                                    {{ $pesananmenu->total_harga }}
                                                </span>
                                            @endforeach
                                        </td>
                                        <td>
                                            <a href="{{ url('pesanan/' . $pesanan->id) }}">
                                                <span class="label label-info"> Detail </span>
                                            </a>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function() {
                    var groupColumn = 1;
                    var table = $('#example').DataTable({
                        "columnDefs": [{
                            "visible": false,
                            "targets": groupColumn
                        }],
                        "pesanan": [
                            [groupColumn, 'asc']
                        ],
                        "displayLength": 25,
                        "drawCallback": function(settings) {
                            var api = this.api();
                            var rows = api.rows({
                                page: 'current'
                            }).nodes();
                            var last = null;

                            api.column(groupColumn, {
                                page: 'current'
                            }).data().each(function(group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before(
                                        '<tr class="group"><td colspan="5">' + group + '</td></tr>'
                                    );

                                    last = group;
                                }
                            });
                        }
                    });
    </script>
@endsection
