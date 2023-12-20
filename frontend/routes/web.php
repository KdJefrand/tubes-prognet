<?php

use App\Http\Controllers\AgamaController;
use App\Http\Controllers\AnggotaKKController;
use App\Http\Controllers\HubunganKKController;
use App\Http\Controllers\KartuKeluargaController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PendudukController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('/Penduduk', PendudukController::class); //->middleware('auth:sanctum');
Route::resource('/KK', KartuKeluargaController::class)->middleware('auth:sanctum');
Route::resource('/HubunganKK', HubunganKKController::class)->middleware('auth:sanctum');
Route::resource('/Agama', AgamaController::class); //->middleware('auth:sanctum');
Route::resource('/AnggotaKK', AnggotaKKController::class)->middleware('auth:sanctum');

Route::get('/login', [LoginController::class, 'index'])->name('login');

