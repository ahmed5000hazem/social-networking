<div class="widget">
    <h4 class="widget-title">Shortcuts</h4>
    <ul class="naves">
        <li>
            <i class="ti-clipboard"></i>
            <a href="/" title="">News feed</a>
        </li>
        {{-- <li>
            <i class="ti-files"></i>
            <a href="fav-page.html" title="">My pages</a>
        </li> --}}
        <li>
            <i class="ti-user"></i>
            <a href="/profile/{{Auth::id()}}/timeline-friends" title="">friends</a>
        </li>
        <li>
            <i class="ti-image"></i>
            <a href="/profile/{{Auth::id()}}/timeline-photos" title="">images</a>
        </li>
        <li>
            <i class="ti-video-camera"></i>
            <a href="/profile/{{Auth::id()}}/timeline-videos" title="">videos</a>
        </li>
        {{-- <li>
            <i class="ti-bell"></i>
            <a href="notifications.html" title="">Notifications</a>
        </li> --}}
        <li>
            <i class="ti-power-off"></i>
            <a href="/logout" title="">Logout</a>
        </li>
    </ul>
</div><!-- Shortcuts -->