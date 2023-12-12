<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AgamaController;
use App\Http\Controllers\AnggotaKKController;
use App\Http\Controllers\HubunganKKController;
use App\Http\Controllers\KKController;
use App\Http\Controllers\PendudukController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('/Penduduk', PendudukController::class);
Route::apiResource('/KK', KKController::class);
Route::apiResource('/HubunganKK', HubunganKKController::class);
Route::apiResource('/Agama', AgamaController::class);
Route::apiResource('/AnggotaKK', AnggotaKKController::class);