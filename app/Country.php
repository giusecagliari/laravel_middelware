<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    //

    /**
     * @return hsd many post of the country
     */
    public function posts()
    {
        return $this->hasManyThrough('App\Post', 'App\User');
    }
}
