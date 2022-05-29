<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

use function PHPUnit\Framework\isEmpty;
use function PHPUnit\Framework\isTrue;

class AuthController extends Controller
{
    public $messageStatus = 200;

    public function register(Request $request)
    {

        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()]);
        }

        $cekmail = User::where('email', $request->email)->first();

        if ($cekmail) {
            return response()->json(['error' => "Email Sudah digunakan"]);
        } else {
            $input = $request->all();
            $input['password'] = bcrypt($input['password']);
            $user = User::Create($input);
            $success['token'] = $user->createToken('GlucosApp')->accessToken;
            $success['name'] = $user->name;


            return response()->json(['success' => $success], $this->messageStatus);
        }
    }

    public function login()
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')], true)) {
            $user = Auth::user();
            $success['token'] = $user->remember_token;
            $success['name'] = $user->name;
            return response()->json(['success' => $success], $this->messageStatus);
        } else {
            return response()->json(['error' => 'Error'], 401);
        }
    }
}
