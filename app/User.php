<?php

namespace App;

use App\Http\Middleware\IsAdmin;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * @return has one post
     */
    public function post()
    {
        return $this->hasOne('App\Post');

    }

    /**
     * @return has many posts
     */
    public function posts()
    {
        return $this->hasMany('App\Post');
    }


    /**
     * @return array
     */
    public function roles()
    {
//        return $this->belongsToMany('App\Role')->withPivot('created_at');
        return $this->belongsToMany('App\Role');
    }

    
    public function photos(){

        return $this->morphMany('App\Photo', 'imageable');

    }


    /**
     * @return user name upper case
     */
    public function getNameAttribute($value)
    {
        return strtoupper($value);
    }


    /**
     * @param array $attributes upper case
     */
    public function setNameAttributes($value)
    {
        $this->attributes['name'] = strtoupper($value);
    }


    public function isAdmin(){
        
        if($this->role->name == "administrator"){

            return true;
        }

        return false;
    }

}

