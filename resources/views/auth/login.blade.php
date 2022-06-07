@extends('layouts.app')

@section('content')
<div class="theme-layout">
	<div class="container-fluid pdng0">
		<div class="row merged">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="error-handeler">
					@if (isset($errors))
						@foreach ($errors->all() as $error)
							<div class="alert alert-danger">{{$error}}</div>
						@endforeach
					@endif
				</div>
				<div class="land-featurearea">
					<div class="land-meta">
						<h1>Social</h1>
						<p>
							Social is safe to use and don’t spy on your information
						</p>
						<div class="friend-logo">
							<span><img src="images/wink.png" alt=""></span>
						</div>
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="login-reg-bg">
					<div class="log-reg-area sign">
						<h2 class="log-title">Login</h2>
						<form method="post" action="/login/user">
                            @csrf
							<div class="form-group">	
							  <input type="email" id="input" name="email" value="{{session("email")}}"/>
							  <label class="control-label" for="input">E-mail</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="password" name="password" />
							  <label class="control-label" for="input">Password</label><i class="mtrl-select"></i>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" name="remember-me" checked="checked"/><i class="check-box"></i>Always Remember Me.
							  </label>
							</div>
							<a href="#" title="" class="forgot-pwd">Forgot Password?</a>
							<div class="submit-btns">
                                <input type="submit" class="mtr-btn signin" value="login">
								<button class="mtr-btn" type="button"><span><a href="/register">Register</a></span></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="js/main.min.js"></script>
	<script src="js/script.js"></script>

@endsection
