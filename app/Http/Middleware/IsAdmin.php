<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

//        if(Auth::check()){
//
//
//            if(Auth::user()->IsAdmin()){
//
//                return $next ($request);
//
//
//            }
//
//
//        }
//
//
//        return redirect('/');

//        if(Auth::user()->isAdmin()) {
//            redirect()->intended('/admin');
//        } else {
//            return redirect()->intended('/');
//        }
        if(Auth::check()) {
            if(Auth::user()->isAdmin()) {
                redirect()->intended('/admin');
            } else {
                return redirect()->intended('/');
            }
        }


    }
}
