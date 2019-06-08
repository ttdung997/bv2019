<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Certificate extends Model
{
    use SoftDeletes;

    protected $guarded = ['id'];

    protected $casts = [
        'pkcs12' => 'array',
    ];

    public function user()
    {
        return $this->belongsTo(\App\User::class);
    }
}
