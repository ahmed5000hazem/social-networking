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
											<h5 class="f-title"><i class="ti-lock"></i>Change Password</h5>
											
											<form method="post" action="{{url("profile-edit/password")}}">
												@csrf
												<div class="form-group">	
												  <input type="password" id="input" name="password" required="required"/>
												  <label class="control-label" for="input">New password</label><i class="mtrl-select"></i>
												</div>
												<div class="form-group">	
												  <input type="password" name="password_confirmation" required="required"/>
												  <label class="control-label" for="input">Confirm password</label><i class="mtrl-select"></i>
												</div>
												<div class="form-group">	
												  <input type="password" name="current_password" required="required"/>
												  <label class="control-label" for="input">Current password</label><i class="mtrl-select"></i>
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
										@if (session("check_result") != null)
											<div class="alert alert-warning">{{session("check_result")}}</div>
										@endif
										@if (session("status") != null)
											<div class="alert alert-success">{{session("status")}}</div>
										@endif
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