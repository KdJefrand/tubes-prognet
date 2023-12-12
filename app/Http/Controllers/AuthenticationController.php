<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User;

class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        // Use $request->json()->all() for JSON data and $request->all() for form data
        $data = $request->json()->all(); // Always use json() for JSON requests

        // If the JSON data is empty, fallback to form data
        if (empty($data)) {
            $data = $request->all();
        }

        // Validate data
        $validator = Validator::make($data, [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Continue with your logic
        $user = User::where('email', $data['email'])->first();

        if (!$user || !Hash::check($data['password'], $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        return $user->createToken('User login')->plainTextToken;
    }
    public function register(Request $request)
    {
        // Validate other fields from the request if needed

        $password = $request->input('password');
        $hashedPassword = Hash::make($password);

        User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => $hashedPassword,
        ]);

        return 'User created!';
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return 'Token deleted!';
    }

}
