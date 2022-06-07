<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\React;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class reactsController extends Controller
{
    public function handelLikes($post_id)
    {
        $user_id = Auth::id();
        $postId = $post_id;

        // check if there is a like added by this user or not
        $react = React::where([
            ["postId" ,"=", $postId],
            ["userId" ,"=", $user_id],
        ])->exists();

        if ($react) {
            $post = Post::where("id", $postId)->get();
            $post = $post[0];

            $post->loves = $post->loves - 1;
            if ($post->user_id == $user_id) {
                $post->iReacted = 0;
            }else {
                $post->iReacted = 0;
            }
            $post->save();
            React::where([
                ["postId" ,"=", $postId],
                ["userId" ,"=", $user_id],
            ])->delete();
            $data = ["error" => false, "message" => "you disliked this post", "loves" => $post->loves, "ireacted" => 0];
            return json_encode($data);
        } else {
            $post = Post::where("id", $postId)->get();
            $post = $post[0];

            $post->loves = $post->loves + 1;
            if ($post->user_id == $user_id) {
                $post->iReacted = 1;
            } else {
                $post->iReacted = 0;
            }
            $post->save();
            
            $newReact = new React;
            $newReact->postId = $postId;
            $newReact->userId = $user_id;
            $newReact->save();
            $data = ["error" => false, "message" => "you liked this post", "loves" => $post->loves, "ireacted" => 1];
            return json_encode($data);
        }

    }
}