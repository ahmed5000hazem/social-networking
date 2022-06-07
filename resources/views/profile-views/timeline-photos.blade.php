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
									<ul class="photos">
										@if ($photos->isEmpty())
											<div class="alert alert-info" role="alert">There is no photos to show</div>
										@else
											@foreach ($photos as $image)
												<li>
													@if ($image->identifier === "profile")
														<a class="strip" href="/{{$profile_image_destination}}/{{$image->image}}" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
														<img src="/{{$profile_image_destination}}/{{$image->image}}" alt=""></a>													
													@elseif($image->identifier === "cover")
														<a class="strip" href="/{{$profile_cover_destination}}/{{$image->image}}" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
														<img src="/{{$profile_cover_destination}}/{{$image->image}}" alt=""></a>													
													@else
														<a class="strip" href="/{{$post_images_destination}}/{{$image->image}}" title="" data-strip-group="mygroup" data-strip-group-options="loop: false">
														<img src="/{{$post_images_destination}}/{{$image->image}}" alt=""></a>													
													@endif
												</li>
											@endforeach
										@endif
									</ul>
									@if (!$photos->isEmpty())
										<div class="lodmore"><button class="btn-view btn-load-more load-more-media" data-get="click"></button></div>
									@endif
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