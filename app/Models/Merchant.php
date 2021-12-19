<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{
    use HasFactory;

    public  $timestamps = false;
    protected $fillable = [
            'merchant_id',
            'display_name',
            'contact_number',
            'business_name',
            'business_type',
            'activation_date',
            'account_access',
            'additional_website_app',
            'limit_per_transaction',  
    ];
}
