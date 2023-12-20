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

Route::resource('/Penduduk', PendudukController::class);
Route::resource('/KK', KartuKeluargaController::class);
Route::resource('/HubunganKK', HubunganKKController::class);
Route::resource('/Agama', AgamaController::class);
Route::resource('/AnggotaKK', AnggotaKKController::class);
Route::resource('/Login', LoginController::class);
