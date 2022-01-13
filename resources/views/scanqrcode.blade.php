<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reservasi</title>

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
                    <div class="card-body align-items-center d-flex justify-content-center">
                        <video id="preview" width="300" height="300" src=""></video>
                    </div>
                </div>

            </div>

        </div>

    </div>
</body>

<script type="text/javascript">
    let scanner = new Instascan.Scanner({
        video: document.getElementById('preview'),
        mirror: false
    });
    scanner.addListener('scan', function(content) {
        //alert(content);
        //$("#qrcode").val(content);
        window.location = 'scan/' + content;
    });

    Instascan.Camera.getCameras().then(function(cameras) {
        if (cameras.length > 0) {
            scanner.start(cameras[0]);
            $('[name="options"]').on('change', function() {
                if ($(this).val() == 1) {
                    if (cameras[0] != "") {
                        scanner.start(cameras[0]);
                    } else {
                        alert('No Front camera found!');
                    }
                } else if ($(this).val() == 2) {
                    if (cameras[1] != "") {
                        scanner.start(cameras[1]);
                    } else {
                        alert('No Back camera found!');
                    }
                }
            });
        } else {
            console.error('No cameras found.');
            alert('No cameras found.');
        }
    }).catch(function(e) {
        console.error(e);
        alert(e);
    });
</script>
<div class="btn-group btn-group-toggle mb-5 align-items-center d-flex justify-content-center" data-toggle="buttons">
    <label class="btn btn-primary active">
        <input type="radio" name="options" value="1" autocomplete="off" checked> Front Camera
    </label>
    <label class="btn btn-success">
        <input type="radio" name="options" value="2" autocomplete="off"> Back Camera
    </label>
</div>

</html>
