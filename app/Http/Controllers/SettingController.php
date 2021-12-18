<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;
use Validator;


class SettingController extends Controller
{
    

    public function index(Request $req){
         try{
            
            $settings = Setting::where('status', 1)->get();

           // $settings = json_encode(Setting::pluck('key', 'value')->all() );

             $breadcrumbs = [
            ['link' => "modern", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Pages"], ['name' => " Settings"],
                ];
        //Pageheader set true for breadcrumbs
        $pageConfigs = ['pageHeader' => true];

        return view('settings.index', ['settings'=> $settings, 'pageConfigs' => $pageConfigs], ['breadcrumbs' => $breadcrumbs]);
         }catch(\Exception $ex){
                return redirect()->back()->with('error', $ex->getMessage() );
        }

       
    }

}
