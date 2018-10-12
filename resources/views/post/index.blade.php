@extends('layouts.app')

@section('content')
    <div class="container">

<ul>

    @foreach($post as $poster)

        <div class="images-container">

            <img height="100" width="100" src="{{$poster->path}}" alt="">
            
        </div>

        <li><a href="{{route('post.show', $poster->id)}}">{{$poster->title}}</a></li>

    @endforeach


</ul>
    </div>
    @endsection







