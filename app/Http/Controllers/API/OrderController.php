<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Validator;

class OrderController extends Controller
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
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      return $input = $request->all();
      /*return  $content = request()->getContent();
        $validator = Validator::make($input, [
            'order_amount' => 'required',
            'order_currency' => 'required',
           //'customer_details' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $arr = json_decode($content);
        return $arr;
        $DATA['merchant_id']    =  $arr->merchant_id;*/
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

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }
}
