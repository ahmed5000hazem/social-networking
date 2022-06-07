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
						<a href="#" title="" class="folow-me">Follow Us on</a>
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="login-reg-bg">
					<div class="log-reg-area reg">
						<h2 class="log-title">Register</h2>
							
						<form method="post" action="/insert/user">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
							<div class="form-group">	
							  <input type="text" name="firstname" value="{{session("firstname")}}"/>
							  <label class="control-label" for="input">First Name</label><i class="mtrl-select"></i>
							</div>
                            <div class="form-group">	
							  <input type="text" name="lastname" value="{{session("lastname")}}"/>
							  <label class="control-label" for="input">Last Name</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="text" name="phone" value="{{session("phone")}}"/>
							  <label class="control-label" for="input">Phone</label><i class="mtrl-select"></i>
							</div>
							<div class="form-group">	
							  <input type="password" name="password"/>
							  <label class="control-label" for="input">Password</label><i class="mtrl-select"></i>
							</div>
                            <div class="form-group">	
							  <input type="password" name="password_confirmation"/>
							  <label class="control-label" for="input">Confirm password</label><i class="mtrl-select"></i>
							</div>
							<div class="form-radio">
							  <div class="radio">
								<label>
								  <input type="radio" value="male" name="gender" checked="checked"/><i class="check-box"></i>Male
								</label>
							  </div>
							  <div class="radio">
								<label>
								  <input type="radio" value="femail" name="gender"/><i class="check-box"></i>Female
								</label>
							  </div>
							</div>
							<div class="form-group">
							  <input type="text" name="email" value="{{session("email")}}"/>
							  <label class="control-label" for="input"><a href="https://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6c29010d05002c">[email&#160;protected]</a></label><i class="mtrl-select"></i>
							</div>
							<div class="checkbox">
							  <label>
								<input type="checkbox" name="terms"/><i class="check-box"></i>Accept Terms & Conditions ?
							  </label>
							</div>
							<a href="/login" title="" class="already-have">Already have an account</a>
							<div class="submit-btns">
								<input type="submit" class="mtr-btn signin" value="Register">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
