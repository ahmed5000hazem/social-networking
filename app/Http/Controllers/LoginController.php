<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\MessageBag;



class LoginController extends Controller
{

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function LoginUser (Request $request)
    {
        $credentials = $request->only("email", "password");
        $remember = false;
        
        if ($request->input("remember-me") != null) {
            $remember = true;
        }
        $validator = Validator::make($credentials, [
            "email" => ["required", "email", "max:200"],
            "password" => ["required", "max:200"],
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }else{
            if (Auth::attempt($credentials, $remember)){
                return redirect('/');
            }
        }
    }
}
