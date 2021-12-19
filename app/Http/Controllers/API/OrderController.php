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
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;
   

class OrderController extends BaseController
{
    
    public function cashfree($data){
        //
    }

    /**
     * 
     *
     * {
            "order_id":100,
            "order_amount" : 51.30,
            "order_currency" : "INR",
            "customer_details": {
                "customer_id": "A00001",
                "customer_email": "aaa@cashfree.com",
                "customer_phone" : "9908734801",
                "customer_name": "c name"
            },
             "order_meta": {
                 "return_url": "https://b8af79f41056.eu.ngrok.io?order_id={order_id}&order_token={order_token}",
                 "notify_url": "https://b8af79f41056.eu.ngrok.io/webhook.php"
             },
            "order_expiry_time": "2021-12-25T11:09:51Z"
        }

        Response:

        {
            "success": true,
            "code": 200,
            "data": {
                "cf_order_id": 1946208,
                "order_id": "100_ftlgazyRAeKjn3xMsdkI",
                "entity": "order",
                "order_currency": "INR",
                "order_amount": 51.3,
                "order_expiry_time": "2021-12-25T16:39:51+05:30",
                "customer_details": {
                    "customer_id": "A00001",
                    "customer_name": "c name",
                    "customer_email": "aaa@cashfree.com",
                    "customer_phone": "9908734801"
                },
                "order_meta": {
                    "return_url": "https://b8af79f41056.eu.ngrok.io?order_id={order_id}&order_token={order_token}",
                    "notify_url": "https://b8af79f41056.eu.ngrok.io/webhook.php",
                    "payment_methods": null
                },
                "settlements": {
                    "url": "https://sandbox.cashfree.com/pg/orders/100_ftlgazyRAeKjn3xMsdkI/settlements"
                },
                "payments": {
                    "url": "https://sandbox.cashfree.com/pg/orders/100_ftlgazyRAeKjn3xMsdkI/payments"
                },
                "refunds": {
                    "url": "https://sandbox.cashfree.com/pg/orders/100_ftlgazyRAeKjn3xMsdkI/refunds"
                },
                "order_status": "ACTIVE",
                "order_token": "BwpO3rWoqTlDlXmLsDRm",
                "order_note": null,
                "payment_link": "https://payments-test.cashfree.com/order/#BwpO3rWoqTlDlXmLsDRm",
                "order_tags": null,
                "order_splits": []
            },
            "message": "Payment successfully."
        }


     * */

    public function create(Request $request){
        //return ">>>>". $request->merchant_id . " | " .$request->pg;
       // try{
                $data = $request->getContent();
                $REQ_DATA = json_decode($data);
               
            
                $ORDER['merchant_id']       = $request->merchant_id;
                $ORDER['pg']                = $request->pg;
                $ORDER['domain']            = 'NA'; //request()->referer;
                $ORDER['order_id']          = $REQ_DATA->order_id .'_'. Str::random(20); 
                $ORDER['amount']            = $REQ_DATA->order_amount ;
                $ORDER['currency']          = $REQ_DATA->order_currency ;
                $ORDER['customer_id']       = $REQ_DATA->customer_details->customer_id ;
                $ORDER['customer_name']     = $REQ_DATA->customer_details->customer_name ;
                $ORDER['customer_email']    = $REQ_DATA->customer_details->customer_email ;
                $ORDER['customer_mobile']   = $REQ_DATA->customer_details->customer_phone ;
                $ORDER['return_url']        = $REQ_DATA->order_meta->notify_url ;
                $ORDER['notify_url']        = $REQ_DATA->order_meta->notify_url ;
                $ORDER['order_expiry_time'] = Helper::expiry_time_sql(12);  // // "2021-08-01 11:09:51"
                //echo json_encode($ORDER);
                DB::beginTransaction();
                $order_new = Order::create($ORDER);
              //  return $ORDER;    

                #api header list include client id, client secret and version etc..
                $api_headers    = Helper::getHeaders($request->merchant_id);
                #api base url
                $api_base_url   = Helper::getBaseUrl($request->pg,  'test_base_url');
                $apiURL         = $api_base_url . '/orders'; // cashfree order create url
                
                $REQ_DATA       = json_decode($data, true);
                #genrate random order_id for cashfree order request
                $REQ_DATA['order_id']           = $request->order_id .'_'. Str::random(20);
               // $REQ_DATA['order_expiry_time']  = Helper::expiry_time(12); // // "2021-08-01T11:09:51Z"

                $response       = Http::withHeaders($api_headers)->post($apiURL, $REQ_DATA);
                $statusCode     = $response->status();
                $resp  =  $response->getBody();
                
                if($resp){
                    $order_arr  = json_decode($resp);
                    if(!empty($order_arr->code) || !empty($order_arr->type)) {
                        DB::rollback();
                        return $this->sendError($order_arr->message, $order_arr);
                    }else{
                        $order_new->response        = $resp; // save response in json data
                        $order_new->order_token     = $order_arr->order_token;
                        $order_new->cf_order_id     = $order_arr->cf_order_id;
                        $order_new->entity          = $order_arr->entity;
                        $order_new->settlements_url = $order_arr->settlements->url;
                        $order_new->payments_url    = $order_arr->payments->url;
                        $order_new->refunds_url     = $order_arr->refunds->url;
                        $order_new->order_status    = $order_arr->order_status;
                        $order_new->order_token     = $order_arr->order_token;
                        $order_new->payment_link    = $order_arr->payment_link;
                        $order_new->order_tags      = $order_arr->order_tags;
                        $order_new->order_splits    = $order_arr->order_splits;

                        $order_new->save();
                         DB::commit();
                        return $this->sendResponse($order_arr, 'Payment successfully.');
                    }
                }else{
                       DB::rollback();
                    return $this->sendError('Something went wrong please try again');
                }
/*
         }catch(\Exception $ex){
            DB::rollback(); 
            return $this->sendError($ex->getMessage());
        }   */
        
        
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
