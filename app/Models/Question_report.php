<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Passport\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Question_report extends Authenticatable
{

    use SoftDeletes;

    protected $fillable = [
        'username',
        'emailid',
        'mobile',
        'country',
        'purpose',
        'question'
    ];
}
