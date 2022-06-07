<section>
    <div class="feature-photo">
        <figure><img class="img-responsive" src="{{url($profile_cover_destination)}}/{{$data->user_cover}}" alt=""></figure>
        <div class="add-btn">
            @if ($data_post === "other")
                <form action="profile/sendFriendRequest/{{$data->id}}" method="post">
                    @csrf
                    <button type="submit" class="add-friend" data-friendship="{{$friendship['status']}}" data-user="{{$data->id}}">@if($friendship['status'] === "addfriend") Add Friend @else {{$friendship['status']}} @endif </button>
                </form>
                @if($friendship['status'] === "unfriend")
                    <div class="follow-options">
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                @csrf
                                <li><a href="#" class="follow @if($followed)active @endif" data-follow="{{$data->id}}">Follow</a></li>
                                <li><a href="#" class="unfollow @if(!$followed)active @endif" data-unfollow="{{$data->id}}">Unfollow</a></li>
                            </ul>
                        </div>
                    </div>
                @endif
            @endif
            <div class="clearfix"></div>
            <span>1205 followers</span>
        </div>
        @if ($data_post === "me")
            <form class="edit-phto" method="post" enctype="multipart/form-data" action="/upload/user-cover">
                @csrf
                <i class="fa fa-camera-retro"></i>
                <label class="fileContainer">
                    Edit Cover Photo
                    <input class="user-cover" name="cover_photo" type="file"/>
                    <button type="submit" class="user-save-image"> Save </button>
                </label>
            </form>
        @endif
        <div class="container-fluid">
            <div class="row merged">
                <div class="col-lg-2 col-sm-3">
                    <div class="user-avatar">
                        <figure>
                            <img src="{{url($profile_image_destination)}}/{{$data->user_avatar}}" alt="">
                            @if ($data_post === "me")
                                <form class="edit-phto" method="post" enctype="multipart/form-data" action="/upload/user-image">
                                    @csrf
                                    <i class="fa fa-camera-retro"></i>
                                    <label class="fileContainer">
                                        Edit Display Photo
                                        <input class="user-image" name="image_user" type="file"/>
                                        <button type="submit" class="user-save-image"> Save </button>
                                    </label>
                                </form>
                            @endif
                        </figure>
                    </div>
                </div>
                <div class="col-lg-10 col-sm-9">
                    <div class="timeline-info">
                        <ul>
                            <li class="admin-name">
                              <h5> {{$data->username}} </h5>
                            </li>
                            @include('includes/website-components/profile-components/profile-links')
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!-- top area -->