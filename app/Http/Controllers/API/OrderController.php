<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Order;
use Validator;
use App\Http\Resources\Order as OrderResource;
use Illuminate\Support\Facades\Storage;
use Helper;
use Illuminate\Support\Facades\DB; 

use Illuminate\Support\Facades\Http;
use Carbon\Carbon;
   

class OrderController extends BaseController
{
    

    private $headers = array();
    private $base_url = '';

    function __construct()
    {
        //   
         $this->headers =  [
                        'Accept'        => 'application/json',
                        'Content-Type'  => 'application/json',
                        'x-api-version' => Helper::getSetting('cashfree', 'x-api-version'),
                        'x-client-id' => Helper::getSetting('cashfree', 'x-client-id'),
                        'x-client-secret'=> Helper::getSetting('cashfree', 'x-client-secret')
                      ];
        $this->base_url = Helper::getSetting('cashfree', 'test_base_url');
    }


    public function create(Request $request){
         $data = $request->getContent();
         echo  $request->header('x-client-secret');
        // return $request->header();
      exit();
        $REQ_DATA = json_decode($data, true);
       // echo $POST_API_DATA->order_amount;
       // echo $POST_API_DATA->customer_details->customer_phone;

        /*
        $ORDER['merchent_id'] = $REQ_DATA-> ;
        $ORDER['pg'] = $REQ_DATA-> ;
        $ORDER['domain'] = $REQ_DATA-> ;
        $ORDER['order_id'] = $REQ_DATA-> ;
        $ORDER['amount'] = $REQ_DATA-> ;
        $ORDER['product_name'] = $REQ_DATA-> ;
        $ORDER['product_details'] = $REQ_DATA-> ;
        $ORDER['customer_name'] = $REQ_DATA-> ;
        $ORDER['customer_mobile'] = $REQ_DATA-> ;
        $ORDER['customer_email'] = $REQ_DATA-> ;
        $ORDER['return_url'] = $REQ_DATA-> ;
        $ORDER['notify_url'] = $REQ_DATA-> ;
        $ORDER['order_expiry_time'] = $REQ_DATA-> ;
        $ORDER['order_token'] = $REQ_DATA-> ;
        $ORDER['response'] = $REQ_DATA-> ;
        $ORDER['created_at'] = $REQ_DATA-> ;
        $ORDER['updated_at'] = $REQ_DATA-> ;
        $payment =[];// Payment::create($DATA);   */

        $apiURL = $this->base_url . '/orders'; 
        //$this->headers;   
        $response = Http::withHeaders($this->headers)->post($apiURL, $REQ_DATA);
        $statusCode = $response->status();
        $resp =  $response->getBody();
        if($resp){
            $data  = json_decode($resp);
        }
        return $this->sendResponse($data, 'Payment successfully.');
        
        
    }

    public function test_not_used(Request $request)
    {
        var_dump($request->input());
        $input = $request->all();
        var_dump($input);
        exit();
        $content = $request->getContent();
        $content2 = request()->getContent();
        var_dump($content);
        var_dump($content2);
        exit();
        $validator = Validator::make($input, [
            'order_id'          => 'required',
            'order_currency'     => 'required',                        
            'order_amount'      => 'required|numeric',
            'customer_details'  => 'required',
            'order_meta'        => 'required',
           //'order_expiry_time' => 'required' 
        ]);
   
        if($validator->fails()){
         //   return $this->sendError('Validation Error.', $validator->errors());       
        }

        $arr = json_decode($content);
        //return $arr;
        echo "line 62: " . $arr->order_amount;
        exit();
/*
        $DATA['merchent_id']    =  $arr->;
        $DATA['pg']             =  $arr->;
        $DATA['domain']         =  $arr->;
        $DATA['order_id']       =  $arr->;
        $DATA['amount']         =  $arr->;
        $DATA['product_name']   =  $arr->;
        $DATA['product_details']=  $arr->;
        $DATA['customer_name']  =  $arr->;
        $DATA['customer_mobile']=  $arr->;
        $DATA['customer_email'] =  $arr->;
        $DATA['return_url']     =  $arr->;
        $DATA['notify_url']     =  $arr->;
        $DATA['order_expiry_time']    =  $arr->;
        //$DATA['order_token']        =  $arr->;
        //$DATA['response']       =  $arr->;
        $DATA['created_at']     =  $arr->; 


        $payment = Payment::create($DATA);  

        $apiURL = $this->base_url . '/orders';    
        $response = Http::withHeaders($this->headers)->post($apiURL, $POST_API_DATA);
        $statusCode = $response->status();
        $resp =  $response->getBody();
        if($resp){
            $data  = json_decode($resp);
        }
        return $this->sendResponse(new PaymentResource($payment), 'Payment successfully.'); */

    }

    



}
