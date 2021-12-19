<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MerchantApiKey extends Model
{
    use HasFactory;

    public  $timestamps = false;
    protected $fillable = [

        'merchant_id',
        'key_id',
        'key_secret',
        'expiry',
        'status',
        'deleted',
        'created_at',
        'craeted_by'
    ];
}
