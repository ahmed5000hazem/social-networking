<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Friendship extends Model
{
    protected $table = "friendships";
    protected $fillable = [
        'userOneId',
        'userTwoId',
    ];
}
