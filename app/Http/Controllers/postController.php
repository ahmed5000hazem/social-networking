<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\React;
use App\Models\Post;
use App\Models\Image;
use App\Models\Video;
use App\Models\Follow;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

class postController extends Controller
{
    public function addNewPost(Request $request)
    {
        
        if ($request->post_text === "" && $request->post_image === null && $request->post_video === null){
            return redirect()->back()->with("postError", "please fill out any filed to post");
        }else {
            $validator = Validator::make($request->all(),[
                'post_text'     => ["max:5000"],
                "post_image"    => ["mimes:jpeg,jpg,gif,png", "max:10240"],
                "post_video"    => ["mimes:flv,mp4,m3u8,ts", "max:51200"],
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            } else {
                // creating new post record
                $post = new Post;
                $post->postText = $request->post_text;
                $post->user_id = Auth::id();
                $post->save();
                $new_post_id = $post->id;
                // save image attachment
                $new_post = Post::find($new_post_id);
                if ($request->post_image !== null) {
                    
                    $extention = $request->post_image->getClientOriginalExtension();
                    $random = rand(0,1000000000);
                    $filename = time()."-".$random.".".$extention;
                    
                    $request->post_image->move(public_path("uploads/images/post-images"), $filename);
                    
                    $image = new Image;
                    $image->userId = Auth::id();
                    $image->identifier = "post";
                    $image->postId = $new_post_id;
                    $image->image = $filename;
                    $image->save();
    
                    $new_post->withImage = 1;

                }
                // save video attachment
                if ($request->post_video !== null) {
                    $validator = Validator::make($request->all(),[
                        'post_video' => ["required", "mimes:mp4,flv,m3u8,avi,wmv,mov,3gp,ts", "max:51200"],
                        ]);
                    if ($validator->fails()){
                        return redirect()->back()->withErrors($validator)->withInput();
                    } else {
                        $new_post = Post::find($new_post_id);
                        $extention = $request->file("post_video")->getClientOriginalExtension();
                        $random = rand(0,1000000000);
                        $filename = time()."-".$random.".".$extention;
                        
                        $request->post_video->move(public_path("uploads/videos/post_video"), $filename);
                        
                        $image = new video;
                        $image->userId = Auth::id();
                        $image->identifier = "post";
                        $image->video = $filename;
                        $image->postId = $new_post_id;
                        $image->save();
                        
                        $new_post->withVideo = 1;
                    }
                }
                $new_post->save();
                return redirect()->back();
            }
        }
    }
    public function getMore($start = 15, $page_identifier="profile-me", $id = null, $user_id=null)
    {
        $profile_image_destination = "/uploads/images/profile-images/";
        $post_images_destination = "/uploads/images/post-images/";
        $post_videos_destination = "/uploads/videos/post_video/";

        // return [$start];

        if ($page_identifier === "profile-me") {
            $userId = $user_id;
            $posts = Post::where("user_id", "=", $userId)
                                                    ->leftJoin("images", "posts.id", "=", "images.postId")
                                                    ->leftJoin("videos", "posts.id", "=", "videos.postId")
                                                    ->join("users", "posts.user_id", "=", "users.id")
                                                    ->select("posts.*", "images.image", "videos.video", "users.username", "users.user_avatar")
                                                    ->orderBy("id", "DESC")
                                                    ->offset($start)->limit(15)->get();
            
            return [
                "error" => false,
                "message" => "success to load posts",
                "posts" => $posts,
                "profile_image_destination" => $profile_image_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ];

        } elseif ($page_identifier === "timeline") {
            $id = Auth::id();
            
            $start = (int)$start;
            $day = 24*60*60;
            $newStart = date("Y-m-d", ($start + $day * 7));
            $firstdate = date("Y-m-d", $start);

            $latestPost = Post::where(function ($query) use($firstdate, $newStart, $id) {
                $query->whereBetween("created_at", [$firstdate, $newStart])
                ->where("user_id" , "<>", $id);
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

            return [
                "error" => false,
                "message" => "success to load posts",
                "posts" => $posts,
                "profile_image_destination" => $profile_image_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ];
        }
    }
}
