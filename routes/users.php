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



// Route::get('/profile', "ProfileController@showMyProfile");
Route::group([
    'prefix' => "profile",
    "middleware" => ["auth", "web", "XssSanitizer", "filerVar"],
], function () {
    Route::get('/{id}', "ProfileController@showProfile");
    Route::get('/{id}/timeline-photos', "ProfileController@showProfilePhotos");
    Route::get('/{id}/timeline-videos', "ProfileController@showProfileVideos");
    Route::get('/{id}/about', "ProfileController@showProfileAbout");
    Route::get('/getmore/timeline-videos/user/{id}/start/{start}', "ProfileController@showMoreProfileVideos");
    Route::get('/getmore/timeline-photos/user/{id}/start/{start}', "ProfileController@showMoreProfilePhotos");
    Route::get('/{id}/timeline-friends', "ProfileController@showFrindes");
});
Route::group([
    'prefix' => "profile",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::post('/sendFriendRequest', "ProfileController@sendFriendRequest");
    Route::post('/deleteFriendRequest', "ProfileController@deleteFriendRequest");
    Route::post('/deleteSpeceficFriendRequest', "ProfileController@deleteSpeceficFriendRequest");
    Route::post('/confirmSpeceficFriendRequest', "ProfileController@confirmSpeceficFriendRequest");
    Route::post('/follow', "ProfileController@followUser");
    Route::post('/unfollow', "ProfileController@unFollowUser");
});

Route::group([
    'prefix' => "profile-edit",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::get('/profile-info', "ProfileController@editProfileInfo");
    Route::post('/profile-info', "ProfileController@updateProfileInfo");

    Route::get('/password', "ProfileController@editPassword");
    Route::post('/password', "ProfileController@updatePassword");

    Route::get('/interest', "ProfileController@editInterests");
    Route::post('/interest', "ProfileController@updateInterests");

    Route::get('/interest/remove/{interest}', "ProfileController@removeInterests");

    Route::get('/work-eductation', "ProfileController@editWorkEductations");
    Route::post('/work-eductation', "ProfileController@updateWorkEductations");
});

Route::group([
    'prefix' => "upload",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::post('/user-image', "uploadController@uploadProfileImage");
    
    Route::post('/user-cover', "uploadController@uploadProfileCover");
});

Route::group([
    'prefix' => "post",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::post('/add', "postController@addNewPost");
    Route::post('/user-cover', "postController@uploadProfileCover");

    Route::get('/getmore/{start?}/{page_identifier?}/{id?}/user/{user_id?}', "postController@getMore");
});

Route::group([
    'prefix' => "comment",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::get('/add/{post?}/{comment?}', "commentController@AddNewComment");
    Route::get('/get/{post?}', "commentController@getComments");
    Route::get('/getMore/{post?}/{start?}', "commentController@getMoreComments");
});

Route::group([
    'prefix' => "reacts",
    "middleware" => ["auth", "web", "XssSanitizer"],
], function () {
    Route::get('/{post}', "reactsController@handelLikes");
});