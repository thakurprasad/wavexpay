<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Logs extends Model
{
    use HasFactory;
     public  $timestamps = false;
    protected $fillable = [
                    'model_name',
                    'row_id',
                    'api_name',
                    'api_url',
                    'request_params',
                    'response_params',
                    'status',
                    'created_at',
                    'created_by'
                ];

}
