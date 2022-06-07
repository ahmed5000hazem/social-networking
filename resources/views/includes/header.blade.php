<div class="topbar stick">
		<div class="logo">
			<a title="" href="/"><img src="{{url("/images/logo.png")}}" alt=""></a>
		</div>
		
		<div class="top-area">
			<ul class="main-menu">
				<li>
					<a href="/" title="">Home</a>
				</li>
				<li>
					<a href="#" title="">Timeline</a>
					<ul>
						<li><a href="/profile" title="">Timeline</a></li>
						<li><a href="/" title="">Newsfeed</a></li>
						{{-- <li><a href="/groups" title="">timeline groups</a></li> --}}
						{{-- <li><a href="/pages" title="">timeline pages</a></li> --}}
						{{-- <li><a href="/videos" title="">timeline videos</a></li> --}}
						{{-- <li><a href="/fav" title="">favourit page</a></li>
						<li><a href="/liked" title="">Likes page</a></li> --}}
					</ul>
				</li>
				<li>
					<a href="#" title="">account settings</a>
					<ul>
						{{-- <li><a href="/edit/account" title="">edit account setting</a></li> --}}
						<li><a href="/profile-edit/{{Auth::id()}}/profile-info" title="">edit profile info</a></li>
						<li><a href="/profile-edit/{{Auth::id()}}/work-eductation" title="">edit work educations</a></li>
						<li><a href="/profile-edit/{{Auth::id()}}/password" title="">edit-password</a></li>
						<li><a href="/profile-edit/{{Auth::id()}}/interest" title="">edit interest</a></li>
					</ul>
				</li>
			</ul>
			<ul class="setting-area">
				<li>
					<a href="#" title="Home" data-ripple=""><i class="ti-search"></i></a>
					<div class="searched">
						<form method="post" class="form-search">
							<input type="text" placeholder="Search Friend">
							<button data-ripple><i class="ti-search"></i></button>
						</form>
					</div>
				</li>
				<li>
					<a href="#" title="Notification" data-ripple="">
						<i class="ti-bell"></i><span>20</span>
					</a>
					{{-- <div class="dropdowns">
						<span>4 New Notifications</span>
						<ul class="drops-menu">
							<li>
								<a href="notifications.html" title="">
									<img src="/images/resources/thumb-1.jpg" alt="">
									<div class="mesg-meta">
										<h6>sarah Loren</h6>
										<span>Hi, how r u dear ...?</span>
										<i>2 min ago</i>
									</div>
								</a>
								<span class="tag green">New</span>
							</li>
							<li>
								<a href="notifications.html" title="">
									<img src="/images/resources/thumb-2.jpg" alt="">
									<div class="mesg-meta">
										<h6>Jhon doe</h6>
										<span>Hi, how r u dear ...?</span>
										<i>2 min ago</i>
									</div>
								</a>
								<span class="tag red">Reply</span>
							</li>
							<li>
								<a href="notifications.html" title="">
									<img src="/images/resources/thumb-3.jpg" alt="">
									<div class="mesg-meta">
										<h6>Andrew</h6>
										<span>Hi, how r u dear ...?</span>
										<i>2 min ago</i>
									</div>
								</a>
								<span class="tag blue">Unseen</span>
							</li>
							<li>
								<a href="notifications.html" title="">
									<img src="/images/resources/thumb-4.jpg" alt="">
									<div class="mesg-meta">
										<h6>Tom cruse</h6>
										<span>Hi, how r u dear ...?</span>
										<i>2 min ago</i>
									</div>
								</a>
								<span class="tag">New</span>
							</li>
							<li>
								<a href="notifications.html" title="">
									<img src="/images/resources/thumb-5.jpg" alt="">
									<div class="mesg-meta">
										<h6>Amy</h6>
										<span>Hi, how r u dear ...?</span>
										<i>2 min ago</i>
									</div>
								</a>
								<span class="tag">New</span>
							</li>
						</ul>
						<a href="notifications.html" title="" class="more-mesg">view more</a>
					</div> --}}
				</li>
			</ul>
			<div class="user-img">
			
				<img src="{{url("uploads/images/profile-images")}}/@if($data_post == "other"){{$me[0]->user_avatar}}@else{{$data->user_avatar}}@endif" alt="">
				<span class="status f-online"></span>
				<div class="user-setting">
					{{-- <a href="/status/online" title=""><span class="status f-online"></span>Online</a>
					<a href="/status/away" title=""><span class="status f-away"></span>Away</a>
					<a href="/status/offline" title=""><span class="status f-off"></span>Offline</a> --}}
					<a href="/profile/{{Auth::id()}}" title=""><i class="ti-user"></i> view profile</a>
					{{-- <a href="/edit/account" title=""><i class="ti-settings"></i>account setting</a> --}}
					<a href="/logout" title=""><i class="ti-power-off"></i>log out</a>
				</div>
			</div>
			<span class="ti-menu main-menu" data-ripple=""></span>
		</div>
	</div><!-- topbar -->