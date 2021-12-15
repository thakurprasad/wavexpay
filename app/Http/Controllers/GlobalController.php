<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Setting;
use App\Models\Logs;
use Illuminate\Support\Facades\Http;

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

    public function payment_link($order_token){
        $apiURL = "https://payments-test.cashfree.com/order/#".$order_token;

      $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $apiURL,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_TIMEOUT => 80000,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => array(
                // Set Here Your Requesred Headers
                '',
            ),
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        echo  $response;

    }

    public function payment_link2($order_token){
        $apiURL = "https://payments-test.cashfree.com/order/#".$order_token;

        $endpoint = $apiURL; // "http://my.domain.com/test.php";
        $client = new \GuzzleHttp\Client();
        $id = 5;
        $value = "ABC";

        $response = $client->request('GET', $endpoint, ['query' => [
            
        ]]);

        // url will be: http://my.domain.com/test.php?key1=5&key2=ABC;

        $statusCode = $response->getStatusCode();
       return $content = $response->getBody();  

    }

}
