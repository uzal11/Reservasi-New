<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="{{ url('pesan') }}" class="btn btn-primary">Pilih Menu</a>

            </div>
            <div class="col-md-12 mt-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('pesan') }}"></a>Pesan</li>
                        <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-12">
                @if (!empty($pesanan))
                    <table id="example" class="table table-striped table-bordered dt-responsive nowrap"
                        style="width: 100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Menu</th>
                                <th>Jumlah</th>
                                <th>Harga</th>
                                <th>Total Harga</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1; ?>
                            @foreach ($pesanan->menu as $menu_pesanan)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $menu_pesanan->menu->nama }}</td>
                                    <td>{{ $menu_pesanan->jumlah }}</td>
                                    <td>Rp. {{ number_format($menu_pesanan->menu->harga) }}</td>
                                    <td>Rp. {{ number_format($menu_pesanan->total_harga) }}</td>
                                    <td>
                                        <form action="{{ url('delete/check-out') }}" method="post">
                                            @csrf
                                            <input type="hidden" name="menu_pesanan_id"
                                                value="{{ $menu_pesanan->id }}">
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                onclick="return confirm('Anda yakin ingin menghapus menu?');"><i
                                                    class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
            </div>
            <div class="col-md-12">
                <form id="formCO" action="{{ url('/konfirmasi-check-out') }}" method="post"
                    onsubmit="if(!confirm('Anda yakin ingin check out?')){return false;}">
                    @csrf
                    @if ($pesanan->jenis == 'Reservasi')
                        <h3>
                            <a href="{{ url('/meja') }}" class="btn btn-primary">Pilih Meja dan
                                Sektor</a>
                        </h3>
                    @endif
                    <table id="exampletable" class="table table-striped table-bordered dt-responsive nowrap"
                        style="width: 100%">
                        <thead>
                            <tr>

                                @if ($pesanan->jenis == 'Reservasi')
                                    <th>Waktu Reservasi</th>
                                @endif
                                <th>Nomor Meja</th>
                                <th>Jumlah Kursi</th>
                                <th>Sektor</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>

                                @php
                                    $currentDate = date('Y-m-d');
                                @endphp
                                @if ($pesanan->jenis == 'Reservasi')
                                    <td>
                                        <input type="datetime-local" min="{{ date('Y-m-d') }}T08:00" id="tgl"
                                            name="tgl" value="{{ date('Y-m-d') }}" min="{{ date('Y-m-d') }}"
                                            max="{{ date('Y-m-d', strtotime('1 weeks', strtotime($currentDate))) }}"
                                            required>
                                    </td>
                                @endif
                                <td>{{ $pesanan->meja->nama }}</td>
                                <td>Jumlah Kursi : {{ $pesanan->meja->jumlah_kursi }}
                                    {{ '(+' . $pesanan->tambahan_kursi . ')' }}
                                </td>
                                <td>{{ $pesanan->meja->sektor->nama }}</td>
                                <td><img src="{{ $pesanan->meja->sektor->photo }}" width="120px" alt=""></td>
                            </tr>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                    @if (!empty($pesanan->meja_id))
                        <h3>
                            <button type="submit" class="btn btn-success">
                                <i class="fa fa-shopping-cart"></i>Check Out</button>
                        </h3>
                    @endif

                </form>
                @endif
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js">
    </script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js">
    </script>

    <script>
        $(document).ready(function() {
            $("#example").DataTable();
        });
    </script>
</body>

</html>
