<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\MerchantApiKey;

class Merchant
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
       
        $key_secret     =  $request->header('x-client-secret');
        $key_id         =  $request->header('x-client-id');
        $m_row = MerchantApiKey::where([
                            'key_id' => $key_id,
                            'key_secret' => $key_secret,
                            'status' => 1,
                        ])->where('deleted', '!=', 1)->first();

        if (! $m_row ) {
           //return response()->json('Invalid key_id or key_secret : ' .$key_secret . " key_id : " . $key_id);
           return BaseController::sendError('Invalid key_id or key_secret .'); 
        }else{
            $request->merchant_id   = $m_row->merchant_id;
            $request->pg            = $m_row->pg;
        } 
        return $next($request);
    }
}
