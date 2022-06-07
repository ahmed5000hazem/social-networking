<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $fillable = [
        'userId',
        'postId',
        'video',
        'commentId',
        'groupId',
        'pageId',
        'identifier',
    ];
}
