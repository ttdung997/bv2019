<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Crequest extends Model
{
    use SoftDeletes;

    protected $guarded = ['id'];

    protected $casts = [
        'request_of_user' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(\App\User::class);
    }
}
