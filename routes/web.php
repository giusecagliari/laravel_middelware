<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


use App\Http\Requests;

use App\Post;
use App\User;
use App\Country;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth; //support date time



Route::get('/', function () {


//    return view('welcome');

//    if (Auth::check()){
//        return "User is logged in";
//
//    }
   

        $username = 'uahhusa';
        $password = '328ewujdksx';
    if (Auth::attempt(['name'=>$username, 'password'=> $password ])){

        return redirect()->intended();
    }

    Auth::logout();
});

//Route::get('/post/{id}', 'PostController@index');
Route::group(['middleware'=>'web'], function (){ // sicurezza 


Route::resource('/post', 'PostController');

Route::get('/contact', 'PostController@contact');

});

Route::get('/getname', function (){

    $user = User::find(2);

    echo     $user->name;
});

// mutators https://laravel.com/docs/5.2/eloquent-mutators
Route::get('/setname', function (){

   $user = User::findOrFail(2);

    $user->name = "demo creato";
    $user->save();
});
//Route::get('/post/{id}/{name}', function ($id,$name) {
//    return "questo è il post numero ".$id. " creato da ".$name;
//});
//
//Route::get('admin/post/example', array('as'=>'admin.home' ,function () {
//
//    $url = route('admin.home');
//    return "this is the url " . $url;
//}));
//
//
//
//
//// DATABASE RAW SQL QUERIES
//use Illuminate\Support\Facades\DB;
//
//Route::get('/insert', function (){
//
//   DB::INSERT('insert into post(title, body)VALUES (?,?)',['PHP with laravel awesome','laravel is the best framework for php']);
//});
//
//Route::get('/read', function(){
//
//    $results = DB::SELECT('select * from post where id= ?',[3]);
//
//    foreach ($results as $post){
//
//        //return var_dump($results);
//
//        return $post->title ;
//    }
//});
//
//Route::get('/update', function (){
//
//   $updated = DB::update('update post set title="PHP with laravel updated" where id= ?', [1]);
//
//    return $updated;
//    //echo $post->title;
//});
//
//
//Route::get('/delete', function (){
//
//    $delete = DB::delete('delete from post where id = ?', [1]);
//
//    return $delete;
//});
//
//
////ELOQUENT queries by model
//
////ricordarsi di includere le classi a inizio pagina
//// use app\Post;
//
//Route::get('/findwhere', function (){
//
//    //Post è il modello
//
//    $posts = Post::where('id', 2)->orderBy('id','desc')->take(2)->get();
//
//    return $posts ;
//
//});
//
//Route::get('/findmore', function (){
//
//  #  $posts = Post::findOrFail(3);
//
//    $posts = Post::where('users_count', '<', 50)->firstOrFail();
//
//    return $posts;
//});
//
//// eloquent insert
//
//
//Route::get('/basicinsert', function (){
//
//
//    //$post = Post::find(2); modificare il post id numero 2
//    $post = New Post;
//    $post->title = "this is a new post create with eloquent";
//    $post->body = "wow eloquent is really cool";
//
//    $post->save(); //per salvare la query
//});
///*
//Route::get('/create', function (){
//
//    Post::create(['title'=>'the create method', 'body'=>'wow i am learning alot']);
//
//
//)};
//*/
//Route::get('/update', function (){
//
//   Post::where('id',2)->where('is_admin', 0)->update(['title'=>'New title php laravel', 'body'=>'I love my instructor']);
//
//});
//
//
//Route::get('/delete', function (){
//
//   $post = Post::find(2); // trova il post id 2
//
//    $post->delete(); //elimina il post numero 2
//
//});
//
//// oppure
//
//Route::get('/delete2', function(){
//
//   Post::destroy([2,3]); //elimina il post numero 2 e 3
//
//});
//
//
////softdeletes() creazione tabella deleted_ad tramite migrazione aggiunto sul modulo use softdeletes
//
//Route::get('/softdeletes', function (){
//
//    Post::find(2)->delete();
//
//});
//
//Route::get('/readsoftdelete', function(){
//
//   $post = Post::find(3); // restituisce il post num 3
//    return $post;
//
//});
//Route::get('/readsoftdelete2', function(){
//
//    $post = Post::withTrashed()->where('is_admin',0 )->get();
//    return $post;
//});
//
//Route::get('/restore', function(){
//
//    $post = Post::withTrashed()->where('is_admin',0 )->restore(); //ripristina il post eliminato
//    return $post;
//});
//
//Route::get('/forcedelete', function(){
//
//    Post::OnlyTrashed()->where('is_admin',0 )->forcedelete(); //ripristina il post eliminato
//
//});
//
//
////-------------------------------------
////   Eloquent relationship
////-------------------------------------
//
//
//// one to one relationship
//Route::get('/user/post/{id}', function ($id){
//
//   return User::find($id)->post->body;
//
//});
//
//// belong to relationship or inverse of one to one
//Route::get('/postcreatodauser/{id}', function ($id){
//
//   return Post::find($id)->user->name;
//});
//
//// show user that Has many posts
//
//Route::get('/posts', function (){
//
//   $user = User::find(1);
//
//    foreach ($user->posts as $post){
//
//        echo $post->title . "<br>";
//    }
//
//});
//
//// many to many
//
//Route::get('/user/{id}/role', function ($id){
//
//   $user = User::find($id);
//
//    foreach ($user->roles as $role){
//
//        echo $role->name;
//    }
//});
//
//Route::get('user/pivot',function (){
//
//    $user = User::find(1);
//
//    foreach ($user->roles as $role)
//
//        return $role->pivot->created_at;
//
//});
//
//Route::get('/user/country', function (){
//
//   $country = Country::find(1);
//
//    foreach ($country->posts as $post){
//
//        return $post->title;
//
//
//    }
//
//});
//
//// Polimorphic relations
//
//
//Route::get('user/photos', function (){
//
//   $user = User::find(1);
//
//    foreach ($user->photos as $photo){
//
//        return $photo;
//    }
//
//});
//
//// reverse get photo depend of post id
//
//
//Route::get('photo/{id}/user', function ($id){
//
//   $photo = \App\Photo::findOrFail($id);
//
//    return $photo->imageable;
//
//});
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/admin', 'AdminController@index');
//Route::get('/admin', 'AdminController@index')->middleware('IsAdmin');                //Works fine

//Route::get('/admin', ['middleware' => \App\Http\Middleware\IsAdmin::class, function () {
//    //
//}]);


Route::get('admin/user/roles', ['middleware'=>'role', function(){

return "middleware role";


}]);
