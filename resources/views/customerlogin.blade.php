<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="{{ asset ('images/icons/favicon.ico') }}"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('vendor/bootstrap/css/bootstrap.min.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('fonts/font-awesome-4.7.0/css/font-awesome.min.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('fonts/iconic/css/material-design-iconic-font.min.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('vendor/animate/animate.css') }}">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="{{ asset ('vendor/css-hamburgers/hamburgers.min.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('}vendor/animsition/css/animsition.min.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('vendor/select2/select2.min.css') }}">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="{{ asset ('vendor/daterangepicker/daterangepicker.css') }}">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="{{ asset ('css/util.css') }}">
	<link rel="stylesheet" type="text/css" href="{{ asset ('css/main.css') }}">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form method="POST" class="login100-form validate-form" action="{{ route('customer.login') }}">
					<span class="login100-form-logo">
					<i class="zmdi zmdi-landscape"></i>
					</span>
					@csrf
					<span class="login100-form-title p-b-34 p-t-27">
						Login In
			</span>
                 <div class="wrap-input100 validate-input" data-validate="Enter email">
							<div class="wrap-input100">
                          <input id="email" type="email" class="input100" name="email" placeholder="Email">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
                                @error('email')
                              <span class="invalid-feedback" role="alert">
                                  <strong>{{ $message }}</strong>
                             </span>
                                @enderror
					</div>
                </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter email">
							<div class="wrap-input100">
                                <input id="password" type="password" class="input100" name="password" placeholder="Password">
								<span class="focus-input100" data-placeholder="&#xf191;"></span>
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
							</div>
                        </div>
                                
						<div class="contact100-form-checkbox">
							<div class="contact100-form-checkbox">
                                    <input class="input-checkbox100" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="label-checkbox100" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
							</div>
                        </div>
                         

                        <div class="container-login100-form-btn">
							<div class="container100-login100-form-btn">
                                <button type="submit" class="login100-form-btn">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
								<div class="text-center p-t-90">
                                    <a class="txt1" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
								</div>
                                @endif
							</div>
                        </div>
                    </form>
			</div>
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/jquery/jquery-3.2.1.min.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/animsition/js/animsition.min.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/bootstrap/js/popper.js') }}"></script>
	<script src="{{ asset ('vendor/bootstrap/js/bootstrap.min.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/select2/select2.min.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/daterangepicker/moment.min.js') }}"></script>
	<script src="{{ asset ('vendor/daterangepicker/daterangepicker.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('vendor/countdowntime/countdowntime.js') }}"></script>
<!--===============================================================================================-->
	<script src="{{ asset ('js/main.js') }}"></script>

</body>
</html>