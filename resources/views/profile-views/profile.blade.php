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
								<div class="loadMore" data-scroll="start" data-page="profile-me" data-user="{{$data->id}}">
									@if ($data_post === "me")
										<div class="central-meta item">
											<div class="new-postbox">
												<figure>
													<img src="{{url($profile_image_destination)}}/{{$data->user_avatar}}" alt="">
												</figure>
												<div class="newpst-input">
													<form method="post" action="/post/add" enctype="multipart/form-data">
														@csrf
														<textarea rows="2" name="post_text" placeholder="write something"></textarea>
														<div class="attachments">
															<ul>
																<li>
																	<i class="fa fa-image"></i>
																	<label class="fileContainer">
																		<input type="file" name="post_image">
																	</label>
																</li>
																<li>
																	<i class="fa fa-video-camera"></i>
																	<label class="fileContainer">
																		<input type="file" name="post_video">
																	</label>
																</li>
																<li>
																	<button type="submit">Publish</button>
																</li>
															</ul>
														</div>
													</form>
												</div>
											</div>
										</div><!-- add post new box -->
									@endif
									
									@if (!$posts->isEmpty())
										@foreach ($posts as $post)
											<div class="central-meta item">
												<div class="user-post">
													<div class="friend-info">
														<figure>
															<img src="{{url($profile_image_destination)}}/{{$data->user_avatar}}" alt="">
														</figure>
														<div class="friend-name">
															<ins><a href="/" title="">{{$data->username}}</a></ins>
															<span data-create="">published: {{$post->created_at}}</span>
														</div>
														<div class="post-meta">
															<div class="description">
																<p>
																	{{$post->postText}}
																</p>
															</div>
															@if ($post->withImage)
																<img src="{{url($post_images_destination)}}/{{$post->image}}" alt="">
															@endif
															@if($post->withVideo)
																<video controls>
																	<source src="{{url($post_videos_destination)}}/{{$post->video}}">
																</video>
															@endif
															<div class="we-video-info">
																<ul>
																	<li>
																		<span class="comment" data-toggle="tooltip" title="Comments">
																			<i class="far fa-comment"></i>
																		</span>
																	</li>
																	<li>
																		<span class="like" data-post="{{$post->id}}" data-toggle="tooltip" title="like">
																			<i class="ti-heart @if($post->iReacted) ireacted @endif"></i>
																			<ins class="">{{$post->loves}}</ins>
																		</span>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="coment-area" data-open="closed">
													<div class="overlay"></div>
													<div class="close-comment-area"><i class="fa fa-close"></i></div>
													<ul class="we-comet">
														<ul>

														</ul>
														<li class="more-comments">
															<a href="#" title="" data-post="{{$post->id}}" class="showmore underline">more comments</a>
														</li>
														<li class="post-comment">
															<div class="comet-avatar">
																<img src="/{{$profile_image_destination}}/{{$data->user_avatar}}" alt="">
															</div>
															<div class="post-comt-box">
																<form method="get" class="post-comment-form" action="">
																	<input type="hidden" value="{{$post->id}}">
																	<textarea name="comment" required placeholder="Add your comment"></textarea>
																	<button type="submit">Post Comment</button>
																</form>
															</div>
														</li>
													</ul>
												</div>
											</div>
										@endforeach
									@else
										<div class="alert alert-info" role="alert">There is no posts to show</div>
									@endif

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

	{{-- @include('includes.footer') --}}
	
</div>
	@include('includes.side-panel')
	@include('includes.scripts')

</body>	

</html>