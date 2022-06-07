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
										<div class="editing-interest">
											<h5 class="f-title"><i class="ti-heart"></i>My interests</h5>
											<form method="post" id="add-interest">
												@csrf
												<label>Add interests: </label>
												<input type="text" name="interest" placeholder="Photography, Cycling, traveling.">
												<button type="submit">Add</button>
												<ol class="interest-added">
													@if($interests != [])
														@foreach ($interests as $interest)
															@if($interest != "")
																<li data-interest="{{$interest}}"><a>{{$interest}}</a><span class="remove"><i class="fa fa-close"></i></span></li>
															@endif
														@endforeach
													@else
														<div class="alert alert-warning">you don't have any interests you can add some</div>
													@endif
												</ol>
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