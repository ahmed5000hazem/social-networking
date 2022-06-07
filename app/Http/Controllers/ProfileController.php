<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Post;
use App\Models\Image;
use App\Models\Video;
use App\Models\Follow;
use App\Models\Friendship;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;
use Symfony\Component\HttpFoundation\Response;


class ProfileController extends Controller
{
    public function showProfile(Request $request, $user_id)
    {
        
        if ($user_id == Auth::id()) {
            $id = Auth::id();
            $me = User::find($id);

            $posts = Post::where("user_id", "=", $id)
                                                    ->leftJoin("images", "posts.id", "=", "images.postId")
                                                    ->leftJoin("videos", "posts.id", "=", "videos.postId")
                                                    ->select("posts.*", "images.image", "videos.video")
                                                    ->orderBy("id", "DESC")->limit(15)->get();

            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";

            return view("profile-views.profile", [
                                                    "data" => $me,
                                                    "posts" => $posts,
                                                    "data_post" => "me",
                                                    "profile_image_destination" => $profile_image_destination,
                                                    "profile_cover_destination" => $profile_cover_destination,
                                                    "post_images_destination" => $post_images_destination,
                                                    "post_videos_destination" => $post_videos_destination,
                                                ]);
        } else {
            $id = $user_id;
            $myId = Auth::id();
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $id],
            ])->orWhere(function ($q) use ($id, $myId) {
                $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $id);
            })
            ->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
            $status="";
            if ($friendship->isEmpty()) {
                $status = "addfriend";
            } elseif ($friendship[0]->status) {
                $status = "unfriend";
                
            } else {
                $status = "pending";
            }
            // return $friendship;
            $follow = Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $user_id]
            ])->get();
            $followed = ($follow->isEmpty()) ? false : true;

            $is_int = filter_var($id, FILTER_VALIDATE_INT) ? 1:0;
            if ($is_int){
                $me = User::where("id", Auth::id())->select("users.user_avatar")->get();
                $user = User::find($id);
                if ($user !== null) {
                $posts = Post::where("user_id", "=", $id)
                                                        ->leftJoin("images", "posts.id", "=", "images.postId")
                                                        ->leftJoin("videos", "posts.id", "=", "videos.postId")
                                                        ->select("posts.*", "images.image", "videos.video")
                                                        ->orderBy("id", "DESC")->limit(15)->get();

                $profile_image_destination = "uploads/images/profile-images";
                $profile_cover_destination = "uploads/images/cover-images";
                $post_images_destination = "uploads/images/post-images";
                $post_videos_destination = "uploads/videos/post_video";

                return view("profile-views.profile", [
                                                        "data" => $user,
                                                        "me" => $me,
                                                        "posts" => $posts,
                                                        "data_post" => "other",
                                                        "friendship" => ["status" => $status],
                                                        "followed" => $followed,
                                                        "profile_image_destination" => $profile_image_destination,
                                                        "profile_cover_destination" => $profile_cover_destination,
                                                        "post_images_destination" => $post_images_destination,
                                                        "post_videos_destination" => $post_videos_destination,
                                                    ]);
                } else {
                    return redirect("/");
                }
            } else {
                return redirect("/");
            }
        }
    }
    public function showProfilePhotos(Request $request, $user_id)
    {
        if ($user_id == Auth::id()) {
            $id = Auth::id();
            $me = User::find($id);
            $photos = Image::where("userId", "=", $user_id)->select("images.image", "id", "identifier")->limit(10)->get();
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            return view("profile-views.timeline-photos", [
                "data" => $me,
                "data_post" => "me",
                "photos" => $photos,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
            ]);
        }else {
            $id = $user_id;
            $me = User::where("id", Auth::id())->select("users.user_avatar")->get();
            $user = User::find($id);
            $myId = Auth::id();
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $id],
            ])->orWhere(function ($q) use ($id, $myId) {
                $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $id);
            })->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
            $status="";
            if ($friendship->isEmpty()) {
                $status = "addfriend";
            } elseif ($friendship[0]->status) {
                $status = "unfriend";
                
            } else {
                $status = "pending";
            }
            $follow = Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $user_id]
            ])->get();
            $followed = ($follow->isEmpty()) ? false : true;
            $photos = Image::where("userId", "=", $user_id)->select("images.image", "id", "identifier")->get();
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            return view("profile-views.timeline-photos", [
                "me" => $me,
                "data" => $user,
                "data_post" => "other",
                "friendship" => ["status" => $status],
                "photos" => $photos,
                "followed" => $followed,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
            ]);
        }
    }
    public function showProfileVideos($user_id)
    {
        if ($user_id == Auth::id()) {
            $id = Auth::id();
            $me = User::find($id);
            $videos = Video::where("userId", "=", $user_id)->select("videos.video")->limit(10)->get();
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";

            return view("profile-views.timeline-videos", [
                "data" => $me,
                "data_post" => "me",
                "videos" => $videos,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ]);
        }else {
            $id = $user_id;
            $me = User::where("id", Auth::id())->select("users.user_avatar")->get();
            $user = User::find($id);
            $myId = Auth::id();
            $videos = Video::where("userId", "=", $user_id)->select("videos.video", "id", "identifier")->get();
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $id],
            ])->orWhere(function ($q) use ($id, $myId) {
                $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $id);
            })->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
            $status="";
            if ($friendship->isEmpty()) {
                $status = "addfriend";
            } elseif ($friendship[0]->status) {
                $status = "unfriend";
                
            } else {
                $status = "pending";
            }
            $follow = Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $user_id]
            ])->get();
            $followed = ($follow->isEmpty()) ? false : true;
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            return view("profile-views.timeline-videos", [
                "me" => $me,
                "data" => $user,
                "data_post" => "other",
                "videos" => $videos,
                "followed" => $followed,
                "friendship" => ["status" => $status],
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ]);
        }
    }
    public function showFrindes($user_id)
    {
        if (Auth::id() == $user_id) {
            $id = Auth::id();
            $user = User::find($id);

            $myFriends1 = Friendship::where([
                ["userOneId", "=", $id],
                ["status", "=", "1"],
            ])
            ->join("users", "users.id" , "=", "friendships.userTwoId")
            ->select("friendships.id", "users.id as user_id", "users.username", "users.user_avatar")
            ->get();

            $myFriends2 = Friendship::where([
                ["userTwoId", "=", $id],
                ["status", "=", "1"],
            ])
            ->join("users", "users.id" , "=", "friendships.userOneId")
            ->select("friendships.id", "users.id as user_id", "users.username", "users.user_avatar")
            ->get();
            
            $friends = $myFriends1->merge($myFriends2);

            $requested = null;
            $requested = Friendship::where([
                    ["userTwoId", "=", $id],
                    ["status", "=", "0"],
                ])->join("users",  "friendships.userOneId" , "=","users.id")
                ->select("friendships.id", "users.id as user_id", "users.username", "users.user_avatar")
                ->get();
                // return $requested;
            $profile_image_destination = "uploads/images/profile-images";
            $profile_cover_destination = "uploads/images/cover-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";

            return view("profile-views.timeline-friends", [
                                                                "data" => $user,
                                                                "me" => [$user],
                                                                "data_post" => "me",
                                                                "myFriends" => $friends,
                                                                "requested" => ["friendRequest" => $requested],
                                                                "profile_image_destination" => $profile_image_destination,
                                                                "profile_cover_destination" => $profile_cover_destination,
                                                                "post_images_destination" => $post_images_destination,
                                                                "post_videos_destination" => $post_videos_destination,
                                                            ]);
        } else {

            $id = $user_id;
            $myId = Auth::id();
            $user = User::find($id);
            $me = User::find(Auth::id());
            $follow = Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $user_id],
            ])->get();
            $followed = ($follow->isEmpty()) ? false : true;
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $id],
            ])->orWhere(function ($q) use ($id, $myId) {
                $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $id);
            })->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
            $status="";
            if ($friendship->isEmpty()) {
                $status = "addfriend";
            } elseif ($friendship[0]->status) {
                $status = "unfriend";
                
            } else {
                $status = "pending";
            }

            $myFriends1 = Friendship::where([
                ["userOneId", "=", $id],
                ["status", "=", "1"],
            ])
            ->join("users", "users.id" , "=", "friendships.userTwoId")
            ->select("friendships.id", "users.id as user_id", "users.username", "users.user_avatar")
            ->get();

            $myFriends2 = Friendship::where([
                ["userTwoId", "=", $id],
                ["status", "=", "1"],
            ])
            ->join("users", "users.id" , "=", "friendships.userOneId")
            ->select("friendships.id", "users.id as user_id", "users.username", "users.user_avatar")
            ->get();
            
            $friends = $myFriends1->merge($myFriends2);

            $requested = null;
                
            $profile_image_destination = "uploads/images/profile-images";
            $profile_cover_destination = "uploads/images/cover-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";

            return view("profile-views.timeline-friends", [
                                                                "data" => $user,
                                                                "me" => [$me],
                                                                "data_post" => "other",
                                                                "myFriends" => $friends,
                                                                "followed" => $followed,
                                                                "requested" => ["friendRequest" => $requested],
                                                                "friendship" => ["status" => $status],
                                                                "profile_image_destination" => $profile_image_destination,
                                                                "profile_cover_destination" => $profile_cover_destination,
                                                                "post_images_destination" => $post_images_destination,
                                                                "post_videos_destination" => $post_videos_destination,
                                                            ]);
        }
    }
    public function followUser(Request $request)
    {
        $follow = Follow::firstOrCreate([
                "follower_id" => Auth::id(),
                "following_id" => $request->input("id"),
            ]);
        if ($follow->wasRecentlyCreated){
            return ["error" => false, "message" => "you have just followed this user"];
        }
    }
    public function unFollowUser(Request $request)
    {

        $follow = Follow::where([
            ["follower_id", "=", Auth::id()],
            ["following_id", "=", $request->input("id")],
        ])->get();

        if (!$follow->isEmpty()) {
            Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $request->input("id")],
            ])->delete();
        }
        return ["error" => false, "message" => "you have just unfollowed this user"];
    }
    public function showProfileAbout($user_id)
    {
        if ($user_id == Auth::id()) {
            
            $id = Auth::id();
            $me = User::find($id);
            
            $profile_cover = Image::where([
                ["userId", "=" ,$id],
                ["identifier", "=" ,"cover"],
            ])->orderBy("id", "desc")->limit(1)->get();


            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";

            $interests = json_decode($me->interests);

            return view("profile-views.about", [
                                                    "data" => $me,
                                                    "data_post" => "me",
                                                    "interests" => $interests,
                                                    "profile_image_destination" => $profile_image_destination,
                                                    "profile_cover_destination" => $profile_cover_destination,
                                                    "post_images_destination" => $post_images_destination,
                                                    "post_videos_destination" => $post_videos_destination,
                                                ]);
        } else {
            $id = $user_id;
            $is_int = filter_var($id, FILTER_VALIDATE_INT) ? 1:0;
            $me = User::where("id", Auth::id())->select("users.user_avatar")->get();
            $user = User::find($id);
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $id],
            ])->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
            $status="";
            if ($friendship->isEmpty()) {
                $status = "addfriend";
            } elseif ($friendship[0]->status) {
                $status = "unfriend";
                
            } else {
                $status = "pending";
            }
            $follow = Follow::where([
                ["follower_id", "=", Auth::id()],
                ["following_id", "=", $user_id]
            ])->get();
            $followed = ($follow->isEmpty()) ? false : true;
            $interests = json_decode($user->interests);
            $profile_image_destination = "uploads/images/profile-images";
            $profile_cover_destination = "uploads/images/cover-images";
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            if ($interests === null) {
                $interests = [];
            }
            return view("profile-views.about", [
                                                    "data" => $user,
                                                    "me" => $me,
                                                    "interests" => $interests,
                                                    "followed" => $followed,
                                                    "data_post" => "other",
                                                    "friendship" => ["status" => $status],
                                                    "profile_image_destination" => $profile_image_destination,
                                                    "profile_cover_destination" => $profile_cover_destination,
                                                    "post_images_destination" => $post_images_destination,
                                                    "post_videos_destination" => $post_videos_destination,
                                                ]);
        }
    }
    public function showMoreProfileVideos($user_id, $start)
    {
        
        $videos = Video::where("userId", "=", $user_id)->select("videos.video")->offset($start)->limit(10)->get();
        $data = [
            "error" => false,
            "message" => "videos loaded successfuly",
            "videos" => $videos,
            
        ];
        return json_encode($data);
    }
    public function showMoreProfilePhotos($user_id, $start)
    {
        $photos = Image::where("userId", "=", $user_id)->select("images.image", "images.identifier")->offset($start)->limit(10)->get();
        
        $profile_cover_destination = "uploads/images/cover-images";
        $profile_image_destination = "uploads/images/profile-images";
        $post_images_destination = "uploads/images/post-images";

        $data = [
            "error" => false,
            "message" => "videos loaded successfuly",
            "photos" => $photos,
            "profile_image_destination" => $profile_image_destination,
            "profile_cover_destination" => $profile_cover_destination,
            "post_images_destination" => $post_images_destination,
        ];
        return json_encode($data);
    }
    public function sendFriendRequest(Request $request)
    {
        $user_id = $request->input("id");
        $friendship = Friendship::where([
            ["userOneId" , "=", Auth::id()],
            ["userTwoId" , "=", $user_id],
        ])->select("friendships.userOneId", "friendships.userTwoId", "friendships.status")->get();
        
        if ($friendship->isEmpty()) {
            $setFriendsShip = new Friendship;
            $setFriendsShip->userOneId = Auth::id();
            $setFriendsShip->userTwoId = $user_id;
            $setFriendsShip->save();
            return [ "error" => false, "message" => "requested", "status" => "pending",];
        } elseif ($friendship[0]->status) {
            return [ "error" => false, "message" => "already requested", "status" => "unfriend",];
        } else {
            return [ "error" => true, "message" => "already requested", "status" => "pending",];
        }
    }
    public function deleteFriendRequest(Request $request)
    {
        $myId = Auth::id();
        $user_id = $request->input("id");

        $friendship = Friendship::where([
            ["userOneId" , "=", Auth::id()],
            ["userTwoId" , "=", $user_id],
        ])->orWhere(function ($q) use ($user_id, $myId) {
            $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $user_id);
        })->exists();
        if ($friendship) {
            $friendship = Friendship::where([
                ["userOneId" , "=", Auth::id()],
                ["userTwoId" , "=", $user_id],
            ])->orWhere(function ($q) use ($user_id, $myId) {
                $q->where("userTwoId" , "=", $myId)->where("userOneId" , "=", $user_id);
            })->delete();
        }

        Follow::where([
            ["follower_id", "=", $myId],
            ["following_id", "=", $user_id],
        ])->delete();
        Follow::where([
            ["follower_id", "=", $user_id],
            ["following_id", "=", $myId],
        ])->delete();

        return [ "error" => false, "message" => "request deleted", "status" => "addfriend",];
    }
    public function deleteSpeceficFriendRequest(Request $request)
    {
        $myId = Auth::id();
        $id = $request->input("id");
        $friendship = Friendship::find($id);
        $follower_id = $friendship->userOneId;
        $following_id = $friendship->userTwoId;

        Friendship::where("id", "=", $id)->delete();
        
        Follow::where([
            ["follower_id", "=", $follower_id],
            ["following_id", "=", $following_id],
        ])->delete();
        Follow::where([
            ["follower_id", "=", $following_id],
            ["following_id", "=", $follower_id],
        ])->delete();
        
        return ["error" => false, "message" => "friendship deleted", "status" => "addfriend"];
    }
    public function confirmSpeceficFriendRequest(Request $request)
    {
        $myId = Auth::id();
        $friendshipId = $request->input("id");

        $friendship = Friendship::find($friendshipId);
        $friendship->status = 1;
        $friendship->save();
        
        $follow = new Follow;
        $follow->follower_id = $friendship->userOneId;
        $follow->following_id = $myId;
        $follow->save();

        return ["error" => false, "message" => "Friendship Accepted"];

    }
    /* ==============================      update & edit      ==============*/
    // edit profile basic info
    public function editProfileInfo()
    {
        if (Auth::check()) {
            $id = Auth::id();
            $me = User::find($id);
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            return view("profile-views.account.edit-profile-basic", [
                
                "info" => $me,
                "data_post" => "me",
                "data" => $me,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,

            ]);
            
        } else {
            return redirect("/login");
        }
    }
    // update profile basic info
    public function updateProfileInfo(Request $request)
    {
        if (Auth::check()) {
            
            $validator = Validator::make($request->all(), [
                "firstname"     => ["required", "string", "max:20"],
                "lastname"      => ["required", "string", "max:20"],
                "phone"         => ["nullable", "max:11"],
                "city"          => ["nullable", "max: 50"],
                "email"         => ["required", "email", Rule::unique('users')->ignore(Auth::id()), "max:200"],
                "bio"           => ["nullable"],
                "country"       => ["nullable"],
            ]);
            
            if ($validator->fails()) {
                foreach ($request->all() as $key => $value) {
                    if ($key == "_token") continue;
                    $request->session()->flash($key, $value);
                }
                return redirect()->back()->withErrors($validator)->withInput();
            } else {
                $user = User::find(Auth::id());
                $user->firstname = $request->input("firstname");
                $user->lastname = $request->input("lastname");
                $user->email = $request->input("email");
                $user->phone = $request->input("phone");
                $user->bio = $request->input("bio");
                $user->city = $request->input("city");
                $user->password = Hash::make($request->input("password"));
                $user->save();

                return redirect()->back();
            }

        } else {
            return redirect("/login");
        }
    }
    // ====================>>>>>>>>>>>>>>> edit user password
    public function editPassword(Request $request)
    {
        if (Auth::check()) {
            $user = User::find(Auth::id());
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            return view("profile-views.account.edit-password", [
                "data_post" => "me",
                "data" => $user,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ]);
        } else{
            return redirect("/login");
        }
    }
