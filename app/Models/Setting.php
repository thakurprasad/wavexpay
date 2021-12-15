<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    public  $timestamps = false;
    protected $fillable = [
                'type',
                'key',
                'value',
                'status',
                'created_at',
                'craeted_by',
                'updated_at',
                'updated_by'
        ];
}   
