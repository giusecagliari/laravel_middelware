@extends('layouts.app')

@section('content')
    <div class="container">
    <h1>Create record</h1>
       {{--<form method="post" action="/post">--}}
    <div class="form-group">
    {!! Form::open(['method'=>'POST','action'=>'PostController@store', 'files'=>true])  !!}

    </div>
    <div class="form-group">
           {!! Form::label('title','Tilte')  !!}
           {!! Form::text('title','',['class'=>'form-conttrol'])  !!}
           {!! Form::label('body','Contenuto')  !!}
           {!! Form::text('body','',['class'=>'form-conttrol'])  !!}
            {{csrf_field()}}

    </div><br>
    <div class="form-group">
        {!! Form::file('file',['class'=>'form-conttrol'])  !!}
    </div><br>
    <div class="form-group">
            {!! Form::submit('Create Post', ['class'=>'btb-btn-primary']) !!}
            {{--<input type="submit" name="submit">--}}
    </div>

        @if(count($errors) > 0){

        <div class="alert alert-danger">

            <ul>
                @foreach($errors->all() as $error){

                    <li>
                        {{$error}}
                    </li>
               }
                @endforeach
            </ul>

        </div>

        }
        @endif
    </div>
    @endsection

