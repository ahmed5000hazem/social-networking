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
									@if ($data_post === "me")
										@include('includes.website-components.shortcuts')
									@endif
								</aside>
							</div><!-- sidebar -->
							<div class="col-lg-6">
								<div class="central-meta">
									<div class="frnds">
										<ul class="nav nav-tabs">
											<li class="nav-item"><a class="active" href="#frends" data-toggle="tab">Friends</a> <span>{{count($myFriends)}}</span></li>
											@if ($data_post === "me")
												<li class="nav-item"><a class="" href="#frends-req" data-toggle="tab">Friend Requests</a><span>{{count($requested["friendRequest"])}}</span></li>
											@endif
										</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<div class="tab-pane active fade show " id="frends" >
											<ul class="nearby-contct">
												@if(!$myFriends->isEmpty())
													@foreach ($myFriends as $myFriend)
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="/profile/{{$myFriend->user_id}}" title=""><img src="/{{$profile_image_destination}}/{{$myFriend->user_avatar}}" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4><a href="/profile/{{$myFriend->user_id}}" title="">{{$myFriend->username}}</a></h4>
																	@if ($data_post === "me")
																		<form action="profile/deletefriendrequest" method="post">
																			@csrf
																			<a href="#" title="" data-friend="{{$myFriend->id}}" class="add-butn delete-frnd more-action" data-ripple="">unfriend</a>
																		</form>
																	@endif
																</div>
															</div>
														</li>
													@endforeach
												@else
													<div class="alert alert-info">there is no friends to show</div>
												@endif
											</ul>

										</div>
										<div class="tab-pane fade" id="frends-req" >
											<ul class="nearby-contct">
												@if(isset($requested["friendRequest"]) && !$requested["friendRequest"]->isEmpty() && $data_post === "me")
													@foreach ($requested["friendRequest"] as $req)
														<li>
															<div class="nearly-pepls">
																<figure>
																	<a href="time-line.html" title=""><img src="/{{$profile_image_destination}}/{{$req->user_avatar}}" alt=""></a>
																</figure>
																<div class="pepl-info">
																	<h4><a href="/profile/{{$req->user_id}}" title="">{{$req->username}}</a></h4>
																	<form class="friend-request-controle">
																		@csrf
																		<a href="#" title="" data-frnd="{{$req->id}}" class="add-butn delete-frnd-req more-action" data-ripple="">Delete Request</a>
																		<a href="#" title="" data-frnd="{{$req->id}}" class="add-butn confirm-frnd-req" data-ripple="">Confirm</a>
																	</form>
																</div>
															</div>
														</li>
													@endforeach
												@elseif(isset($requested["friendRequest"]) && !$requested["friendRequest"]->isEmpty() && $data_post === "other")

												@else
													<div class="alert alert-info">No friend Requests yet</div>
												@endif
											</ul>
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
	@include('includes.side-panel')
	@include('includes.scripts')
</body>
</html>