<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
        'created_at',
        'updated_at',
        'comment',
        'userId',
        'postId',
        'reported',
    ];
}
