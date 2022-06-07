<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class React extends Model
{
    protected $fillable = [
        'loves',
        'postId',
        'userId',
    ];
}
