<!DOCTYPE html>
<html lang="en">

@include('includes.head')
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	
	@include('includes.responsive-header')
	
	@include('includes.header')
	
	@include('includes.website-components.profile-components.feature-photo')

	<section>
		<div class="gap gray-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="row" id="page-contents">
							<div class="col-lg-3">
								<aside class="sidebar static">
									@include('includes.website-components.recent-activites')
									@include('includes.website-components.profile-components.edit-info')
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="editing-info">
										<h5 class="f-title"><i class="ti-info-alt"></i> Edit Basic Information</h5>

										<form method="post" action="{{url("profile-edit/passprofile-infoword")}}">
											@csrf
											<div class="form-group half">	
											  <input type="text" id="input" name="firstname" required="required" value="{{$info->firstname}}" />
											  <label class="control-label" for="input">First Name</label><i class="mtrl-select"></i>
											</div>
											<div class="form-group half">	
											  <input type="text" required="required" name="lastname" value="{{$info->lastname}}"/>
											  <label class="control-label" for="input">Last Name</label><i class="mtrl-select"></i>
											</div>
											<div class="form-group">	
											  <input type="text" required="required" name="email" value="{{$info->email}}"/>
											  <label class="control-label" for="input"><a href="https://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="4b0e262a22270b">[email&#160;protected]</a></label><i class="mtrl-select"></i>
											</div>
											<div class="form-group">	
											  <input type="text" required="required" name="phone" value="{{$info->phone}}"/>
											  <label class="control-label" for="input">Phone No.</label><i class="mtrl-select"></i>
											</div>
											
											<div class="form-group">	
											  <input type="text" name="city" value="{{$info->city}}"/>
											  <label class="control-label" for="input">City</label><i class="mtrl-select"></i>
											</div>
											<div class="form-group">	
											  <textarea rows="4" name="bio" id="textarea">{{$info->bio}}</textarea>
											  <label class="control-label" for="textarea">About Me</label><i class="mtrl-select"></i>
											</div>
											<div class="submit-btns">
												<button type="submit" class="mtr-btn"><span>Update</span></button>
											</div>
										</form>
									</div>
								</div>	
							</div><!-- centerl meta -->
							<div class="col-lg-3">
								<aside class="sidebar static">
									@if (isset($errors))
										@foreach ($errors->all() as $error)
											<div class="alert alert-danger">{{$error}}</div>
										@endforeach
									@endif
								</aside>
							</div><!-- sidebar -->
						</div>
					</div>
				</div>
			</div>
		</div>	
	</section>

	@include('includes.footer')

</div>
	
	@include('includes.side-panel')
	@include('includes.scripts')

</body>	

</html>