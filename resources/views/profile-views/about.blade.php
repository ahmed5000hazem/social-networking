<!DOCTYPE html>
<html lang="en">

@include('includes/head')
<body>
<!--<div class="se-pre-con"></div>-->
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
									<aside class="sidebar static">
									@if ($data_post === "me")
										@include('includes.website-components.shortcuts')
									@endif
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">

								<div class="central-meta">
									<div class="about">
										<div class="personal">
											<h5 class="f-title"><i class="ti-info-alt"></i> Personal Info</h5>
											<p>{{$data->bio}}</p>
										</div>





										<div class="d-flex flex-row mt-2">
											<ul class="nav nav-tabs nav-tabs--vertical nav-tabs--left" >
												<li class="nav-item">
													<a href="#basic" class="nav-link active" data-toggle="tab" >Basic info</a>
												</li>
												<li class="nav-item">
													<a href="#work" class="nav-link" data-toggle="tab" >work and education</a>
												</li>
												<li class="nav-item">
													<a href="#interest" class="nav-link" data-toggle="tab"  >interests</a>
												</li>
											</ul>
											<div class="tab-content">
												<div class="tab-pane fade show active" id="basic" >
													<ul class="basics">
														<li><i class="ti-user"></i>{{$data->firstname}} {{$data->lastname}}</li>
														<li><i class="ti-map-alt"></i>
															@if($data->city === null&&$data->country ===null)
																No places to show
															@else
																{{$data->city}}, {{$data->country}}
															@endif
															</li>
														<li><i class="ti-mobile"></i>{{$data->phone}}</li>
													</ul>
												</div>



												<div class="tab-pane fade" id="location" role="tabpanel">
													<div class="location-map">
														<div id="map-canvas"></div>
													</div>
												</div>

												
												<div class="tab-pane fade" id="work" role="tabpanel">
													<div>
														<a href="#" title="">
															@if ($data->workPlace != null)
																{{$data->workPlace}}
															@else
																No work places to show
															@endif
														</a>
														<ul class="education">
															@if($data->studying_at !== null)
																<li>Studied at {{$data->studying_at}} from {{$data->start_year}}</li>
															@else
																No education to show
															@endif
														</ul>
													</div>
												</div>


												<div class="tab-pane fade" id="interest" role="tabpanel">
													<ul class="basics">
														@if ($interests !== [])
															@foreach ($interests as $interest)
																@if ($interest != null)
																	<li>{{$interest}}</li>
																@endif
															@endforeach
														@else
															No interests to show
														@endif
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div><!-- centerl meta -->
							<div class="col-lg-3">
								<aside class="sidebar static">
								@if ($data_post === "me")
									@include('includes.website-components.recent-activites')
									<div class="widget stick-widget message-handeler display-none"></div>
									@if(session()->has('postError'))
										<div class="alert alert-danger">
											{{ session()->get('postError') }}
										</div>
									@endif
								@endif
								</aside>
							</div><!-- sidebar -->
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</section>
</div>
	
	@include('includes.scripts')
</body>	
</html>