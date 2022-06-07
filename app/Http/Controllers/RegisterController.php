<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;

class RegisterController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
    }
    
    public function InsertUser(Request $request) {
        $validator = Validator::make($request->all(), [
            "firstname"                 => ["required", "string", "max:20"],
            "lastname"                  => ["required", "string", "max:20"],
            "phone"                     => ["nullable", "max:11"],
            "password"                  => ["confirmed", "min:6", "max:200"],
            "password_confirmation"     => ["required", "min:6", "max:200"],
            "email"                     => ["required", "email", "unique:users,email", "max:200"],
            "terms"                     => ["required"],
        ]);
        if ($validator->fails()) {
            foreach ($request->all() as $key => $value) {
                if ($key == "_token") {continue;}
                $request->session()->flash($key, $value);
            }
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $email = $request->input("email");
            $email_array = explode("@", $email);
            $username = $email_array[0];
            $user = new User;
            $user->firstname = $request->input("firstname");
            $user->lastname = $request->input("lastname");
            $user->email = $email;
            $user->username = $username;
            $user->phone = $request->input("phone");
            $user->gender = $request->input("gender");
            $user->password = Hash::make($request->input("password"));
            $user->save();
            return redirect("/login");
        }
    }
}
