<div class="widget stick-widget">
    <h4 class="widget-title">
        Who's follownig
        @isset($whosFollowing)
        <span class="follower-counter">
            {{count($whosFollowing)}}
        </span>
        @endisset
    </h4>
    <ul class="followers">
        @isset($whosFollowing)
            @if ($whosFollowing->isEmpty())
                <div class="alert alert-warning" role="alert">No Followers Yet</div>
            @else
                @foreach ($whosFollowing as $whoFollowing)
                    <li>
                        <figure><img src="/{{$profile_image_destination}}/{{$whoFollowing->user_avatar}}" alt=""></figure>
                        <div class="friend-meta">
                            <h4><a href="/profile/{{$whoFollowing->id}}" title="">{{$whoFollowing->username}}</a></h4>
                        </div>
                    </li>
                @endforeach
            @endif
        @endisset
    </ul>
</div><!-- who's following -->