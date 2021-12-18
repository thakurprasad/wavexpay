<?php

#use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\OrderController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

/*
Route::middleware('api')->group( function () {

   Route::get('v1/order', [OrderController::class, 'store']);
   Route::post('v1/order', [OrderController::class, 'store']);
   /*Route::get('v1/order', 
             function () {
                return "test...";
            }
    ); * /

}); */


//Route::get('v1/order', [OrderController::class, 'store']);
Route::post('v1/order', [OrderController::class, 'create']);