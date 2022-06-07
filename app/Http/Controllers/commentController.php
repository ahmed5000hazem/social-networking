<?php

namespace App\Http\Controllers;


use App\Models\Comment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class commentController extends Controller
{
    public function AddNewComment(Request $request, $postId = null, $comment = null)
    {
        $profile_image_destination = "uploads/images/profile-images/";
        if ($comment !== null && strlen($comment) > 0 && strlen($comment) < 5000) {
            $user = User::find(Auth::id());
            Comment::create([
                "userId" => Auth::id(),
                "postId" => $postId,
                "comment" => $comment,
            ]);
            $responseArray = ["error" => false, "message" => "success to add comment", "comment" => '<li>
            <div class="comet-avatar">
                <img src="' .$profile_image_destination. $user->user_avatar . '" alt="">
            </div>
            <div class="we-comment">
                <div class="coment-head">
                    <h5><a href="/profile/" title="">' . $user->username . '</a></h5>
                    <span>Now</span>
                </div>
                <p>' . $comment . '</p>
            </div>
        </li>'];
            return json_encode($responseArray);
        } else {
            $responseArray = ["error" => true, "message" => "comment filed can not be empty and must'nt be over than 5000 charachter"];
            return json_encode($responseArray);
        }
    }
    public function getComments($post = null)
    {
        if ($post === null) {
            return ["error" => true, "message" => "failed to load comments"];
        } else {
            $comments = Comment::where("postId" , "=", $post)
                                                            ->join("users", "userId" , "=", "users.id")
                                                            ->select("users.id", "users.username", "users.user_avatar", "comments.*")
                                                            ->limit(10)
                                                            ->get();
            $comments_array = [];
            foreach ($comments as $comment) {
                $comments_array[] = '<li>
                                        <div class="comet-avatar">
                                            <img src="/uploads/images/profile-images/' . $comment->user_avatar . '" alt="">
                                        </div>
                                        <div class="we-comment">
                                            <div class="coment-head">
                                                <h5><a href="#" title="">' . $comment->username . '</a></h5>
                                                <span>' . $comment->created_at . '</span>
                                            </div>
                                            <p>' . $comment->comment . '</p>
                                        </div>
                                    </li>';
            }
            return ["error" => false, "message" => "success to load comments", "comments" => $comments_array];
        }
    }
    public function getMoreComments($postId = null, $start = null)
    {
        if ($postId !== null && $start !== null) {
            $comments = Comment::where("postId" , "=", $postId)
                                                            ->join("users", "userId" , "=", "users.id")
                                                            ->select("users.id", "users.username", "users.user_avatar", "comments.*")
                                                            ->offset($start)
                                                            ->limit(10)
                                                            ->get();
            $comments_array = [];
            foreach ($comments as $comment) {
                $comments_array[] = '<li>
                                        <div class="comet-avatar">
                                            <img src="/uploads/images/profile-images/' . $comment->user_avatar . '" alt="">
                                        </div>
                                        <div class="we-comment">
                                            <div class="coment-head">
                                                <h5><a href="#" title="">' . $comment->username . '</a></h5>
                                                <span>' . $comment->created_at . '</span>
                                            </div>
                                            <p>' . $comment->comment . '</p>
                                        </div>
                                    </li>';
            }
            return ["error" => false, "message" => "success to load comments", "comments" => $comments_array];
        }else{
            $responseArray = ["error" => true, "message" => "Something went worng"];
            return json_encode($responseArray);
        }
    }
}
