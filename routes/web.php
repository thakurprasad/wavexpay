<?php

use App\Http\Controllers\LanguageController;
use App\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

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

// Page Route
Route::middleware(['auth'])->group(function () {
    Route::get('/', [PageController::class, 'blankPage']);

    Route::get('/page-blank', [PageController::class, 'blankPage']);
    Route::get('/page-collapse', [PageController::class, 'collapsePage']);
    Route::get('/merchant-profile', [PageController::class, 'merchantProfile']);

// locale route
    Route::get('lang/{locale}', [LanguageController::class, 'swap']);
});
Auth::routes(['verify' => true]);

//Auth::routes();
