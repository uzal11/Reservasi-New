<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
</head>

<body>
    <div class="col-md-12">
        @if (!empty($pesanan))
            <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%">
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
                                    <input type="hidden" name="menu_pesanan_id" value="{{ $menu_pesanan->id }}">
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
