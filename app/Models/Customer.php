<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Model;

class Customer extends Model
{
    protected $guarded =['id'];
    protected $fillable = [
        'name','phone', 'email', 'password',
    ];

    protected $hidden =[
        'password','remember_token',
    ];

    public function getAuthPassword(){
        return $this->password;
    }
}
