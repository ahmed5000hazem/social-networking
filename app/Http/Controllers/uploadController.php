<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

class uploadController extends Controller
{
    public function uploadProfileImage(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'image_user' => ["required", "mimes:jpeg,jpg,gif,png", "max:2048"],
        ]);
        if ($validator->fails()) {
            return redirect()->back();
        } else {

            $extention = $request->file("image_user")->getClientOriginalExtension();
            $random = rand(0,1000000000);
            $filename = time()."-".$random.".".$extention;

            $request->image_user->move(public_path("uploads/images/profile-images"), $filename);

            $image = new Image;
            $image->userId = Auth::id();
            $image->identifier = "profile";
            $image->image = $filename;
            $image->save();
            $user = User::find(Auth::id());
            $user->user_avatar = $filename;
            $user->save();
            return redirect()->back();
        }
    }

    public function uploadProfileCover(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'cover_photo' => ["mimes:jpeg,jpg,png,webm,ogg", "max:2048"],
        ]);
        if ($validator->fails()) {
            return redirect()->back();
        } else {

            $extention = $request->file("cover_photo")->getClientOriginalExtension();
            $random = rand(0,1000000000);
            $filename = time()."-".$random.".".$extention;

            $request->cover_photo->move(public_path("uploads/images/cover-images"), $filename);

            $image = new Image;
            $image->userId = Auth::id();
            $image->identifier = "cover";
            $image->image = $filename;
            $image->save();
            $user = User::find(Auth::id());
            $user->user_cover = $filename;
            $user->save();

            return redirect()->back();
        }
    }
}
