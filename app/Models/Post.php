<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = [
        'title',
        'postText',
        'user_id',
        'group_id',
        'reported',
        'pageId',
    ];
}
