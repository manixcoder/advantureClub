<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Service_categorie;
use App\Http\Controllers\MyController;
use DB;

class CategoriesController extends MyController
{

    function __construct()
    {
    }

    public function get(Request $request, $id = null)
    {
        $result = array();
        $url = asset('public/category_img/');
        if ($id) {
            $data = Service_categorie::select([
                'id',
                'category',
                'image',
                'status'
            ])
                ->where([
                    'id' => $request->id,
                    'deleted_at' => null
                ])
                ->first();
        } else {
            $data = Service_categorie::select([
                'id',
                'category',
                DB::raw("CONCAT('" . $url . "/',image) as image"),
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
