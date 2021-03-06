<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    public $timestamps = true;

    protected $fillable = array(
        'id',
        'category_name',
        'image',
        'status',
        'created_at',
        'updated_at'
    );
}
