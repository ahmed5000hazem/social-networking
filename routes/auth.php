<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['middleware' => ['web' ,'XssSanitizer']], function(){
    Route::post('/insert/user', "RegisterController@InsertUser");
    Route::post('/login/user', "LoginController@LoginUser");
    Route::get('/logout', "LogoutController@Logout");
});