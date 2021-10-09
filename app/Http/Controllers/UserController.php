<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateProfileRequest;
use Illuminate\Http\Request;

class UserController extends Controller
{
     /**
     * Show the update profile page.
     *
     * @param  Request $request
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function edit(Request $request)
    {
        return view('profile', [
            'user' => $request->user()
        ]);
    }

    public function update(UpdateProfileRequest $request)
    {
        $request->user()->update(
        $request->all()
    );

    return redirect()->route('profile.edit');
    }
}
