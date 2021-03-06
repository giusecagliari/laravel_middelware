<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
    public $directory = "/images/";
    //

    use SoftDeletes;

    protected $fillable = ['title', 'body', 'path'

    ];

    public function user(){

        return $this->belongsTo('App\User');
    }


    public function photos(){

        return $this->morphMany('App\Photo', 'imageable');

    }

    public static function scopeLatest($query){

        return $query->orderBy('id', 'desc')->get();
        
    }


    public function getPathAttribute($value){


            return $this->directory . $value;

    }
}
