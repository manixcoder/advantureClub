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

    public function get(Request $request, $id = null)
    {
        $result = array();
        $url = asset('public/uploads/');
        if ($id) {
            $data = Banner::select([
                'id',
                DB::raw("CONCAT('" . $url . "/',banner) AS banner"),
                DB::raw("CONCAT('" . $url . "',thumbnail) AS thumbnail"),
                'title',
                'status'
            ])
                ->where([
                    'id' => $request->id,
                    'deleted_at' => null
                ])
                ->first();
        } else {
            $data = Banner::select([
                "id",
                DB::raw("CONCAT('" . $url . "/',banner) AS banner"),
                DB::raw("CONCAT('" . $url . "',thumbnail) AS thumbnail"),
                'title',
                'status'
            ])
                ->get();
        }
        if (!$data->isEmpty()) {
            return $this->sendResponse(config('constants.DATA_FOUND'), $data, 200);
        }
        return $this->sendError('No record found.', [], 404);
    }
}
