<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Payment;
use Validator;
use App\Http\Resources\Payment as ContactResource;
use Illuminate\Support\Facades\Http;

  
class PaymentController extends BaseController
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payments = Payment::all();
        return $this->sendResponse(PaymentResource::collection($payments), 'Payments retrieved successfully.');
    }


    /**
     * {{Sandbox_URL}}/orders/pay
     * 
     * {
            "order_token": "{{orderToken}}",
            "payment_method": {
                "netbanking": {
                    "channel": "link",
                    "netbanking_bank_code": 3022
                }
            }
        }

        Response: 
        {
            "payment_method": "netbanking",
            "channel": "link",
            "action": "link",
            "data": {
                "url": "https://sandbox.cashfree.com/pg/view/gateway/2ram43ii1xc0ggwsr9ot1b97f4a2166dc138bae5eed00126316a",
                "payload": null,
                "content_type": null,
                "method": null
            },
            "cf_payment_id": 1211343
        }

     * 
     * 
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $content = request()->getContent();
        $validator = Validator::make($input, [
            'merchant_id' => 'required',
            'order_token' => 'required',
            'payment_method' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $arr = json_decode($content);
        $DATA['merchant_id']    =  $arr->merchant_id;
        $DATA['order_token']    =  $arr->order_token;
        $DATA['payment_method'] =  $arr->payment_method;
        $DATA['payment_method_params'] =  $arr->payment_method_params; 
        $payment = Payment::create($DATA);  

        $apiURL = $this->base_url . '/orders';    
        $response = Http::withHeaders($this->headers)->post($apiURL, $POST_API_DATA);
        $statusCode = $response->status();
        $resp =  $response->getBody();
        if($resp){
            $data  = json_decode($resp);
        }
        return $this->sendResponse(new PaymentResource($payment), 'Payment successfully.');
    } 
   
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contact $contact)
    {
       
    }
   
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Contact $contact)
    {
        
    }
}