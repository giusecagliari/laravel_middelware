<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        return view('home', compact('user'));

//        session(['edwin2'=>'your teacher']); creare sessioni
//        return session('edwin2');

        $request->session()->forget('edwin2'); // cancellare sessioni

        return $request->session()->all();
        
    }
}