// ====================>>>>>>>>>>>>>>> edit update password
    public function updatePassword(Request $request)
    {
        
        if (Auth::check()) {

            $user = User::find(Auth::id());
            if(Hash::check($request->current_password, $user->password)){
                $validator = Validator::make($request->all(), [
                    "password"                  => ["confirmed", "min:6", "max:200"],
                    "password_confirmation"     => ["required", "min:6", "max:200"],
                ]);
                if ($validator->fails()) {
                    foreach ($request->all() as $key => $value) {
                        if ($key == "_token") {continue;}
                        $request->session()->flash($key, $value);
                    }
                    return redirect()->back()->withErrors($validator)->withInput();
                } else {
                    $user->password = Hash::make($request->password);
                    $user->save();
                    return redirect()->back()->with("status", "Success to change password");
                }
            } else {
                return redirect()->back()->with("check_result", "current password is wrong !!");
            }
        } else{
            return redirect("/login");
        }
    }
// ====================>>>>>>>>>>>>>>> edit update Interests
    public function editInterests()
    {
        if (Auth::check()) {
            $user = User::find(Auth::id());
            $interests = $user->interests;
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            return view("profile-views.account.edit-interest", [
                "interests" => json_decode($interests),
                "data_post" => "me",
                "data" => $user,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
            ]);
        } else{
            return redirect("/login");
        }
    }

    public function updateInterests(Request $request)
    {
        if (Auth::check()) {

            $user = User::find(Auth::id());
            $userInterests = $request->interest;
            $interests = json_decode($user->interests);
            if (!in_array($userInterests, $interests)) {
                $interests[] = $userInterests;
            }
            $user->interests = json_encode($interests);
            $user->save();
            return $interests;
            
        } else{
            
        }
    }

    public function removeInterests(Request $request, $interest)
    {
        if (Auth::check()) {
            $user = User::find(Auth::id());
            $interests = json_decode($user->interests);
            $index = array_search($interest, $interests);
            $interests[$index] = "";
            $user->interests = $interests;
            $user->save();
            return $interests;
        }
    }
