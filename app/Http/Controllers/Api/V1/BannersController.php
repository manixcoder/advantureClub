<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\MyController;
use DB;

class BannersController extends MyController
{

    function __construct()
    {
    }

    public function getBanners(Request $request)
    {
        $servicesData = DB::table('services')->where(['country' => $request->country_id,'status'=>'1'])->get();
        
        $serviceid=array();
        foreach ($servicesData as $key => $services) {
            array_push($serviceid,$services->id);
            //dd($services->id);
        }
       // $serviceid = implode (",", $serviceid);
       // dd($serviceid);
       
       $bannerData = DB::table('service_offers')
       //->whereIn('service_id',[$serviceid])
       ->whereIn('service_id', implode (",", $serviceid))
       ->where('status','1')
       ->get();
        $url = asset('public/uploads/');
      //  dd($bannerData);

        //dd($bannerData);
        
        return $this->sendResponse(config('constants.DATA_FOUND'), $bannerData, 200);
        // if (!$bannerData) {
        //     return $this->sendResponse(config('constants.DATA_FOUND'), $bannerData, 200);
        // }
        // return $this->sendError('No record found.', [], 404);
    }
}
