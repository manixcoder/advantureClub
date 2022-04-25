<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\Countrie;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\MyController;
use DB;

class CountriesController extends MyController {

    public function get_all() {
        $result = array();

        $countries = Countrie::select('id', 'country', 'short_name', 'code')->where(['deleted_at' => NULL])->orderBy('country', 'ASC')->get();
        if (!$countries->isEmpty()) {
            return $this->sendResponse('Countries listing', $countries, 200);
        }
        
        return $this->sendError('No data found', [], 400);
    }

    public function getCities(Request $request, $id) {
        $result = array();

        $cities = DB::table('cities as ct')
                        ->select('cnt.id as country_id', 'cnt.country', 'ct.id as city_id', 'ct.city')
                        ->leftJoin('countries as cnt', 'cnt.id', '=', 'ct.country_id')
                        ->where(['ct.country_id' => $id, 'ct.deleted_at' => NULL])->orderBy('ct.city', 'ASC')->get();

        if (!$cities->isEmpty()) {
            return $this->sendResponse('Cities listing', $cities, 200);
        }
        return $this->sendError('No data found', [], 400);
    }

    public function getRegions(Request $request, $id) {
        $result = array();

        $cities = DB::table('regions as rg')
                        ->select('cnt.id as country_id', 'cnt.country', 'rg.id as region_id', 'rg.region')
                        ->leftJoin('countries as cnt', 'cnt.id', '=', 'rg.country_id')
                        ->where([
                            'rg.country_id' => $id, 
                            'rg.deleted_at' => NULL
                        ])
                        ->orderBy('rg.region', 'ASC')
                        ->get();
        if (!$cities->isEmpty()) {
            return $this->sendResponse('Regions listing', $cities, 200);
        }
        return $this->sendError('No data found', [], 400);
    }

}
