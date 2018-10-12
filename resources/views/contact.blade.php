<?php
/**
 * Created by PhpStorm.
 * User: Giuseppe
 * Date: 15/09/2018
 * Time: 11:44
 */
   ?>
@extends('layouts.app')

@section('content')
    <div class="container">



<div class="flex-center position-ref full-height">
    @if (Route::has('login'))
        <div class="top-right links">
            @auth
            <a href="{{ url('/home') }}">Home</a>
            @else
                <a href="{{ route('login') }}">Login</a>
                <a href="{{ route('register') }}">Register</a>
                @endauth
        </div>
    @endif

    <div class="content">
        <div class="title m-b-md">
            Laravel contact page
        </div>

        <div class="form-group">
                    {!! Form::submit('Submit', ['class'=>'btb-btn-primary']) !!}
                    {{--<input type="submit" name="submit">--}}
         </div>


    </div>
</div>
    </div>

@endsection