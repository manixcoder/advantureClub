<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Otp;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\MyController;
use Hash;
use DB;

class VendorsController extends MyController
{

    public function getPackages(Request $request)
    {
        $result = DB::table('packages')->select(['id as package_id', 'title', 'duration', 'status'])
            ->where(['deleted_at' => NULL])
            ->get();
        if (!$result->isEmpty()) {
            return $this->sendResponse(config('constants.DATA_FOUND'), $result, 200);
        }
        return $this->sendError('Data not found.', [], 404);
    }

    public function addPackage(Request $request)
    {
    }
}
