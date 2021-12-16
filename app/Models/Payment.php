<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;
    public  $timestamps = false;
    protected $fillable = [
                    'merchant_id',
                    'order_token',
                    'payment_method',
                    'payment_method_params',
                    'response',
                    'created_at',
                    'updated_at'
                ];
}
