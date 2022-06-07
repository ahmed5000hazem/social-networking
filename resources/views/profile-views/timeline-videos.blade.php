<!DOCTYPE html>
<html lang="en">
	@include('includes/head')
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
									<aside class="sidebar static">
									@if ($data_post === "me")
										@include('includes.website-components.shortcuts')
									@endif
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<ul class="photos profile-video">
									@if ($videos->isEmpty())
										<div class="alert alert-info">There is no videos to show</div>
									@else
										@foreach ($videos as $video)
											<li>
												<video controls>
													<source src="{{url($post_videos_destination)}}/{{$video->video}}">
												</video>
											</li>
										@endforeach
									@endif
									</ul>
									<div class="lodmore"><button class="btn-view btn-load-more load-more-media" data-get="click"></button></div>
								</div><!-- photos -->
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
	@include('includes.side-panel')
	@include('includes.scripts')
</body>
</html>