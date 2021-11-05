<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="{{ asset('js/instascan.min.js') }}"></script>
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    {{-- <script src="{{ asset('html5-qrcode.min.js') }}"></script> --}}
</head>

<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-5">
                <div class="card-header bg-transparent mb-0">
                    <h5 class="text-center"><span class="font-weight-bold text-primary">Scan QR Meja</span> </h5>
                    <div class="card-body">
                        <video id="preview" width="300" height="300" src=""></video>
                        <div class="form-group">
                            <input type="text" id="qrcode" class="form-control">
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</body>

<script type="text/javascript">
    let scanner = new Instascan.Scanner({
        video: document.getElementById('preview')
    });
    scanner.addListener('scan', function(content) {
        //alert(content);
        //$("#qrcode").val(content);
        window.location = '/reservasi1/public/scan/' + content;
    });

    Instascan.Camera.getCameras().then(function(cameras) {
        if (cameras.length > 0) {
            scanner.start(cameras[0])
        } else
            console.error('No cameras found')
    }).catch(function(e) {
        console.error(e)
    });
</script>

</html>
