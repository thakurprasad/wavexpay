<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
      protected $fillable = [
        'merchant_id',
        'pg',
        'domain',
        'order_id',
        'amount',
        'product_name',
        'product_details',
        'customer_name',
        'customer_mobile',
        'customer_email',
        'return_url',
        'notify_url',
        'order_expiry_time',
        'order_token',
        'response',
        'created_at',
       // 'updated_at'
    ];
}
