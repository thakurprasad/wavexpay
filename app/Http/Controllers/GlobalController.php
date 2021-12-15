<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Setting;
use App\Models\Logs;


class GlobalController extends Controller
{
   
    public function cashfree_return_url(Request $req){
        $DATA = [
            'model_name' => 'NA',
            'row_id' => 0 ,
            'api_name' => 'cashfree_return_url' ,
            'api_url' => '',
            'request_params' => json_encode($req->input()),
            'response_params' => $req->input('order_token'),
            'status' => 1 ,
            'created_at' => date('Y-m-d H:i:s'),
            'created_by' => \Auth::user()->id
        ];
        Logs::create($DATA);
    }

    public function cashfree_notify_url(Request $req){
         $DATA = [
            'model_name' => 'NA',
            'row_id' => 0 ,
            'api_name' => 'cashfree_notify_url' ,
            'api_url' => '',
            'request_params' => json_encode($req->input()),
            'response_params' => $req->input(),
            'status' => 1 ,
            'created_at' => date('Y-m-d H:i:s'),
            'created_by' => \Auth::user()->id
        ];
        Logs::create($DATA);

    }

}
