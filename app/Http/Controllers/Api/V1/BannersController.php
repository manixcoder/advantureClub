<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Http\Controllers\MyController;
use DB;

class BannersController extends MyController
{

    function __construct()
    {
    }

    public function get(Request $request)
    {
        $servicesData = DB::table('services')->where(['country' => $request->country_id])->get();
        $serviceid=array();
        foreach ($servicesData as $key => $services) {
            array_push($serviceid,$services->id);
            //dd($services->id);
        }
        $serviceid = implode (", ", $serviceid);
        $bannerData =DB::table('service_offers')->whereIn('service_id',[$serviceid])->get();
        $url = asset('public/uploads/');
        

        
        
        
        if (!$bannerData->isEmpty()) {
            return $this->sendResponse(config('constants.DATA_FOUND'), $bannerData, 200);
        }
        return $this->sendError('No record found.', [], 404);
    }
}
