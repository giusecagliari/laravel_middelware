<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreatePostRequest;
use Illuminate\Http\Request;
use App\Http\Requests;

use App\Post;
class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     *
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //
      //  return "this is a call from controller " . $id;

       #$post = Post::all(); //show all post
        $post = Post::latest()->get(); // this remand to post model where create a query scope https://laravel.com/docs/5.2/eloquent#query-scopes


        return view('post.index', compact('post'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        // return "this is the method that use to create";
        return view('post.create');

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePostRequest $request)
    {


        $input = $request->all();

        if ($file = $request->file('file')){

            $name = $file->getClientOriginalName();
            $file->move('images', $name);

            $input['path'] =$name;

        }

            Post::create($input);

//        $file = $request->file('file');
//
//        echo "<br>";
//
//        echo $file->getClientOriginalName();
//
//        echo "<br>";
//
//        echo $file->getSize();




       // return $request->all();
      //  return $request->title;
     //   Post::create($request->all());

//        $this->validate($request, [
//            'title'=>'required',
//            'body'=> 'required'
//
//        ]);
      //  return redirect('/post');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
       // return "this is the method for show " . $id ;
        $post = Post::findOrFail($id);

        return view('post.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $post = Post::findOrFail($id);

        return view('post.edit', compact('post'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $post = Post::findOrFail($id);
        $post->update($request->all());
        return redirect('/post');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $post = Post::findOrFail($id);
         $post->delete();

        return redirect('/post');
    }

    public function contact(){

        //
        return view('contact');
    }



}