// ====================>>>>>>>>>>>>>>> edit update WorkEductations
    public function editWorkEductations()
    {
        if (Auth::check()) {
            $user = User::find(Auth::id());
            
            $profile_cover_destination = "uploads/images/cover-images";
            $profile_image_destination = "uploads/images/profile-images";
            
            $post_images_destination = "uploads/images/post-images";
            $post_videos_destination = "uploads/videos/post_video";
            

            return view("profile-views.account.edit-work-eductation", [
                "edu_info" => $user,
                "data_post" => "me",
                "data" => $user,
                "profile_image_destination" => $profile_image_destination,
                "profile_cover_destination" => $profile_cover_destination,
                "post_images_destination" => $post_images_destination,
                "post_videos_destination" => $post_videos_destination,
                ]);
        } else{
            return redirect("/login");
        }
        
    }
    public function updateWorkEductations(Request $request)
    {
        if (Auth::check()) {
            
            $validator = Validator::make($request->all(), [
                "studying_at"      => ["required", "string", "max:255"],
                "start_year"       => ["required", "string", "max:255"],
                "finish_year"      => ["required", "string", "max:255"],
                "studying_city"    => ["required", "string", "max:255"],
            ]);
            
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            } else {
                $graduate = ($request->graduate == "on")? 1 : 0;
                $user = User::find(Auth::id());
                $user->graduate = $graduate;
                $user->studying_at = $request->input("studying_at");
                $user->start_year = $request->input("start_year");
                $user->finish_year = $request->input("finish_year");
                $user->studying_city = $request->input("studying_city");
                $user->save();

                return redirect()->back();
            }

        } else {
            return redirect("/login");
        }
    }
}