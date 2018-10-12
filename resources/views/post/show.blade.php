@extends('layouts.app')

@section('content')
      <div class="container">




      <li><a href="{{route('post.edit', $post->id)}}">{{$post->title}}</a></li>





</div>
      @endsection