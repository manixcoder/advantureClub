<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\Health_condition;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\MyController;

class HealthConditionsController extends MyController {

    public function get_all() {
        $result = array();
        $healths = Health_condition::select('id', 'name')->orderBy('name', 'ASC')->get();
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

}
