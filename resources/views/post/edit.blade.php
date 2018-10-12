

@section('content')

    <h1>Edit</h1>
    {{--<form method="post" action="/post/{{$post->id}}" >--}}
        {!! Form::model($post,['method'=>'PATCH','action'=>['PostController@update', $post->id]])  !!}


        {{--<input type="hidden" name="_method" value="PUT">--}}

        {{--<input type="text" name="title" placeholder="title" value="{{$post->title}}" required>--}}
        {{--<input type="text" name="body" placeholder="body" value="{{$post->body}}" required>--}}

        <div class="form-group">
            {!! Form::label('title','Title')  !!}
            {!! Form::text('title',$post->title,['class'=>'form-control'])  !!}
            {!! Form::label('body','Contenuto')  !!}
            {!! Form::text('body',$post->body,['class'=>'form-control'])  !!}
        {{csrf_field()}}


        {{--<input type="submit" name="submit" value="UPDATE">--}}

    {!! Form::submit('Update post', ['class'=>'btn btn-info']) !!}
    {!! Form::close() !!}}


        </div>

<div class="form-group">

    {{--<form method="post" action="/post/{{$post->id}}">--}}
    {!! Form::open(['method'=>'DELETE','action'=>['PostController@destroy', $post->id]])  !!}

            {{--<input name="_method" type="hidden" value="DELETE">--}}

            {{--<input type="submit" value="DELETE">--}}

    {!! Form::submit('delete Post', ['class'=>'btb-btn-primary']) !!}

    {{--</form>--}}
    {!! Form::close() !!}

</div>


