<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MyController;
use App\Models\Countrie;
use App\Models\Service_sector;
use App\Models\Service_categorie;
use App\Models\Service_type;
use App\Models\Service_level;
use DB;
use Response;

class FiltersController extends MyController {
    function __construct() {
    }
    public function get(Request $request) {
        $result = array();
        $result['sectors'] = Service_sector::get();
        $result['categories'] = Service_categorie::get();
        $result['service_types'] = Service_type::get();
        $result['aimed_for'] = DB::table('service_for')
                ->select('id', 'sfor')
                ->get();
        $result['countries'] = Countrie::get();
        $result['levels'] = Service_level::get();
        $result['durations'] = DB::table('durations')
                ->select('id', 'duration')
                ->where(['deleted_at' => NULL])
                ->get();
        $result['activities_including'] = DB::table('activities')
                ->select('id', 'activity')
                ->where(['deleted_at' => NULL])
                ->get();
        $result['regions'] = DB::table('regions')
                ->select('id', 'region')
                ->where(['deleted_at' => NULL])
                ->get();
        return $this->sendResponse(config('constants.DATA_FOUND'), $result, 200);
    }

    public function aboutUs(Request $request) {
        $result = DB::table('about_us')->first();
       // print_r($result);
        if (!$result) {
            return $this->sendError(config('constants.DATA_NOT_FOUND'), [], 401);
        }
        return $this->sendResponse(config('constants.DATA_FOUND'), $result, 200);
    }

    public function termsConditions(Request $request) {
        $result = DB::table('terms_conditions')->get();
        if ($result->isEmpty()) {
            return $this->sendError(config('constants.DATA_NOT_FOUND'), [], 401);
        }
        return $this->sendResponse(config('constants.DATA_FOUND'), $result, 200);
    }

    public function privacyPolicy(Request $request) {
        $result = DB::table('privacy_policy')->get();
        if ($result->isEmpty()) {
            return $this->sendError(config('constants.DATA_NOT_FOUND'), [], 401);
        }
        return $this->sendResponse(config('constants.DATA_FOUND'), $result, 200);
    }

}
