<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\Health_condition;
use App\Models\Height;
use App\Model\Weight;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\MyController;
use DB;

class HealthConditionsController extends MyController {

    public function get_all() {
        $result = array();
        $healths = Health_condition::select('id', 'name')
        ->orderBy('name', 'ASC')
        ->get();
        //dd($healths);
        if (!empty($healths)) {
            foreach ($healths as $health) {
                $result[] = $health->attributesToArray();
            }
        }
        if (!empty($result)) {
            return $this->sendResponse('Health listing', $result, 200);
        }
        return $this->sendError('No data found', $result, 400);
    }
    public function getHeightsWeights(){
        $result = array();
        $heights = DB::table('heights')
         ->get()
        ->toArray();

       $weights = DB::table('weights')
         ->get()
        ->toArray();

        $result = array(
            'heights'=> $heights,
            'weights'=> $weights
        );
        // if (!empty($heights)) {
        //     foreach ($heights as $height) {
        //         $result['height'] = $height->attributesToArray();
        //     }
        // }

        // if (!empty($weights)) {
        //     foreach ($weights as $weight) {
        //         $result['weight'] = $weight->attributesToArray();
        //     }
        // }
        if (!empty($result)) {
            return $this->sendResponse('Health listing', $result, 200);
        }
        return $this->sendError('No data found', $result, 400);

    }

}
