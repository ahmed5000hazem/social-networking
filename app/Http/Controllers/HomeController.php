<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Post;
use App\Models\Follow;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $id = Auth::id();
        
        $me = User::find($id);
        $profile_cover_destination = "uploads/images/cover-images";
        $profile_image_destination = "uploads/images/profile-images";
        $post_images_destination = "uploads/images/post-images";
        $post_videos_destination = "uploads/videos/post_video";
        
        $date = strtotime("-7 day");
        $date = date("Y-m-d", $date);

        $now = date("Y-m-d");

        // return $date . " " . $now;

        $latestPost = Post::where(function ($query) use($now, $date, $id) {
            $query->whereBetween("created_at", [$date, $now])
            ->where("user_id", "<>", $id);
        });

        $posts = Follow::where("follower_id", "=", $id)->joinSub($latestPost, 'latest_posts', function($join) use ($id){
            $user_id = $id;
            $join->on("follows.following_id", "=", "latest_posts.user_id")
                ->leftJoin("images", "images.postId" , "=", "latest_posts.id")
                ->leftJoin("videos", "videos.postId" , "=", "latest_posts.id")
                ->join("users", "users.id", "=", "latest_posts.user_id")
                ->leftJoin("reacts", function ($query) use($user_id) {
                    $query->on("reacts.postId" , "=", "latest_posts.id")
                        ->where("reacts.userId", "=", $user_id);
                });
        })
        ->select("latest_posts.*", "images.image", "videos.video", "users.user_avatar", "users.username", "reacts.id as react")
        ->get();

        // return $posts;
        
        $follow = Follow::where("following_id", "=", $id)
                                ->join("users as followers", "follower_id", "=", "followers.id")
                                ->select("followers.id", "followers.username", "followers.user_avatar")
                                ->get();
        
        
        return view("newsfeed", [
            "data" => $me,
            "data_post" => "timeline",
            "posts" => $posts,
            "whosFollowing" => $follow,
            "profile_image_destination" => $profile_image_destination,
            "profile_cover_destination" => $profile_cover_destination,
            "post_images_destination" => $post_images_destination,
            "post_videos_destination" => $post_videos_destination,
        ]);
        
    }
}
