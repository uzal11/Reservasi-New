<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Form-v5 by Colorlib</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" href="{{ asset('css/roboto-font.css') }}">
	<link rel="stylesheet" href="{{ asset('fonts/font-awesome-5/css/fontawesome-all.min.css') }}">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="{{ asset('css/customreg/style.css') }}"/>
</head>
<body class="form-v5">
	<div class="page-content">
		<div class="form-v5-content">
			<form class="form-detail" method="POST" action="{{ route('register') }}">
                @csrf
				<h2>Register Account Form</h2>
				<div class="form-row">
					<label for="full-name">Full Name</label>
					<input id="name" type="text" class="form-control @error('name')
                     is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus placeholder="Your Name" required>

                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

					<i class="fas fa-user"></i>
				</div>
                <div class="form-row">
					<label for="full-name">Phone Number</label>
					<input id="phone" type="text" class="form-control @error('phone') is-invalid 
                    @enderror" name="phone" value="{{ old('phone') }}" required autocomplete="phone"
                    autofocus placeholder="Your Phone" required>

                    @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

					<i class="fas fa-user"></i>
				</div>
				<div class="form-row">
					<label for="your-email">Your Email</label>
					<input id="email" type="email" class="form-control 
                    @error('email') is-invalid @enderror" name="email" 
                    value="{{ old('email') }}" required autocomplete="email" 
                    placeholder="Your Email" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">

                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

					<i class="fas fa-envelope"></i>
				</div>
				<div class="form-row">
					<label for="password">Password</label>
					<input id="password" type="password" class="form-control 
                    @error('password') is-invalid @enderror" name="password" 
                    required autocomplete="new-password" placeholder="Your Password">

                    @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                    
					<i class="fas fa-lock"></i>
				</div>
                <div class="form-row">
					<label for="password">Confirm Password</label>
					<input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
					<i class="fas fa-lock"></i>
				</div>
				<div class="form-row-last">
					<button type="submit" class="btn btn-primary register">
                                    {{ __('Register') }}
                                </button>
				</div>
			</form>
		</div>
	</div>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>