<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\Service;
use App\Models\Countrie;
use App\Models\Service_sector;
use App\Models\Service_categorie;
use App\Models\Service_type;
use App\Models\Service_level;
use App\Models\Aimed;
use App\Models\Duration;
use App\Models\Dependency;
use App\Models\ServiceFor;
use App\Models\Activities;
use App\Http\Controllers\MyController;
use Illuminate\Support\Facades\Storage;
use DB;
 
class ServicesController extends MyController
{

    function __construct()
    {
    }

    public function getallDependency()
    {
        $dependency = Dependency::get();
        return $this->sendResponse($dependency, 200);
    }
    public function getServiceFor()
    {
        $serviceFor = Aimed::get();
        return $this->sendResponse($serviceFor, 200);
    }
    public function visitedLocation(Request $request){
        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'destination_name' => 'required',
            'destination_type' => 'required',
            'geo_location' => 'required',
            'destination_address'=> 'required',
            'dest_mobile' => 'required',
            // 'dest_website' => 'required',
            'destination_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            if ($request->hasFile('destination_image')) {
                $file = $request->file('destination_image');
                $destination_image = 'destination_image' . time() . '.' . $file->getClientOriginalExtension();
                $file->move('public/uploads/destination_image/', $destination_image);
               // $product->pro_image = $destination_image;
               
            }else{
                $destination_image='';
            }
            $locationData = DB::table('visited_location')->insert([
                'user_id'=>$request->user_id,
                'destination_name'=>$request->destination_name,
                'destination_type'=>$request->destination_type,
                'destination_address'=>$request->destination_address,
                'geo_location'=>$request->geo_location,
                'dest_mobile'=>$request->dest_mobile,
                'dest_website'=>$request->dest_website,
                'destination_image'=>'destination_image/'.$destination_image
                ]);
                
           return $this->sendResponse(config('constants.DATA_FOUND'), [], 200);
        }
    }
    public function storeTransaction(Request $request){
       // dd($request->all());
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'transaction_id' => 'required',
            'type' => 'required',
            'transaction_type'=> 'required',
            'order_type'=> 'required',
            'method' => 'required',
            'status' => 'required',
            'price' => 'required',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            
            $locationData = DB::table('transactions')->insert([
                'user_id'=>$request->user_id,
                'transaction_id'=>$request->transaction_id,
                'type'=>$request->type,
                'order_type'=>$request->order_type,
                'transaction_type'=>$request->transaction_type,
                'method'=>$request->method,
                'status'=>$request->status,
                'price'=>$request->price,
                ]);
                
           return $this->sendResponse("Data store successfully", [], 200);
        }
    }
    public function getVisitedLocation(){
       $locationData = DB::table('visited_location')->get(); 
       
        return $this->sendResponse(config('constants.DATA_FOUND'),  $locationData, 200);
    }

    public function get(Request $request, $id = null)
    {
        $result = array();
        $url = asset('public'). '/';
        $s_img = asset('public/uploads') . '/';

        if ($id) {
            $where = 'srvc.id = ' . $id . ' ';
        } else {
            $where = ' 1 ';
        }
        if ($request->recommended == 1) {
            $where .= " && srvc.recommended =  1";
        }
        if ($request->provider_name) {
            $where .= ' && usr.name LIKE "%' . $request->provider_name . '%"';
        }
        if ($request->sector) {
            $where .= ' && ssec.id = ' . $request->sector;
        }
        if ($request->category) {
            $where .= ' && scat.id = ' . $request->category;
        }
        if ($request->type) {
            $where .= ' && styp.id = ' . $request->type;
        }
        if ($request->aimed) {
            $where .= ' && ssfor.sfor_id = ' . $request->aimed;
        }
        if ($request->level) {
            $where .= ' && slvl.id = ' . $request->level;
        }
        if ($request->duration) {
            $where .= ' && dur.id = ' . $request->duration;
        }
        $recently_added = 'ASC';
        if ($request->recently_added) {
            $recently_added = 'DESC';
        }
        if ($id) {
            $services = DB::table('services as srvc')
                ->select([
                    'srvc.*',
                    'srvc.service_plan',
                    'srvc.owner as provider_id',
                    'usr.name as provider_name',
                    DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                    DB::raw("CONCAT('" . $s_img . "/',simg.thumbnail) AS thumbnail"),
                   // DB::raw("CONCAT(srvc.duration,' Min') AS durations"),
                    
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'rgn.region',
                    'cntri.currency',
                    'srvc.cost_inc',
                    'srvc.cost_exc'
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('service_images as simg', 'srvc.id', '=', 'simg.service_id')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')
                ->leftJoin('service_service_for as ssfor', 'ssfor.service_id', '=', 'srvc.id')
                ->leftJoin('aimed as sfor', 'sfor.id', '=', 'ssfor.sfor_id')
                
                ->where(['srvc.deleted_at' => NULL])
                ->groupBy('ssfor.service_id')
                ->whereRaw($where)
                ->get();
                //dd( $services[0]->duration);

            if (!$services->isEmpty()) {
                $imageData = DB::table('service_images')->where('service_id', $id)->get();
                
                $ratingData = DB::table('service_reviews')->where('service_id', $id)->get();
                if(count($ratingData) >0 ){
                   $rating = DB::table('service_reviews')
                    ->select([
                        'service_id',
                        DB::raw("AVG(star) AS stars"),
                        DB::raw("COUNT(user_id) AS reviewd_by")
                    ])
                    ->where('service_id', $id)
                    ->groupBy('service_id')
                    ->first(); 
                    $services[0]->rating =  $rating->stars;
                    $services[0]->reviewd_by =  $rating->reviewd_by;
                    
                }else{
                    $services[0]->rating =  '0';
                    $services[0]->reviewd_by =  '0';
                }
                $services[0]->is_liked = 0;
                if ($request->user_id >= 1) {
                    $is_liked = DB::table('service_likes')->select(['service_id'])->where('user_id', $request->user_id)->first();
                    $services[0]->is_liked = isset($is_liked->service_id) ? 1 : 0;
                }
                $services[0]->baseurl = $s_img;
                $services[0]->images =  $imageData;
               // $services[0]->rating =  $rating;
                $activities = DB::table('service_activities as s_act')->select(['s_act.*', 'act.activity'])->leftJoin('activities as act', 'act.id', '=', 's_act.activity_id')->where('s_act.service_id', $id)->get()->toArray();
                $services[0]->included_activities = $activities ?? [];
                $dependencies = DB::table('service_dependencies as s_dep')->select(['dep.*', 'dep.dependency_name'])->leftJoin('dependency as dep', 'dep.id', '=', 's_dep.dependency_id')->where('s_dep.service_id', $id)->get()->toArray();
                $services[0]->dependencies = $dependencies ?? [];
                $programs = DB::table('service_programs')->select(['id','service_id','title','start_datetime','end_datetime','description'
                ])->where('service_id', $id)->get();
                $services[0]->programs = $programs;
                if ($services[0]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')->select(['spdd.id', 'wkd.day'])->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')->where('spdd.service_id', $id)->get()->toArray();
                    $services[0]->availability = $availability ?? [];
                } else if ($services[0]->service_plan == 2) {
                    // $availability = DB::table('service_plan_day_date as spdd')
                    //     ->select(['spdd.id', 'spdd.date'])
                    //     ->where('spdd.service_id', $id)
                    //     ->get()
                    //     ->toArray();
                    $availability = DB::table('services as srvc')
                        ->select(['srvc.start_date', 'srvc.end_date'])
                        ->where('srvc.id', $id)
                        ->get()
                        ->toArray();
                    $services[0]->availability = $availability ?? [];
                }
                $star_ratings_res = DB::table('service_reviews')->select(['service_id',DB::raw("AVG(star) AS stars"),DB::raw("COUNT(user_id) AS reviewd_by")])->where('service_id', $id)->groupBy('service_id')->first();
                $services[0]->stars = $star_ratings_res ? number_format($star_ratings_res->stars, 2, '.', '') : 0;
                $services[0]->reviewd_by = $star_ratings_res ? $star_ratings_res->reviewd_by : 0;
                $booked_seats_qry = DB::table('bookings')
                    ->select(['id'])
                    ->where(['service_id' => $id, 'status' => 1])
                    ->get();
                    $durations =DB::table('durations')->select('duration')->where('durations.id', $services[0]->duration)->first();
                  //  dd($durations);
                $services[0]->duration =$durations->duration; 
                $booked_seats = $booked_seats_qry->count();
                $services[0]->booked_seats = $booked_seats;
                $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $id)
                    ->get();

                $services[0]->aimed_for = $aimedforData;
                $bookings = DB::table('bookings')
                    ->where('service_id', $id)
                    ->get()
                    ->toArray();
                $services[0]->booking =  count($bookings);
                $services[0]->bookingData =  $bookings;
                $dayData = DB::table('service_plan_day_date')->where('service_id', $id)->get();
                $services[0]->manish = $dayData;
                $services[0]->remaining_seats = $services[0]->available_seats - $booked_seats;
                return $this->sendResponse(config('constants.DATA_FOUND'), $services[0], 200);
            }
        } else {

            $star_ratings = [];
            $star_ratings_res = DB::table('service_reviews')
                ->select(['service_id', DB::raw("AVG(star) AS stars"), DB::raw("COUNT(user_id) AS reviewd_by")])
                ->groupBy('service_id')
                ->get()->toArray();
            if (count($star_ratings_res)) {
                foreach ($star_ratings_res as $rat) {
                    $star_ratings[$rat->service_id] = (array) $rat;
                }
            }
            $liked_services = [];
            if ($request->user_id >= 1) {
                $liked_services_res = DB::table('service_likes')
                    ->select(['service_id'])
                    ->where(['user_id' => $request->user_id])
                    ->get()->toArray();
                if (count($liked_services_res)) {
                    foreach ($liked_services_res as $res) {
                        $liked_services[] = $res->service_id;
                    }
                }
            }

            $services = DB::table('services as srvc')
                ->select([
                    'srvc.*',
                    'srvc.owner as provider_id',
                    'usr.name as provided_name',
                    DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                    DB::raw("CONCAT('" . $s_img . "/',simag.thumbnail) AS thumbnail"),
                    //DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                    'dur.duration AS duration',
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'rgn.region',
                    'srvc.currency',
                    DB::raw("GROUP_CONCAT(sfor.sfor) as aimed_for"),
                    'srvc.cost_inc as including_gerea_and_other_taxes',
                    'srvc.cost_exc as excluding_gerea_and_other_taxes'
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('service_images as simag', 'srvc.id', '=', 'simag.service_id')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')
                ->leftJoin('service_service_for as ssfor', 'ssfor.service_id', '=', 'srvc.id')
                ->leftJoin('aimed as sfor', 'sfor.id', '=', 'ssfor.sfor_id')
                ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
                ->leftJoin('service_images as simg', 'simg.service_id', '=', 'srvc.id')
                ->whereRaw($where)
                ->where(['srvc.deleted_at' => NULL])
                ->groupBy('ssfor.service_id')
                ->orderBy('updated_at', $recently_added)
                ->get();

            foreach ($services as $key => $ser) {
                $service_id = $ser->id;
                $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $service_id)
                    ->get();


                if ($services[$key]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else if ($services[$key]->service_plan == 2) {
                    // $availability = DB::table('service_plan_day_date as spdd')
                    //     ->select(['spdd.id', 'spdd.date'])
                    //     ->where('spdd.service_id', $service_id)
                    //     ->get()
                    //     ->toArray();
                    $availability = DB::table('services as srvc')
                        ->select(['srvc.start_date', 'srvc.end_date'])
                        ->where('srvc.id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                }

                $activities = DB::table('service_activities as s_act')
                    ->select(['s_act.*', 'act.activity'])
                    ->leftJoin('activities as act', 'act.id', '=', 's_act.activity_id')
                    ->where('s_act.service_id', $service_id)
                    ->get()
                    ->toArray();
                $services[$key]->included_activities = $activities ?? [];
                $dependencies = DB::table('service_dependencies as s_dep')
                    ->select(['dep.*', 'dep.dependency_name'])
                    ->leftJoin('dependency as dep', 'dep.id', '=', 's_dep.dependency_id')
                    ->where('s_dep.service_id', $service_id)
                    ->get()
                    ->toArray();
                $services[$key]->dependencies = $dependencies ?? [];

                $services[$key]->aimed_for = $aimedforData;
                $dayData = DB::table('service_plan_day_date')->where('service_id', $service_id)->get();
                $services[$key]->manish = $dayData;
                $services[$key]->stars = isset($star_ratings[$service_id]) ? number_format($star_ratings[$service_id]['stars'], 2, '.', '') : 0;
                $services[$key]->is_liked = in_array($service_id, $liked_services) ? 1 : 0;
                $bookings = DB::table('bookings')
                    ->where('service_id', $service_id)
                    ->get()
                    ->toArray();
                $services[$key]->booking =  count($bookings);
                $services[$key]->bookingData =  $bookings;
                $services[$key]->baseurl = $s_img;
                $services[$key]->images =  $imageData;
            }
        }
        if (!$services->isEmpty()) {
            return $this->sendResponse(config('constants.DATA_FOUND'), $services, 200);
        }
        return $this->sendError('No record found.', [], 404);
    }


    public function get_all(Request $request)
    {

        // dd($request->all());
        $result = array();
        $url = asset('public'). '/';
        $s_img = asset('public/uploads');
        $service_category = DB::table('service_categories')
            ->where('status', 1)
            ->orderBy('id', 'DESC')
            ->where('deleted_at', NULL)
            ->get();
        $star_ratings = [];
        $star_ratings_res = DB::table('service_reviews')
            ->select([
                'service_id', DB::raw("AVG(star) AS stars"),
                DB::raw("COUNT(user_id) AS reviewd_by")
            ])
            ->groupBy('service_id')
            ->get()->toArray();
        if (count($star_ratings_res)) {
            foreach ($star_ratings_res as $rat) {
                $star_ratings[$rat->service_id] = (array) $rat;
            }
        }
        $liked_services = [];
        if ($request->user_id >= 1) {
            $liked_services_res = DB::table('service_likes')
                ->select(['service_id'])
                ->where(['user_id' => $request->user_id])
                ->get()->toArray();
            if (count($liked_services_res)) {
                foreach ($liked_services_res as $res) {
                    $liked_services[] = $res->service_id;
                }
            }
        }

        $serviceCategory = array();
        foreach ($service_category as $category) {
            $service_array = array();
            $services = DB::table('services as srvc')
                ->select([
                    'srvc.*',
                    'srvc.owner as provider_id',
                    'srvc.id as service_id',
                    'srvc.service_plan',
                    'srvc.descreption',
                    'usr.name as provided_name',
                    DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                    DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'rgn.region',
                    'cntri.currency as currency',
                    'srvc.cost_inc as including_gerea_and_other_taxes',
                    'srvc.cost_exc as excluding_gerea_and_other_taxes'
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')

                ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
                ->where([
                    'srvc.service_category' => $category->id,
                    'srvc.country' => $request->country_id,
                    'srvc.status' => '1'
                ])
                ->where(['srvc.deleted_at' => NULL,'srvc.status'=>'1'])
                // ->groupBy('ssfor.service_id')
                ->orderBy('srvc.id',  'DESC')
                ->get();
            //dd($services);        
            foreach ($services as $key => $ser) {
                $service_id = $ser->id;
                $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $service_id)
                    ->get();
                if ($services[$key]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else if ($services[$key]->service_plan == 2) {
                    // $availability = DB::table('service_plan_day_date as spdd')
                    //     ->select(['spdd.id', 'spdd.date'])
                    //     ->where('spdd.service_id', $service_id)
                    //     ->get()
                    //     ->toArray();
                    $availability = DB::table('services as srvc')
                        ->select(['srvc.start_date', 'srvc.end_date'])
                        ->where('srvc.id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                }
                $services[$key]->aimed_for = $aimedforData;
                $services[$key]->stars = isset($star_ratings[$service_id]) ? number_format($star_ratings[$service_id]['stars'], 2, '.', '') : 0;
                $services[$key]->is_liked = in_array($service_id, $liked_services) ? 1 : 0;
                $services[$key]->baseurl = $s_img;
                $services[$key]->images = $imageData;

                //$service_array[]=$ser;
            }
            if (!$services->isEmpty()) {
                $service_array = array(
                    'category' => $category->category,
                    'services' => $services
                );
            }
            if (!empty($service_array)) {
                array_push($serviceCategory, $service_array);
            }
        }
        return $this->sendResponse(config('constants.DATA_FOUND'), $serviceCategory, 200);
    }

    public function myServicereview(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $liked = DB::table('users')
                ->leftJoin('service_reviews', 'users.id', '=', 'service_reviews.user_id')
                ->leftJoin('service_likes', 'users.id', '=', 'service_likes.user_id')
                ->get();
            return $this->sendResponse('Liked', $liked, 200);
        }
    }

    public function likeService(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
            'like' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
                //print_r($messages); die;
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $liked = DB::table('service_likes')
                ->where([
                    'user_id' => $request->user_id,
                    'service_id' => $request->service_id
                ])
                ->first();
            //dd($liked);
            if (!empty($liked)) {
                if ($request->like == 0) {
                    DB::table('service_likes')->where(['user_id' => $request->user_id, 'service_id' => $request->service_id])->delete();
                    //DB::table('service_plan_day_date')->where('service_id', '=', $service_id)->delete();
                    return $this->sendResponse('DisLiked', [], 200);
                } elseif ($request->like == 1) {
                    //DB::table('service_likes')->insert(['user_id' => $request->user_id, 'service_id' => $request->service_id, 'is_like' => $request->like]);
                    return $this->sendResponse('Already Liked', [], 200);
                } else {
                    return $this->sendError('First like and then dislike', [], 401);
                }
            } else {
                if ($request->like == 1) {
                    DB::table('service_likes')->insert(['user_id' => $request->user_id, 'service_id' => $request->service_id, 'is_like' => $request->like]);
                    return $this->sendResponse('Liked', [], 200);
                } else {
                    return $this->sendError('Not Liked Please Try again', [], 401);
                }
            }
        }
    }

    public function addReview(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
            'star' => 'required|numeric|min:1|max:5',
            'remark' => 'required|min:10|max:150',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            if (DB::table('service_reviews')->insert([
                'user_id' => $request->user_id,
                'service_id' => $request->service_id,
                'star' => $request->star,
                'remark' => $request->remark
            ])) {
                $review_id = DB::getPdo()->lastInsertId();
                $rev_data = DB::table('service_reviews')->where(['id' => $review_id])->first();
                return $this->sendResponse('Review added successfully', $rev_data, 200);
            } else {
                return $this->sendError('Something went wrong', [], 401);
            }
        }
    }
    
    public function addReviewLocation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'location_id' => 'required|numeric',
            'rating' => 'required|numeric|min:1|max:5',
            'rating_description' => 'required|min:10',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            if (DB::table('location_reviews')->insert([
                'user_id' => $request->user_id,
                'location_id' => $request->location_id,
                'rating' => $request->rating,
                'rating_description' => $request->rating_description
            ])) {
                $review_id = DB::getPdo()->lastInsertId();
                $rev_data = DB::table('location_reviews')->where(['id' => $review_id])->first();
                return $this->sendResponse('Review added successfully', $rev_data, 200);
            } else {
                return $this->sendError('Something went wrong', [], 401);
            }
        }
    }

    public function bookService(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'service_id' => 'required',
            'provider_id'=> 'required',
            'adult' => 'required',
            'kids' => 'required',
            'message' => 'required',
            'points' => 'numeric',
            'coupon_applied' => 'required',
            'promo_code' => '',
            'booking_date' => 'required|date_format:Y-m-d'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $service_detail = DB::table('services')->where(['id' => $request->service_id])->first();
            if (!$service_detail) {
                return $this->sendError('Adventure not found.', [], 401);
            }
            $service_exc_amt = $service_detail->cost_exc;
            $service_inc_amt = $service_detail->cost_inc;
            $total_amt = $service_inc_amt * ($request->adult + $request->kids);
            $service_disc_amt = $total_amt;
            $disc_typ = '';
            $disc_amt = '';
            $flag = false;
            if ($request->promo_code) {
                $promocode = DB::table('promocode')->where(['code' => $request->promo_code])->first();
                
                $promocodeUsed = DB::table('promocode_users')->select('*')
                 ->where([
                     'user_id' => $request->user_id,
                     'promocode_id' => $promocode->id
                    ])
                    ->get();
                if(!$promocodeUsed->isEmpty()){
                  if(count($promocodeUsed) >= (int)$promocode->redeemed_count){
                      return $this->sendError('You have allready used max limit', [], 401); 
                  }  
                }
                if ($promocode) {
                    if ($promocode->discount_type == '1') {
                        $disc_typ = 1; //Direct amount
                        $disc_amt = $promocode->discount_amount;
                        $service_disc_amt = $total_amt - $disc_amt;
                    } elseif ($promocode->discount_type == '2') {
                        $disc_typ = 2; // Percentage discount
                        $disc_amt = $promocode->discount_amount;
                        $service_disc_amt = $total_amt - (($total_amt * $disc_amt) / 100);
                    }
                    $flag = true;
                }
            }

            if (DB::table('bookings')->insert([
                'user_id' => $request->user_id,
                'service_id' => $request->service_id,
                'provider_id'=>$request->provider_id,
                'adult' => $request->adult,
                'kids' => $request->kids,
                'message' => $request->message,
                'booking_date' => $request->booking_date,
                'currency' => $service_detail->currency,
                'coupon_applied' => $flag,
                'unit_amount' => $service_inc_amt,
                'total_amount' => $total_amt,
                'discounted_amount' => $service_disc_amt,
                'created_at' => date('Y-m-d H:i:s'),
            ])) {
                $booking_id = DB::getPdo()->lastInsertId();
                $booking_data = DB::table('bookings')->select([
                    '*',
                    'id as booking_id'
                ])->where([
                    'id' => $booking_id
                ])->first();
                if ($flag) {
                    DB::table('promocode_users')->insert([
                        'booking_id' => $booking_id,
                        'user_id' => $request->user_id,
                        'service_id' => $request->service_id,
                        'promocode_id' => $promocode->id,
                        'promocode' => $promocode->code,
                        'disc_type' => $promocode->discount_type,
                        'disc_amt' => $disc_amt,
                        'service_amt_befor_disc' => $total_amt,
                        'service_amt_after_disc' => $service_disc_amt,
                        'created_at' => date('Y-m-d H:i:s'),
                    ]);
                }
                
                 $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $request->provider_id,
                    'title' => 'Booking',
                    'message' => 'Booking request shared by a client, please validation health conditions and details before approving/declining the request!',
                    'notification_type' => '2',
                );
                DB::table('notifications')->insert($providerNoti); 
                
                 $notiData = array(
                'sender_id' => '1',
                'user_id' => $request->user_id,
                'title' => 'Booking',
                'message' => 'Your booking has been submitted',
                'notification_type' => '2',

            );
            DB::table('notifications')->insert($notiData);
                return $this->sendResponse('Booking has been successfull.', $booking_data, 200);
            } else {
                return $this->sendError('Something went wrong', [], 401);
            }
        }
    }

    public function checkPromoCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
            'promo_code' => 'required'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            
            $promocode = DB::table('promocode')->select([
                '*',
                DB::raw("IF(discount_type = '1','Amount','Percentage') AS discount_type")
            ])
                ->where('code', '=', $request->promo_code)
                ->first();
           //  dd($promocode);   
               $promocodeUsed = DB::table('promocode_users')->select('*')
                 ->where(
                     [
                         'user_id' => $request->user_id, 
                         'promocode_id' => $promocode->id
                    ]
                    )
                ->get();
                if(!$promocodeUsed->isEmpty()){
                    //dd(count($promocodeUsed));
                  if(count($promocodeUsed) >= (int)$promocode->redeemed_count){
                      
                     return $this->sendError('You have allready used max limit', [], 401); 
                  }  
                }
                
            //  dd(time());
            //  dd(strtotime($promocode->start_date));
            if ($promocode) {
                return $this->sendResponse('Valid code', $promocode, 200);
                if (strtotime($promocode->start_date) <= time() && strtotime($promocode->end_date) >= time()) {
                    return $this->sendResponse('Valid code', $promocode, 200);
                } else {
                    return $this->sendError('Expired code', [], 401);
                }
            } else {
                return $this->sendError('Invalid code', [], 401);
            }
        }
    }

    public function updatePayment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'service_id' => 'required',
            'booking_id' => 'required',
            'payment_method' => 'required',
            'amount' => 'required',
            'transaction_id' => 'required',
            'transaction_date' => 'required',
            'transaction_date' => 'required',
            'account_name' => 'required',
            'status' => 'required',
            'points' => 'required'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $booking = DB::table('bookings')
            ->where([
                'id' => $request->booking_id, 
                'status' => 0
            ])
            ->first();
            if ($booking) {
                if (DB::table('payments')->insert([
                    'user_id'               => $request->user_id,
                    'service_id'            => $request->service_id,
                    'booking_id'            => $request->booking_id,
                    'payment_method'        => $request->payment_method,
                    'amount'                => $request->amount,
                    'transaction_id'        => $request->transaction_id,
                    'transaction_date'      => $request->transaction_date,
                    'account_name'          => $request->account_name,
                    'status'                => $request->status,
                    'created_at'            => date('Y-m-d H:i:s'),
                ])) {
                    $payment_id = DB::getPdo()->lastInsertId();
                    DB::table('bookings')->where(['id' => $request->booking_id])
                    ->update(['payment_status' => $request->status]);
                    $this->updateWallet($request, $payment_id);
                    return $this->sendResponse('Payment updated successfully', [], 200);
                } else {
                    return $this->sendError('Something went wrong.', [], 401);
                }
            } else {
                return $this->sendError('No booking found or already paid. Create a new booking.', [], 401);
            }
        }
    }

    public function updateWallet($request, $payment_id, $transaction_type = 1)
    {
        $user_id = $request->user_id;
        $wallet = DB::table('wallets')->where('user_id', $user_id)->orderBy('id', 'DESC')->first();
        if ($wallet) {
            $last_wallet_amt = $wallet->current_amt;
        } else {
            $last_wallet_amt = 0;
        }
        $service_detail = Service::select(['points'])->where(['id' => $request->service_id])->first();
        $earn_points = $service_detail->points;
        if ($transaction_type == 1 && $earn_points > 0) {
            $wallet_data = array(
                'user_id' => $request->user_id,
                'booking_id' => $request->booking_id,
                'payment_id' => $payment_id,
                'amount_type' => 2,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            );
            $wallet_data['credit_amt'] = $earn_points;
            $new_balance = $last_wallet_amt + $earn_points;
            $wallet_data['current_amt'] = $new_balance;
            DB::table('wallets')->insert($wallet_data);
        }

        $wallet_new = DB::table('wallets')->where('user_id', $user_id)->orderBy('id', 'DESC')->first();
        if ($wallet_new) {
            $last_wallet_amt = $wallet_new->current_amt;
        } else {
            $last_wallet_amt = 0;
        }
        if ($request->points > 0) {
            $wallet_data = array(
                'user_id' => $request->user_id,
                'booking_id' => $request->booking_id,
                'payment_id' => $payment_id,
                'amount_type' => 2,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            );
            if ($last_wallet_amt > $request->points) {
                $wallet_data['debit_amt'] = $request->points;
                $new_balance = $last_wallet_amt - $request->points;
                $wallet_data['current_amt'] = $new_balance;
            } else {
                $wallet_data['debit_amt'] = 0;
                $new_balance = $last_wallet_amt - 0;
                $wallet_data['current_amt'] = $new_balance;
                $wallet_data['note'] = 'You have not insufficient points';
            }
            DB::table('wallets')->insert($wallet_data);
        }
    }

    public function addFavourite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $favourite = DB::table('favourites')->where(['user_id' => $request->user_id, 'service_id' => $request->service_id])->first();
            if ($favourite) {
                if (DB::table('favourites')->where([
                    'user_id' => $request->user_id,
                    'service_id' => $request->service_id
                ])->update(['updated_at' => date('Y-m-d H:i:s')])) {
                    return $this->sendResponse('Added to favourite', [], 200);
                } else {
                    return $this->sendError('Something went wrong.', [], 401);
                }
            } else {
                if (DB::table('favourites')->insert([
                    'user_id' => $request->user_id,
                    'service_id' => $request->service_id,
                    'created_at' => date('Y-m-d H:i:s')
                ])) {
                    return $this->sendResponse('Added to favourite', [], 200);
                } else {
                    return $this->sendError('Something went wrong.', [], 401);
                }
            }
        }
    }

    public function removeFavourite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'service_id' => 'required'

        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            if (DB::table('favourites')->where([
                'user_id' => $request->user_id,
                'service_id' => $request->service_id
            ])->delete()) {
                return $this->sendResponse('Remove from favourite', [], 200);
            } else {
                return $this->sendError('No record found to delete.', [], 401);
            }
            return $this->sendError('No record found to delete.', [], 401);
        }
    }

    public function getFavourite(Request $request)
    {
        $url = asset('public'). '/';
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $star_ratings = [];
            $star_ratings_res = DB::table('service_reviews')
                ->select([
                    'service_id', DB::raw("AVG(star) AS stars"),
                    DB::raw("COUNT(user_id) AS reviewd_by")
                ])
                ->groupBy('service_id')
                ->get()
                ->toArray();
            if (count($star_ratings_res)) {
                foreach ($star_ratings_res as $rat) {
                    $star_ratings[$rat->service_id] = (array) $rat;
                }
            }
            $liked_services = [];
            if ($request->user_id >= 1) {
                $liked_services_res = DB::table('service_likes')
                    ->select(['service_id'])
                    ->where(['user_id' => $request->user_id])
                    ->get()->toArray();
                if (count($liked_services_res)) {
                    foreach ($liked_services_res as $res) {
                        $liked_services[] = $res->service_id;
                    }
                }
            }
            $services = DB::table('services as srvc')
                ->select([
                    'srvc.id as service_id',
                    'srvc.owner as provider_id',
                    'srvc.adventure_name',
                    'srvc.service_plan',
                    'srvc.cost_inc',
                    'srvc.cost_exc',
                    'srvc.write_information',
                    'srvc.created_at',
                    'srvc.updated_at',
                    'usr.name as provided_name',
                    DB::raw("CONCAT('" . $url . "/',usr.profile_image) AS provider_profile"),
                    // DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'cntri.currency as currency',
                    'srvc.duration as duration',
                    DB::raw(

                        DB::raw("IF(slike.is_like=1,slike.is_like,0) AS is_liked")
                    )
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')
                //->leftJoin('currencies as curr', 'curr.id', '=', 'srvc.currency')
                ->leftJoin('service_service_for as ssfor', 'ssfor.service_id', '=', 'srvc.id')
                ->leftJoin('aimed as sfor', 'sfor.id', '=', 'ssfor.sfor_id')
                ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
                ->leftJoin('service_likes as slike', 'slike.service_id', '=', 'srvc.id')
                ->leftJoin('favourites as fav', 'fav.service_id', '=', 'srvc.id')
                ->where('fav.user_id', $request->user_id)
                ->groupBy('ssfor.service_id')
                ->get();

            if (!$services->isEmpty()) {
                foreach ($services as $key => $ser) {
                    //dd($ser);
                    $service_id = $ser->service_id;
                    $aimedforData = DB::table('service_service_for as ssfor')
                        ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                        ->select('sfor.*', 'ssfor.service_id')
                        ->where('ssfor.service_id', $service_id)
                        ->get();
                    if ($services[$key]->service_plan == 1) {
                        $availability = DB::table('service_plan_day_date as spdd')
                            ->select(['spdd.id', 'wkd.day'])
                            ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                            ->where('spdd.service_id', $service_id)
                            ->get()
                            ->toArray();
                        $services[$key]->availability = $availability ?? [];
                    } else if ($services[$key]->service_plan == 2) {
                        // $availability = DB::table('service_plan_day_date as spdd')
                        //     ->select(['spdd.id', 'spdd.date'])
                        //     ->where('spdd.service_id', $service_id)
                        //     ->get()
                        //     ->toArray();
                        $availability = DB::table('services as srvc')
                            ->select(['srvc.start_date', 'srvc.end_date'])
                            ->where('srvc.id', $service_id)
                            ->get()
                            ->toArray();
                        $services[$key]->availability = $availability ?? [];
                    }
                    $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                    $services[$key]->images = $imageData;
                    $services[$key]->aimed_for = $aimedforData;
                    $services[$key]->stars = isset($star_ratings[$service_id]) ? number_format($star_ratings[$service_id]['stars'], 2, '.', '') : 0;
                    $services[$key]->is_liked = in_array($service_id, $liked_services) ? 1 : 0;
                }
                return $this->sendResponse(config('constants.DATA_FOUND'), $services, 200);
            }
            return $this->sendError('No record found.', [], 404);
        }
    }


    public function servicesFilter(Request $request)
    {
       // dd($request->all());
        $url = asset('public'). '/';
        $s_img = asset('public/uploads') . '/';
        $countries = DB::table('countries')->first();
        //dd($countries->id);
         if ($request->country) {
            $where = '  srvc.country = ' . $request->country;
        } else {
            $where ='  srvc.country = ' .$countries->id;
        }
        if ($request->category) {
            $where .= ' and srvc.service_category = ' . $request->category . ' ';
        } 

        // if ($request->category) {
        //     $where .= ' and srvc.service_category = ' . $request->category . ' ';
        // } 
       
        // if ($request->provider_name) {
        //     $where .= " || srvc.owner =  " . $request->owner;
        // } 
        
        //  if ($request->aimed) {
        //     $where .= ' and ssfor.sfor_id = ' . $request->aimed;
        // }
        if ($request->provider_name) {
            $where .= ' and usr.name LIKE "%' . $request->provider_name . '%"';
        }
        if ($request->region) {
            $where .= ' and srvc.region = ' . $request->region;
        }
        if ($request->service_type) {
            $where .= ' and srvc.service_type = ' . $request->service_type;
        }

       
        if ($request->level) {
            $where .= ' and srvc.service_level = ' . $request->level;
        }
        if ($request->duration) {
            $where .= ' and srvc.duration = ' . $request->duration;
        }
        
        if ($request->budget) {
            $where .= ' and srvc.duration = ' . $request->budget;
        }
        
        
        //  echo $where;  die;

        if ($request->activity_id) {
            $activity_ids = $request->activity_id;
        } else {
            $activity_ids = '1';
        }
        
        
        //dd($activity_ids);



        if ($request->budget) {
            $where .= ' || srvc.cost_inc = ' . $request->budget;
        }
        $recently_added = 'ASC';
        if ($request->recently_added) {
            $recently_added = 'DESC';
        }
        $services = DB::table('services as srvc')
            ->select([
                'srvc.*',
                'srvc.id as service_id',
                'srvc.owner as provider_id',
                'srvc.service_plan',
                'usr.name as provider_name',
                DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                'scat.category as service_category',
                'ssec.sector as service_sector',
                'styp.type as service_type',
                'slvl.level as service_level',
                'cntri.country',
                'rgn.region',
                'cntri.currency',
                'dur.duration',
                'srvc.cost_inc as cost_inc',
                'srvc.cost_exc as cost_exc'
            ])
            ->join('users as usr', 'usr.id', '=', 'srvc.owner')
            ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
            ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
            ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
            ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
            ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
            ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')
            ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
            //->leftJoin('service_activities as sa', 'sa.service_id', '=', 'srvc.id')
            
            //->leftJoin('service_service_for as ssfor', 'ssfor.service_id', '=', 'srvc.id')
            //->leftJoin('aimed as sfor', 'sfor.id', '=', 'ssfor.sfor_id')
            ->where([
                'srvc.deleted_at' => NULL,
                //'srvc.status'=>'1'
            ])
            // ->groupBy('ssfor.service_id')
            ->whereRaw($where)
            ->get();
        // dd($services);
        if ($services->isEmpty()) {
            return $this->sendError('No data found', [], 400);
        }
        if (!$services->isEmpty()) {
            foreach ($services as $key => $ser) {
                $service_id = $ser->id;
                $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                $services[$key]->is_liked = 0;
                if ($request->user_id >= 1) {
                    $is_liked = DB::table('service_likes')
                        ->select(['service_id'])
                        ->where('user_id', $request->user_id)
                        ->first();
                    $services[$key]->is_liked = isset($is_liked->service_id) ? 1 : 0;
                }
                $services[$key]->baseurl = $s_img;
                $services[$key]->images =  $imageData;
                
                $activities = DB::table('service_activities as s_act')->select(['s_act.*', 'act.activity'])
                    ->leftJoin('activities as act', 'act.id', '=', 's_act.activity_id')
                    ->where('s_act.service_id', $service_id)
                    ->whereIn('s_act.activity_id', [$activity_ids])
                    ->get()
                    ->toArray();
                    
                $services[$key]->included_activities = $activities ?? [];

                if ($services[$key]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else if ($services[$key]->service_plan == 2) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'spdd.date'])
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                }
                $star_ratings_res = DB::table(
                    'service_reviews'
                )
                    ->select([
                        'service_id',
                        DB::raw("AVG(star) AS stars"),
                        DB::raw("COUNT(user_id) AS reviewd_by")
                    ])
                    ->where('service_id', $service_id)
                    ->groupBy('service_id')
                    ->first();

                if ($services[$key]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else if ($services[$key]->service_plan == 2) {
                    
                    $availability = DB::table('services as srvc')
                        ->select(['srvc.start_date', 'srvc.end_date'])
                        ->where('srvc.id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                }

                $services[$key]->stars          = $star_ratings_res ? number_format($star_ratings_res->stars, 2, '.', '') : 0;
                $services[$key]->reviewd_by     = $star_ratings_res ? $star_ratings_res->reviewd_by : 0;
                $booked_seats_qry               = DB::table('bookings')->select(['id'])->where(['service_id' => $service_id, 'status' => 1])->get();
                $booked_seats                   = $booked_seats_qry->count();
                $services[$key]->booked_seats = $booked_seats;
                if ($request->aimed) {
                    $aimed_id = $request->aimed;
                    $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $service_id)
                    ->whereIn('ssfor.sfor_id', [$aimed_id])
                    ->get();
                } else {
                    $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $service_id)
                    ->get();
                }
                
                $services[$key]->aimed_for = $aimedforData;
                $programsData = DB::table('service_programs')->where('service_id', $service_id)->get();
                $services[$key]->programs = $programsData;
                $services[$key]->remaining_seats = $services[0]->available_seats - $booked_seats;
            }

            if (!$services->isEmpty()) {
                return $this->sendResponse('Data found successfully', $services, 200);
            }
            return $this->sendError('No data found', [], 400);
            return $this->sendResponse(config('constants.DATA_FOUND'), $services, 200);
        }
    }

    public function getPoints(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $wallet = DB::table('wallets')->where('user_id', $request->user_id)->orderBy('id', 'DESC')->first();
            if ($wallet) {
                $last_wallet_amt = $wallet->current_amt;
            } else {
                $last_wallet_amt = '0.00';
            }
        }
        return $this->sendResponse("Points in your account.", ['points' => $last_wallet_amt], 200);
    }

    public function getPurpose()
    {
        $purpose = DB::table('contactuspurposes')->orderBy('Id', 'ASC')->get();
        if ($purpose) {
            return $this->sendResponse("Purpose list", $purpose, 200);
        } else {
            return $this->sendError('No record found', [], 401);
        }
    }

    public function contactUs(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'mobile_code' => 'required',
            'mobile_number' => 'required',
            'email' => 'required',
            'purpose' => 'required',
            'subject' => 'required',
            'message' => 'required'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $data = [
                'name' => $request->name,
                'mobile_code' => $request->mobile_code,
                'mobile_number' => $request->mobile_number,
                'email' => $request->email,
                'purpose' => $request->purpose,
                'subject' => $request->subject,
                'message' => $request->message,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ];
            if (DB::table('contact_us')->insert($data)) {
                return $this->sendResponse("Query has been sent.", $data, 200);
            } else {
                return $this->sendError('Something went wrong. Try again.', [], 401);
            }
        }
    }
    public function getClientRequests(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'partner_id' => 'required',
            'country_id'=> 'required',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $services=DB::table('bookings as bkng')
            ->select([
                    'bkng.id as booking_id',
                    'bkng.user_id as booking_user',
                    'srvc.id as service_id',
                    'srvc.owner as owner_id',
                    'srvc.adventure_name',
                    'bkng.booking_date as service_date',
                    'bkng.created_at as booked_on',
                    'bkng.adult',
                    'bkng.kids',
                    'bkng.unit_amount as unit_cost',
                    'bkng.total_amount as total_cost',
                    'bkng.discounted_amount as discounted_amount',
                    'bkng.message',
                    'bkng.status',
                    'bkng.payment_status',
                    'usr.profile_image as profile_image',
                    'usr.email',
                    'usr.nationality_id',
                    'usr.name as provider_name',
                    'srvc.*',
                    'bkng.status as booking_status',
                    'cntri.country',
                    'cntri.currency',
                    'rgn.region',
                    'client.health_conditions',
                    'client.name as customer',
                    'client.email as client_email',
                    'client.dob',
                    'client.height',
                    'client.weight',
                    'catg.category'
                    ])
            ->Join('services as srvc', 'srvc.id', '=', 'bkng.service_id')
            ->leftJoin('service_categories as catg', 'catg.id', '=', 'srvc.service_category')
            ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
            ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
            ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
            ->leftJoin('users as client', 'client.id', '=', 'bkng.user_id')
            ->where('bkng.provider_id', $request->partner_id)
            ->where('bkng.status', '0')
            ->where('srvc.country', $request->country_id)
            ->orderBy('bkng.id', 'DESC')
            ->get();
           // dd($services);
        /*   
        $services = DB::table('bookings as bkng')
                ->select([
                    'bkng.id as booking_id',
                    'bkng.user_id as booking_user',
                    'usr.profile_image as profile_image',
                    'usr.email',
                    'usr.nationality_id',
                    'srvc.id as service_id',
                    'srvc.owner as owner_id',
                    'srvc.owner as provider_id',
                    'client.health_conditions',
                    'cntri.country',
                    'rgn.region',
                    'srvc.adventure_name',
                    'usr.name as provider_name',
                    'client.name as customer',
                    'client.email as client_email',
                    'bkng.booking_date as service_date',
                    'bkng.created_at as booked_on',
                    'bkng.adult',
                    'bkng.kids',
                    'bkng.unit_amount as unit_cost',
                    'bkng.total_amount as total_cost',
                    'pmnt.payment_method as payment_channel',
                    'cntri.currency as currency',  
                    'client.dob',
                    'client.height',
                    'client.weight',
                    'bkng.message',
                    'bkng.status',
                    'bkng.payment_status', 
                   // DB::raw("IF(bkng.status = 1,'Confirmed',IF(bkng.status=2,'Cancelled','Requested')) as booking_status_text"),
                   // DB::raw("IF(bkng.payment_status = 1,'Success',IF(bkng.payment_status=2,'Failed','Pending')) as payment_status_text"),
                    'catg.category'
                ])
                ->leftJoin('services as srvc', 'srvc.id', '=', 'bkng.service_id')
                ->leftJoin('service_categories as catg', 'catg.id', '=', 'srvc.service_category')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('users as client', 'client.id', '=', 'bkng.user_id')
               // ->leftJoin('payments as pmnt', 'pmnt.booking_id', '=', 'bkng.id')
               // ->where('bkng.user_id', $request->partner_id)
               ->where('bkng.provider_id', $request->partner_id)
                ->where('srvc.country', $request->country_id)
                ->where('bkng.status', '0')
                ->orderBy('bkng.id', 'DESC')
                ->get();*/
           // dd($services);
            if (count($services) >0) {
                foreach ($services as $key => $service) {
                // dd($service);
                 $nationality = DB::table('countries')->where('id', $service->nationality_id)->first();
                 $services[$key]->nationality = $nationality->short_name;
                 $bookingUser = DB::table('countries')->where('id', $service->nationality_id)->first();
                 $services[$key]->nationality = $nationality->short_name;
                 
                 $service_images = DB::table('service_images')->where('service_id', $service->service_id)->get();
                 $services[$key]->service_images = $service_images;
                 $health_condtions = DB::table('health_conditions')
                        ->select([DB::raw("GROUP_CONCAT(name) AS healths")])
                        ->whereIn('id', explode(',', $service->health_conditions))
                        ->first();
                $services[$key]->health_conditions =  $health_condtions->healths;
                   
                    
                    
                }
               // dd($service);
                if ($services) {
                    return $this->sendResponse("Request list", $services, 200);
                } else {
                    return $this->sendError('No record found', [], 401);
                }
            } else {
                return $this->sendError('No record found', [], 401);
            }
        }
    }

    public function bookingAcceptDecline(Request $request)
    {
         $bookingData = DB::table('bookings')->where(['id' => $request->booking_id])->first(); 
         if($bookingData){
            $servicesData = DB::table('services')->where(['id' => $bookingData->service_id])->first(); 
            $userData = DB::table('users')->where(['id' => $bookingData->user_id])->first(); 
           if($request->status=='1'){
               $notiData=array(
                   'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking accepted',
                 'message' => "Your booking #".$bookingData->id." has been accepted, please make payment via provided channels", 
               
                 'notification_type'=>'2',
                 );
            $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $bookingData->provider_id,
                    'title' => 'Booking accepted',
                    'message' => " ".$userData->name ." request #".$bookingData->id." has been accepted by you, plesse check payment status on service participants section.", 
                    'notification_type' => '2',
                );
         }else if($request->status=='2'){
            $notiData=array(
                 'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking Payment Done',
                 'message'=>"Your booking # ".$bookingData->id." ".$servicesData->adventure_name." Payment has been completed",
                 'notification_type'=>'2',
                 );
             $providerNoti = array(
                 'sender_id' => '1',
                 'user_id' => $bookingData->provider_id,
                 'title' => 'Booking',
                 'message' => " ".$userData->name ."request has been accepted, check payment status on service participants section.".$userData->name ." attempted payment by provided payment methods, please confirm the registration.",
                 'notification_type' => '2',
                );
         }else if($request->status=='3'){
           $notiData=array(
                 'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking decline',
                 'message'=>"Your request #". $bookingData->id." has been declined by provider, please clarify on chat.",
                 'notification_type'=>'2',
                 );  
                 $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $bookingData->provider_id,
                    'title' => 'Booking declined',
                    'message' => "Booking request#". $bookingData->id." for ".$userData->name ." has been declined by you.",
                    'notification_type' => '2',
                );
         }else if($request->status=='4'){
             $notiData=array(
                 'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking Completed',
                 'message'=>"Your request ". $bookingData->id." of activity ".$servicesData->adventure_name." has been dropped by you, please inform the provider for convenience.",
                 'notification_type'=>'2',
                 );
                 $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $bookingData->provider_id,
                    'title' => "Completed ( Manish )",
                    'message' => " ".$userData->name ." has dropped request ". $bookingData->id." of activity ".$servicesData->adventure_name,
                    'notification_type' => '2',
                );
         }
         else if($request->status=='5'){
             $notiData=array(
                 'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking dropped',
                 'message'=>"Your request ". $bookingData->id." of activity ".$servicesData->adventure_name." has been dropped by you, please inform the provider for convenience.",
                 'notification_type'=>'2',);
                 $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $bookingData->provider_id,
                    'title' => 'Booking dropped',
                    'message' => " ".$userData->name ." has dropped booking request# ". $bookingData->id." of activity ".$servicesData->adventure_name,
                    'notification_type' => '2',
                );
         }else{
              $notiData=array(
                 'sender_id'=>'1',
                 'user_id'=>$bookingData->user_id,
                 'title'=>'Booking Conformed ',
                 'message'=>'Your booking '.$servicesData->adventure_name.' has been Conformed ',
                 'notification_type'=>'2',
                 );
                 $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $bookingData->provider_id,
                    'title' => 'Booking',
                    'message' => 'Booking Conformed',
                    'notification_type' => '2',
                );
         }
         DB::table('notifications')->insert($providerNoti);
         DB::table('notifications')->insert($notiData);
         
         }
         
        if($request->status=='2'){
          $bookingData = DB::table('bookings')->where(['id' => $request->booking_id])->first(); 
          $service_id = $bookingData->service_id;
          $totalseatBooking= $bookingData->adult + $bookingData->kids;
          $servicesData = DB::table('services')->where(['id' => $service_id])->first();
          $available_seats= $servicesData->available_seats-$totalseatBooking;
          $servicesUpdate = DB::table('services')->where(['id' => $service_id])->update([
              'available_seats'=>$available_seats,
              
          ]);
        }
       
        
        // dd($request->all());
        DB::table('bookings')->where(['id' => $request->booking_id])->update([
            'status' => $request->status,
            'payment_channel'=>$request->payment_channel,
            'updated_by' => $request->user_id
        ]);
        
        
        return $this->sendResponse("Success", [], 200);
    }
    public function updateCountry(Request $request){
        $servicesData = DB::table('users')->where('id', $request->user_id)->update([
            'country_id'=>$request->country_id
            ]);
            return $this->sendResponse("Success", [], 200);
    }

    public function servicesDelete(Request $request)
    {
        $servicesData = DB::table('services')->where('id', $request->services_id)->get();
        if (!$servicesData->isEmpty()) {
            $bookingsData = DB::table('bookings')->where('service_id', $request->services_id)->get();
            if (!$bookingsData->isEmpty()) {
                return $this->sendError('To delete your service, please  contact the administrator to remove reservations first', [], 401);
            }
            DB::table('services')->where('id', $request->services_id)->delete();
            DB::table('service_activities')->where('service_id', $request->services_id)->delete();
            DB::table('service_dependencies')->where('service_id', $request->services_id)->delete();
            DB::table('service_images')->where('service_id', $request->services_id)->delete();
            DB::table('service_likes')->where('service_id', $request->services_id)->delete();
            DB::table('service_offers')->where('service_id', $request->services_id)->delete();
            DB::table('service_plan_day_date')->where('service_id', $request->services_id)->delete();
            DB::table('service_programs')->where('service_id', $request->services_id)->delete();
            DB::table('service_reviews')->where('service_id', $request->services_id)->delete();
            DB::table('bookings')->where('service_id', $request->services_id)->delete();
            return $this->sendResponse("Success", [], 200);
        } else {
            return $this->sendError('No record found', [], 401);
        }
        
        return $this->sendResponse("Success", [], 200);
    }

    public function getRequests(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'type' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $type = $request->type;
            $current_date =date("Y-m-d");
            if ($type == '1') {
                $where = ' bkng.booking_date < CURDATE()';
            } else {
                $where = ' bkng.booking_date > CURDATE() ';
            }
            $bookings = DB::table('bookings as bkng')
                ->select([
                    'bkng.id as booking_id',
                    'srvc.id as service_id',
                    'srvc.owner as provider_id',
                    'srvc.service_plan',
                    'cntri.country',
                    'cntri.currency',
                    'rgn.region',
                    'srvc.adventure_name',
                    'usr.name as provider_name',
                    'usr.height as height',
                    'usr.weight as weight',
                    'usr.health_conditions as health_conditions',
                    DB::raw('DATE_FORMAT(bkng.created_at, "%Y-%m-%d") as booking_date'),
                    'bkng.booking_date as activity_date',
                    'bkng.adult',
                    'bkng.kids',
                    'bkng.unit_amount as unit_cost',
                    'bkng.total_amount as total_cost',
                    'bkng.discounted_amount as discounted_amount',
                    'bkng.payment_channel as payment_channel',
                    'bkng.status',
                    'bkng.payment_status',
                    
                    'srvc.points',
                    'srvc.write_information as description',
                    DB::raw('CONCAT(adult," Adults, ",kids," Kids") as registrations'),
                ])
                ->Join('services as srvc', 'srvc.id', '=', 'bkng.service_id')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('payments as pmnt', function ($join) {
                    $join->on('pmnt.booking_id', '=', 'bkng.id')
                        ->where('pmnt.status', '=', 1);
                })
                //->whereIn('bkng.status','!=', ['3', '5'])
                ->where('bkng.status', '!=','3')
                ->Where('bkng.status', '!=','5')
                ->where(['bkng.user_id' => $request->user_id])
               ->whereRaw($where)
                ->get();
            foreach($bookings as $key=> $booking){
                $service_id = $booking->service_id;
                $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                $bookings[$key]->images =  $imageData;
            }
            if ($bookings) {
                return $this->sendResponse("Request list", $bookings, 200);
            } else {
                return $this->sendError('No record found', [], 401);
            }
        }
    }


    public function scheduledSession(Request $request)
    {
        $url = asset('public'). '/';
        $s_img = asset('public/uploads') . '/';
        $validator = Validator::make($request->all(), [
            //'user_id' => 'required|numeric',
            //'date' => 'required|date_format:Y-m-d',
            'country_id'=> 'required'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $services = DB::table('services as srvc')
                ->select([
                    'srvc.*',
                    'srvc.id as service_id',
                    'srvc.owner as provider_id',
                    'srvc.descreption',
                    'srvc.service_plan',
                    'usr.name as provided_name',
                    DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                    DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'rgn.region',
                    'cntri.currency as currency',
                    'srvc.cost_inc as including_gerea_and_other_taxes',
                    'srvc.cost_exc as excluding_gerea_and_other_taxes'
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')

                ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
                ->where([
                    //'srvc.service_category' => $request->user_id,
                    'srvc.country' => $request->country_id
                ])
                ->where([
                    'srvc.deleted_at' => NULL,
                    'srvc.status' => '1',
                ])
                // ->groupBy('ssfor.service_id')
                ->orderBy('srvc.id',  'DESC')
                ->get();
foreach ($services as $key => $ser) {
                $service_id = $ser->id;
                $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
                $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $service_id)
                    ->get();
                if ($services[$key]->service_plan == 1) {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else if ($services[$key]->service_plan == 2) {
                    // $availability = DB::table('service_plan_day_date as spdd')
                    //     ->select(['spdd.id', 'spdd.date'])
                    //     ->where('spdd.service_id', $service_id)
                    //     ->get()
                    //     ->toArray();
                    $availability = DB::table('services as srvc')
                        ->select(['srvc.start_date', 'srvc.end_date'])
                        ->where('srvc.id', $service_id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                }
                $services[$key]->aimed_for = $aimedforData;
                $services[$key]->stars = isset($star_ratings[$service_id]) ? number_format($star_ratings[$service_id]['stars'], 2, '.', '') : 0;
                //$services[$key]->is_liked = in_array($service_id, $liked_services) ? 1 : 0;
                $services[$key]->baseurl = $s_img;
                $services[$key]->images = $imageData;

                //$service_array[]=$ser;
            }

            // $liked_services = [];
            // if ($request->user_id >= 1) {
            //     $liked_services_res = DB::table('service_likes')->select(['service_id'])->where(['user_id' => $request->user_id])->get()->toArray();
            //     if (count($liked_services_res)) {
            //         foreach ($liked_services_res as $res) {
            //             $liked_services[] = $res->service_id;
            //         }
            //     }
            // }
            // $where = " bkng.booking_date = '" . date('Y-m-d', strtotime($request->date)) . "'";
            // $booking = DB::table('bookings as bkng')
            //     ->select([
            //         'bkng.id as booking_id',
            //         'srvc.id as service_id',
            //         'cntri.currency',
            //         'cntri.country',
            //         'rgn.region',
            //         'srvc.adventure_name',
            //         'srvc.service_plan',
            //         'srvc.service_level',
            //         'usr.name as provider_name',
            //         DB::raw("CONCAT('" . $url . "/',usr.profile_image) AS provider_profile"),
            //         'bkng.booking_date',
            //         'bkng.adult',
            //         'bkng.kids',
            //         'bkng.unit_amount as unit_cost',
            //         'bkng.total_amount as total_cost',
            //         'pmnt.payment_method as payment_channel',
            //         'srvc.points',
            //         'bkng.message',
            //         DB::raw("IF(bkng.status = 1,'Confirmed',IF(bkng.status=2,'Cancelled','Requested')) as booking_status"),
            //         DB::raw("IF(bkng.payment_status = 1,'Success',IF(bkng.payment_status=2,'Failed','Pending')) as payment_status"),
            //         'srvc.points',
            //         'srvc.write_information as description',
            //     ])
            //     ->leftJoin('services as srvc', 'srvc.id', '=', 'bkng.service_id')
            //     ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
            //     ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
            //     ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
            //     ->leftJoin('payments as pmnt', 'pmnt.booking_id', '=', 'bkng.id')
            //     ->where('bkng.user_id', $request->user_id)
            //     ->whereRaw($where)
            //     ->get();
            // if (!$booking->isEmpty()) {
            //     foreach ($booking as $key => $ser) {
            //         $service_id = $ser->service_id;
            //         $aimedforData = DB::table('service_service_for as ssfor')
            //             ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
            //             ->select('sfor.*', 'ssfor.service_id')
            //             ->where('ssfor.service_id', $service_id)
            //             ->get();

            //         $service_levels = DB::table('service_levels')
            //             ->where('id', $ser->service_level)
            //             ->first();

            //         $booking[$key]->aimed_for = $aimedforData;
            //         $booking[$key]->is_liked = in_array($service_id, $liked_services) ? 1 : 0;

            //         $booking[$key]->service_level = $service_levels;

            //         $imageData = DB::table('service_images')->where('service_id', $service_id)->get();
            //         $booking[$key]->is_liked = 0;
            //         if ($request->user_id >= 1) {
            //             $is_liked = DB::table('service_likes')
            //                 ->select(['service_id'])
            //                 ->where('user_id', $request->user_id)
            //                 ->first();
            //             $booking[$key]->is_liked = isset($is_liked->service_id) ? 1 : 0;
            //         }
            //         $booking[$key]->baseurl = $s_img;
            //         $booking[$key]->images =  $imageData;
            //         $activities = DB::table('service_activities as s_act')->select(['s_act.*', 'act.activity'])
            //             ->leftJoin('activities as act', 'act.id', '=', 's_act.activity_id')
            //             ->where('s_act.service_id', $service_id)
            //             ->get()
            //             ->toArray();
            //         $booking[$key]->included_activities = $activities ?? [];
            //     }

            //     if ($booking[$key]->service_plan == 1) {
            //         $availability = DB::table('service_plan_day_date as spdd')
            //             ->select(['spdd.id', 'wkd.day'])
            //             ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
            //             ->where('spdd.service_id', $service_id)
            //             ->get()
            //             ->toArray();
            //         $booking[$key]->availability = $availability ?? [];
            //     } else if ($booking[$key]->service_plan == 2) {
            //         $availability = DB::table('service_plan_day_date as spdd')
            //             ->select(['spdd.id', 'spdd.date'])
            //             ->where('spdd.service_id', $service_id)
            //             ->get()
            //             ->toArray();
            //         $booking[$key]->availability = $availability ?? [];
            //     }

            //     $star_ratings_res = DB::table('service_reviews')
            //         ->select([
            //             'service_id',
            //             DB::raw("AVG(star) AS stars"),
            //             DB::raw("COUNT(user_id) AS reviewd_by")
            //         ])
            //         ->where('service_id', $service_id)
            //         ->groupBy('service_id')
            //         ->first();
            //     $booking[$key]->stars = $star_ratings_res ? number_format($star_ratings_res->stars, 2, '.', '') : 0;
            //     $booking[$key]->reviewd_by = $star_ratings_res ? $star_ratings_res->reviewd_by : 0;
            //     $booked_seats_qry = DB::table('bookings')->select(['id'])->where(['service_id' => $service_id, 'status' => 1])->get();
            //     $booked_seats = $booked_seats_qry->count();
            //     $booking[$key]->booked_seats = $booked_seats;

                return $this->sendResponse("Request list", $services, 200);
            // } else {
            //     return $this->sendError('No record found', [], 401);
            // }
        }
    }

    public function planForFuture(Request $request)
    {
       // dd($request->all());
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
            'adult' => 'required|numeric',
            'kids' => 'required|numeric',
            'message' => 'required',
            'provider_id' => 'numeric',
            'coupon_applied' => 'required|numeric',
            'desired_date' => 'required|date_format:Y-m-d|after:today'
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $service_detail = DB::table('services')->where(['id' => $request->service_id])->first();
            if (!$service_detail) {
                return $this->sendError('Adventure not found.', [], 401);
            }
            $service_exc_amt = $service_detail->cost_exc;
            $service_inc_amt = $service_detail->cost_inc;
            $total_amt = $service_inc_amt * ($request->adult + $request->kids);
            $service_disc_amt = $total_amt;
            $disc_typ = '';
            $disc_amt = '';
            $flag = false;
            if ($request->promo_code) {
                $promocode = DB::table('promocode')->where(['code' => $request->promo_code])->first();
                
                
                if ($promocode) {
                    // if ($promocode->discount_type == '1') {
                    //     $disc_typ = 1; //Direct amount
                    //     $disc_amt = $promocode->discount_amount;
                    //     $service_disc_amt = $total_amt - $disc_amt;
                    // } elseif ($promocode->discount_type == '2') {
                    //     $disc_typ = 2; // Percentage discount
                    //     $disc_amt = $promocode->discount_amount;
                    //     $service_disc_amt = $total_amt - (($total_amt * $disc_amt) / 100);
                    // }
                    $flag = true;
                }
            }

            if (DB::table('bookings')->insert([
                'user_id' => $request->user_id,
                'service_id' => $request->service_id,
                'provider_id'=> $request->provider_id,
                'adult' => $request->adult,
                'kids' => $request->kids,
                'message' => $request->message,
                'future_plan' => 1,
                'booking_date' => $request->desired_date,
                'currency' => $service_detail->currency,
                'coupon_applied' => $flag,
                'unit_amount' => $request->amount,
                'total_amount' => $request->final_amount,
                'discounted_amount' => $request->discount_amount,
                
                //  'unit_amount' => $service_inc_amt,
                // 'total_amount' => $total_amt,
                // 'discounted_amount' => $service_disc_amt,
                'created_at' => date('Y-m-d H:i:s'),
            ])) {
                $booking_id = DB::getPdo()->lastInsertId();
                $booking_data = DB::table('bookings')->select(['*','id as booking_id' ])->where(['id' => $booking_id])->first();
                if ($flag) {
                    DB::table('promocode_users')->insert([
                            'booking_id' => $booking_id,
                            'user_id' => $request->user_id,
                            'service_id' => $request->service_id,
                            'promocode_id' => $promocode->id,
                            'promocode' => $promocode->code,
                            'disc_type' => $promocode->discount_type,
                            'disc_amt' => $disc_amt,
                            'service_amt_befor_disc' => $total_amt,
                            'service_amt_after_disc' => $service_disc_amt,
                            'created_at' => date('Y-m-d H:i:s'),
                        ]);
                }
                $providerNoti = array(
                    'sender_id' => '1',
                    'user_id' => $request->provider_id,
                    'title' => 'Booking',
                    'message' => 'Booking request shared by a client, please validation health conditions and details before approving/declining the request!',
                    'notification_type' => '2',
                );
                DB::table('notifications')->insert($providerNoti);
                $notiData = array(
                'sender_id' => '1',
                'user_id' => $request->user_id,
                'title' => 'Booking',
                'message' => 'Your booking has been submitted',
                'notification_type' => '2',

            );
            DB::table('notifications')->insert($notiData);
                return $this->sendResponse('Request has been sent successfull.', $booking_data, 200);
            } else {
                return $this->sendError('Something went wrong', [], 401);
            }
        }
    }

    // public function cancelrequest(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'user_id' => 'required|numeric',
    //         'service_id' => 'required|numeric',
    //         'id' => 'required|numeric'

    //     ]);
    //     if ($validator->fails()) {
    //         $validation = array();
    //         foreach ($validator->messages()->getMessages() as $field_name => $messages) {
    //             $validation[$field_name] = $messages[0];
    //         }
    //         return $this->sendError(implode(',', array_values($validation)), [], 401);
    //     } else {
    //         $user_id    = $request->post('user_id');
    //         $service_id = $request->post('service_id');
    //         $id         = $request->post('id');
    //         $user_res = DB::select('select * from bookings where user_id ="' . $user_id . '" AND  service_id = "' . $service_id . '" AND  id = "' . $id . '" AND status !=2');
    //         if ($user_res) {
    //             DB::update('update bookings set status = 2 where user_id ="' . $user_id . '" AND  service_id = "' . $service_id . '" AND  id = "' . $id . '"');
    //             $arrayres = $this->sendResponse('Booking has been Cancelled successfully.', [], 200);
    //             return $arrayres;
    //         } else {
    //             return $this->sendError('Service not found or Alredy Deleted', [], 422);
    //         }
    //     }
    // }

    public function getBanners(Request $request){
     
      
       
        $bannerData = DB::table('service_offers')
       ->where('country_id',$request->country_id)
       
       ->where('status','1')
       ->get();
       //dd($bannerData);
       
         return $this->sendResponse('Record found successfull.', $bannerData, 200);
        return $this->sendResponse(config('constants.DATA_FOUND'), $bannerData, 200);
        // if (!$bannerData) {
        //     return $this->sendResponse(config('constants.DATA_FOUND'), $bannerData, 200);
        // }
        // return $this->sendError('No record found.', [], 404);  
    }
    public function acceptrequest(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'service_id' => 'required|numeric',
            'id' => 'required|numeric'

        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $user_id    = $request->post('user_id');
            $service_id = $request->post('service_id');
            $id         = $request->post('id');
            $user_res = DB::select('select * from bookings where user_id ="' . $user_id . '" AND  service_id = "' . $service_id . '" AND  id = "' . $id . '" AND status !=2');

            if ($user_res) {
                DB::update('update bookings set status = 3 where user_id ="' . $user_id . '" AND  service_id = "' . $service_id . '" AND  id = "' . $id . '"');
                $arrayres = $this->sendResponse('Booking has been Accepted successfully.', [], 200);
                return $arrayres;
            } else {
                return $this->sendError('Service not found or Alredy Accepted', [], 422);
            }
        }
    }

    public function myserviceapi(Request $request)
    {
       // dd($request->all());
        $validator = Validator::make($request->all(), [
            'owner' => 'required',
            'country_id'=> 'required',

        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $url = asset('public') . '/';
        $s_img = asset('public/uploads') . '/';
             $status='1';
            // $services = DB::table('services')
            // ->where('owner', $request->owner)
            //     ->where('country', $request->country_id)
            //     //->where('status', '=', "1")
            //     ->where('deleted_at', NULL)
            //     ->orderBy('id', 'DESC')
            //     ->get();
            $services = DB::table('services as srvc')
                ->select([
                    'srvc.*',
                    'srvc.id as service_id',
                    'srvc.owner as provider_id',
                    'srvc.descreption',
                    'srvc.service_plan',
                    'usr.name as provided_name',
                    DB::raw("CONCAT('" . $url . "',usr.profile_image) AS provider_profile"),
                    DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
                    'scat.category as service_category',
                    'ssec.sector as service_sector',
                    'styp.type as service_type',
                    'slvl.level as service_level',
                    'cntri.country',
                    'rgn.region',
                    'cntri.currency as currency',
                    'srvc.cost_inc as including_gerea_and_other_taxes',
                    'srvc.cost_exc as excluding_gerea_and_other_taxes'
                ])
                ->join('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
                ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
                ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
                ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')

                ->leftJoin('durations as dur', 'dur.id', '=', 'srvc.duration')
                ->where([
                   // 'srvc.owner' => $request->owner,
                    'srvc.country' => $request->country_id,
                    'srvc.deleted_at' => NULL,
                ])
                // ->where([
                //     'srvc.deleted_at' => NULL,
                //   // 'srvc.status' => '1',
                //   // 'srvc.status' => '0',
                // ])
                ->whereIn('srvc.status', ['1','0'])
                ->orderBy('srvc.id',  'DESC')
                ->get();

//dd($services);
            // $serviceactivities = array();
            // $servicesname = array();
            // $countryname = array();
            // $servicesname1 = array();
            foreach ($services as $key => $val) {
              // dd($val);
              $providerData = DB::table('users')->where(['id' => $val->owner])->first();
              $providerData = DB::table('users')->where(['id' => $val->owner])->first();
                $images = DB::table('service_images')
                    ->where('service_id', $val->id)
                    ->get();
                $services[$key]->image_url = $images;
                 $aimedforData = DB::table('service_service_for as ssfor')
                    ->join('aimed as sfor', 'ssfor.sfor_id', '=', 'sfor.id')
                    ->select('sfor.*', 'ssfor.service_id')
                    ->where('ssfor.service_id', $val->id)
                    ->get();
                 $services[$key]->aimed_for = $aimedforData;
                 $services[$key]->provided_name = $providerData->name;
                // $serviceac = DB::table('service_activities')->where('service_id', $val->id)->get();
                // $serviceactivities['activities'] = $serviceac;

                // $serviceservicefor = DB::table('service_service_for')->where('service_id', $val->id)->get();
                // $serviceactivities['service_for'] = $serviceservicefor;
                // $dependencies = DB::table('service_dependencies')->where('service_id', $val->id)->get();
                // $serviceactivities['dependency'] = $dependencies;
                
                // $reviews = DB::table('service_reviews')->where('service_id', $val->id)->get();
                // $serviceactivities['service_reviews'] = $reviews;

                // $countries = DB::table('countries')->where('id', $val->country)->first();
                // $serviceactivities['countries'] = $countries;

                // $regions = DB::table('regions')->where('id', $val->region)->first();
                // $serviceactivities['regions'] = $regions;
                // $categories = DB::table('service_categories')->where('id', $val->service_category)->first();
                // $serviceactivities['categories'] = $categories;

                // $sectors = DB::table('service_sectors')->where('id', $val->service_sector)->first();
                // $serviceactivities['sectors'] = $sectors;

                // $type = DB::table('service_types')->where('id', $val->service_type)->first();
                // $serviceactivities['type'] = $type;

                // $service_levels = DB::table('service_levels')->where('id', $val->service_level)->first();
                // $serviceactivities['service_levels'] = $service_levels;
                // $serviceprogra = DB::table('service_programs')->where('service_id', $val->id)->get();
                // $serviceactivities['service_programs'] = $serviceprogra;
                // if ($val->status == '0') {
                //     $status = 'Pending';
                // } else if ($val->status == '1') {
                //     $status = 'approval';
                // } else {
                //     $status == 'Rejected';
                // }
                $url = asset('public');
                $serviceuser = DB::table('users')->where('id', $val->owner)->first();
                $services[$key]->id = $val->id;
                $services[$key]->adventure_name = $val->adventure_name;
                $services[$key]->provider_id = $val->owner;
                $services[$key]->status = $val->status;
                $services[$key]->cost_incclude = $val->cost_inc;
                $services[$key]->cost_exclude = $val->cost_exc;
                $services[$key]->currency = $val->currency;
                $services[$key]->service_plan = $val->service_plan;
                $services[$key]->available_seats = $val->available_seats;
                $services[$key]->specific_address = $val->specific_address;
                $services[$key]->duration = $val->duration;
                $services[$key]->start_date = $val->start_date;
                $services[$key]->end_date = $val->end_date;
                $services[$key]->write_information = $val->write_information;
                $services[$key]->terms_conditions = $val->terms_conditions;
                $services[$key]->pre_requisites = $val->pre_requisites;
                $services[$key]->minimum_requirements = $val->minimum_requirements;
                $services[$key]->descreption = $val->descreption;
               // $services[$key]->provider_image = $url . $serviceuser->profile_image;
                if ($val->service_plan == '1') {
                    $availability = DB::table('service_plan_day_date as spdd')
                        ->select(['spdd.id', 'wkd.day'])
                        ->join('weekdays as wkd', 'wkd.id', '=', 'spdd.day')
                        ->where('spdd.service_id', $val->id)
                        ->get()
                        ->toArray();
                    $services[$key]->availability = $availability ?? [];
                } else {
                    //dd("Hello Here");
                     $services[$key]->availability = array(
                        // 'start_date'=>$val->start_date,
                        // 'end_date'=>$val->end_date
                    );;
                    
                }
                //$servicesname['status'] = $status;
//dd($servicesname);
                // $servicesname1[] = array_merge(
                //     $servicesname,
                //     $serviceactivities,
                // );
            }

            return $this->sendResponse('Services data found successfully', $services, 200);
        }
    }
    public function hillclimblingdelete(Request $request)
    {
        $customerdata_delete = Service::where('id', $request->id)->delete();
        return $this->sendResponse('Deleted Successfully!', 200);
    }

    public function getCountries(Request $request)
    {
        $countriesData = DB::table('countries')->select(['*'])->get()->toArray();
        if ($countriesData) {
            return $this->sendResponse("Request list", $countriesData, 200);
        } else {
            return $this->sendError('No record found', [], 401);
        }
    }
    public function servicesImage(Request $request){
        $validator = Validator::make($request->all(), [
                    'service_id' => 'required|numeric',
                    'banner' => 'required|image|mimes:jpeg,png,jpg|max:2048'
                ]);
        if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
                return $this->sendError(implode(',', array_values($validation)), [], 401);
                $flag = false;
            }else{



            if ($request->hasFile('banner')) {
                $banner = $request->file('banner');
                $file = $request->file('banner');
                $filename = 'services-' . time() . '.' . $file->getClientOriginalExtension();
                $filepath = $file->move('public/uploads/services/', $filename);
                //$filepaths =$file->move('public/uploads/services/thumbs/', $filename);
                $banner_data = array(
                                'service_id' => $request->service_id,
                                'is_default' => date('Y-m-d') == 0 ? 1 : 0,
                                'image_url' => 'services/'.$filename,
                                'thumbnail' => 'services/' . $filename
                            );
                DB::table('service_images')->insert($banner_data);
                return $this->sendResponse('Images uploaded Successfully!', 200);
            }
            dd('uploaded');

                //$banner_data = [];
                if ($request->file('banners')) {
                    $banner = $request->file('banners');
                   
                  // dd($banner);
                    $banner->type = $banner->getClientMimeType();
                    $file_info = $this->getExtensionSize((array) $banner);
                    if (!in_array($file_info['ext'], $this->allowed_mime())) {
                        $data['validation'] = ['banners' => 'All file must be jpeg,jpg,png.'];
                    } else if ($file_info['size'] > 2024) {
                        $data['validation'] = ['banners' => 'All file size must be 2 MB maximum'];
                    } 
                    else {
                        $msg = config('constants.BANNER_ADDED');
                        if ($banner) {
                            $filename = time() . '-' . date('Y-m-d') . '.jpg';
                            $basepath = "public/uploads/services/thumbs/";
                            if (!is_dir($basepath)) {
                                mkdir($basepath, 0777, true);
                            }
                            $filepath = Storage::disk('public')->putFileAs('services', $banner, $filename);
                            $this->resize_crop_image($this->image_path() . '/' . $filepath, $this->image_path() . '/services/thumbs/' . $filename);
                            $banner_data = array(
                                'service_id' => $request->service_id,
                                'is_default' => date('Y-m-d') == 0 ? 1 : 0,
                                'image_url' => $filepath,
                                'thumbnail' => 'services/thumbs/' . $filename
                            );
                            DB::table('service_images')->insert($banner_data);
            }
        }
        
        return $this->sendResponse('Images uploaded Successfully!', 200);
    } 
    
    return $this->sendResponse('Something went wrong. Please try with images', 422);
    }
}
public function getExtensionSize($file)
    {
        $type = $file['type'];
        $ext_diff = explode('/', $type);
        return ['ext' => $ext_diff[1], 'size' => $file['type']];
    }

    public function create_service(Request $request)
    {
        // dd($request->all());
        if ($request->post()) {
            if ($request->service_plan == 1) {
                $validator = Validator::make($request->all(), [
                    'customer_id' => 'required|numeric',
                   // 'banner' => 'required'
                ]);
            } else {
                $validator = Validator::make($request->all(), [
                    'customer_id' => 'required|numeric',
                   // 'banner' => 'required'
                ]);
            }
            $flag = true;
            if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
                return $this->sendError(implode(',', array_values($validation)), [], 401);
                $flag = false;
            } elseif (1 == 1) {
                $validation = array();
                $gathering_date = $request->gathering_date;
                $start_time     = $request->gathering_start_time;
                $end_time       = $request->gathering_end_time;
                if ($flag == true) {
                    $adventure_exist = DB::table('services')
                        ->where('adventure_name', $request->adventure_name)
                        ->where('owner', $request->customer_id)
                        ->get();
                    if (!$adventure_exist->isEmpty()) {
                        return $this->sendError('Adventure name already taken for selected owner', [], 401);
                    } else {
                        $service = new Service();
                        $service->owner = $request->customer_id;
                        $service->adventure_name = $request->adventure_name;
                        $service->geo_location = $request->geo_location;
                        $service->country = $request->country;
                        $service->region = $request->region;
                        $service->service_sector = $request->service_sector;
                        $service->service_category = $request->service_category;
                        $service->service_type = $request->service_type;
                        $service->service_level = $request->service_level;
                        $service->duration = $request->duration;
                        $service->available_seats = $request->available_seats;
                        // $service->start_date = date('Y-m-d', strtotime($request->start_date));
                        // $service->end_date = date('Y-m-d', strtotime($request->end_date));
                        $service->start_date = $request->start_date;
                        $service->end_date = $request->end_date;
                        $service->write_information = $request->write_information;
                        $service->specific_address = $request->specific_address;
                        $service->service_plan = $request->service_plan;
                        $service->cost_inc = $request->cost_inc;
                        $service->cost_exc = $request->cost_exc;
                        $service->currency = $request->currency;
                        $service->descreption = $request->write_information;
                        $service->pre_requisites = $request->pre_requisites;
                        $service->minimum_requirements = $request->minimum_requirements;
                        $service->terms_conditions = $request->terms_conditions;
                        $service->recommended = 1;
                         if ($service->save()) {
                            $service_id = $service->id;
                            $banner_data = [];
                            if ($request->file('banner')) {
                                if (count($request->file('banner'))) {

                                    foreach ($request->file('banner') as $key => $banner) {
                                        $file = $banner;
                                        $filename = 'services-'.$key.'-' . time() . '.' . $file->getClientOriginalExtension();
                                        $filepath = $file->move('public/uploads/services/', $filename);
                                        $banner_data[] = array(
                                            'service_id' => $service_id,
                                            'is_default' => $key == 0 ? 1 : 0,
                                            'image_url' => 'services/'.$filename,
                                            'thumbnail' => 'services/' . $filename
                                        );
                                    }
                                   // dd($banner_data);
                                    DB::table('service_images')->insert($banner_data);
                                }
                                
                                
                            //    if (count($request->file('banner'))) {
                            //    DB::table('service_images')->where('service_id', '=', $service_id)->delete();
                            //     foreach ($request->file('banner') as $key => $banner) {

                            //         $banner->type = $banner->getClientMimeType();
                            //         $file_info = $this->getExtensionSize((array) $banner);
                            //         if (!in_array($file_info['ext'], $this->allowed_mime())) {
                            //             $data['validation'] = ['banners' => 'All file must be jpeg,jpg,png.'];
                            //         } else if ($file_info['size'] > 2024) {
                            //             $data['validation'] = ['banners' => 'All file size must be 2 MB maximum'];
                            //         } else {
                            //             $msg = config('constants.BANNER_ADDED');
                            //             if ($banner) {
                            //                 $filename = time() . '-' . $key . '.jpg';
                            //                 $basepath = "public/uploads/services/thumbs/";
                            //                 if (!is_dir($basepath)) {
                            //                     mkdir($basepath, 0777, true);
                            //                 }
                            //                 $filepath = Storage::disk('public')->putFileAs('services', $banner, $filename);
                            //                 $this->resize_crop_image($this->image_path() . '/' . $filepath, $this->image_path() . '/services/thumbs/' . $filename); 
                            //                 $banner_data[] = array(
                            //                     'service_id' => $service_id,
                            //                     'is_default' => $key == 0 ? 1 : 0,
                            //                     'image_url' => $filepath,
                            //                     'thumbnail' => 'services/thumbs/' . $filename
                            //                 );
                            //             }
                            //         }
                            //     }

                            //     DB::table('service_images')->insert($banner_data);
                            // } 
                        }
                            $ssfor = array();
                            if (isset($request->service_for)) {
                                DB::table('service_service_for')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->service_for);
                                foreach ($myArray as $sfor) {
                                    $ssfor[] = array(
                                        'service_id' => $service_id,
                                        'sfor_id' => $sfor
                                    );
                                }
                                DB::table('service_service_for')->insert($ssfor);
                            }
                            $sdep = [];
                            if (isset($request->dependency)) {
                                DB::table('service_dependencies')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->dependency);
                                foreach ($myArray as $dep) {
                                    if ($dep != "") {
                                        $sdep[] = array('service_id' => $service_id, 'dependency_id' => $dep);
                                    }
                                }
                                DB::table('service_dependencies')->insert($sdep);
                            }
                            $activitiess = [];
                            if (isset($request->activities)) {
                                DB::table('service_activities')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->activities);
                                foreach ($myArray as $act) {
                                    $activitiess[] = array(
                                        'service_id' => $service_id,
                                        'activity_id' => $act
                                    );
                                }
                                DB::table('service_activities')->insert($activitiess);
                            }
                            $serv_programs = [];
                            if (count($request->schedule_title)) {
                                $s_title = $request->schedule_title;
                                $g_date = $request->gathering_date;
                                $g_stime = $request->gathering_start_time;
                                $g_etime = $request->gathering_end_time;
                                $p_desc = $request->program_description;
                                DB::table('service_programs')->where('service_id', '=', $service_id)->delete();
                                foreach ($request->schedule_title as $key => $act) {
                                    $serv_programs[] = array(
                                        'service_id' => $service_id,
                                        'title' => $s_title[$key],
                                        'start_datetime' => $g_date[$key] . ' ' . $g_stime[$key] . ':00',
                                        'end_datetime' => $g_date[$key] . ' ' . $g_etime[$key] . ':00',
                                        'description' => $p_desc[$key]
                                    );
                                }
                                DB::table('service_programs')->insert($serv_programs);
                            }
                            if ($request->service_plan == 1) {
                                $spd_data = [];
                                DB::table('service_plan_day_date')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->service_plan_days);
                                foreach ($myArray as $spd) {
                                    $spd_data[] = array(
                                        'service_id' => $service_id,
                                        'day' => $spd
                                    );
                                }
                                DB::table('service_plan_day_date')->insert($spd_data);
                            }
                            if ($request->service_plan == 2) {
                                $pd_data = [];
                                DB::table('service_plan_day_date')->where('service_id', '=', $service_id)->delete();
                                foreach (explode(',', $request->particular_date) as $p_date) {
                                    $pd_data[] = array(
                                        'service_id' => $service_id,
                                        'date' => date('Y-m-d', strtotime($p_date))
                                    );
                                }
                                DB::table('service_plan_day_date')->insert($pd_data);
                            }
                            $service = Service::find($service_id);
                            $notiData=array(
                                'sender_id'=>'1',
                                'user_id'=>$request->customer_id,
                                'title'=>'Activities',
                                'message'=>'Your activity has been created successfully ',
                                'notification_type'=>'1',
                                
                                );
                                DB::table('notifications')->insert($notiData);
                            
                            return $this->sendResponse('Service Created Successfully!', $service, 200);
                            return $this->sendResponse('Service Created Successfully!', 200);
                        } else {
                            return $this->sendResponse('Something went wrong. Please try again', 422);
                        }
                    }
                }
            }
        }
    }
    public function bookingDelete(Request $request){
        $booking = DB::table('bookings')->where('id',$request->booking_id)->get();
        if(!$booking->isEmpty()){
            DB::table('bookings')->where('id',$request->booking_id)->delete(); 
            return $this->sendResponse('Booking deleted Successfully!', 200);
        } else {
            return $this->sendResponse('Something went wrong. Please try again', 422);
        }
    }

    public function editService(Request $request)
    {
        //dd($request->all());
        if ($request->post()) {
            if ($request->service_plan == 1) {
                $validator = Validator::make($request->all(), [
                    'customer_id' => 'required|numeric',
                    'banners' => 'required'
                ]);
            } else {
                $validator = Validator::make($request->all(), [
                    'customer_id' => 'required|numeric',
                    'banners' => 'required'
                ]);
            }
            $flag = true;
            if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
                return $this->sendError(implode(',', array_values($validation)), [], 401);
                $flag = false;
            } elseif (1 == 1) {
                $validation = array();
                $gathering_date = $request->gathering_date;
                $start_time = $request->gathering_start_time;
                $end_time = $request->gathering_end_time;
                if ($flag == true) {
                    $adventure_exist = DB::table('services')
                        ->where('adventure_name', $request->adventure_name)
                        ->where('owner', $request->customer_id)
                        ->get();
                    if (!$adventure_exist->isEmpty()) {
                        return $this->sendError('Adventure name already taken for selected owner', [], 401);
                    } else {
                        //$service = new Service();
                        $service = Service::find($request->service_id);
                        //dd($service);
                        $service->owner = $request->customer_id;
                        $service->adventure_name = $request->adventure_name;
                        $service->geo_location = $request->geo_location;
                        $service->country = $request->country;
                        $service->region = $request->region;
                        $service->service_sector = $request->service_sector;
                        $service->service_category = $request->service_category;
                        $service->service_type = $request->service_type;
                        $service->service_level = $request->service_level;
                        $service->duration = $request->duration;
                        $service->available_seats = $request->available_seats;
                        // $service->start_date = date('Y-m-d', strtotime($request->start_date));
                        // $service->end_date = date('Y-m-d', strtotime($request->end_date));
                        $service->start_date = $request->start_date;
                        $service->end_date = $request->end_date;
                        $service->write_information = $request->write_information;
                        $service->specific_address = $request->specific_address;
                        $service->service_plan = $request->service_plan;
                        $service->cost_inc = $request->cost_inc;
                        $service->cost_exc = $request->cost_exc;
                        $service->currency = $request->currency;
                        $service->pre_requisites = $request->pre_requisites;
                        $service->minimum_requirements = $request->minimum_requirements;
                        $service->terms_conditions = $request->terms_conditions;
                        $service->recommended = 1;
                        if ($service->update()) {
                            $service_id = $service->id;
                            $banner_data = [];
                            if (count($request->file('banners'))) {
                                DB::table('service_images')->where('service_id', '=', $service_id)->delete();
                                foreach ($request->file('banners') as $key => $banner) {

                                    $banner->type = $banner->getClientMimeType();
                                    $file_info = $this->getExtensionSize((array) $banner);
                                    if (!in_array($file_info['ext'], $this->allowed_mime())) {
                                        $data['validation'] = ['banners' => 'All file must be jpeg,jpg,png.'];
                                    } else if ($file_info['size'] > 2024) {
                                        $data['validation'] = ['banners' => 'All file size must be 2 MB maximum'];
                                    } else {
                                        $msg = config('constants.BANNER_ADDED');
                                        if ($banner) {
                                            $filename = time() . '-' . $key . '.jpg';
                                            $basepath = "public/uploads/services/thumbs/";
                                            if (!is_dir($basepath)) {
                                                mkdir($basepath, 0777, true);
                                            }
                                            $filepath = Storage::disk('public')->putFileAs('services', $banner, $filename);
                                            $this->resize_crop_image($this->image_path() . '/' . $filepath, $this->image_path() . '/services/thumbs/' . $filename);
                                            $banner_data[] = array(
                                                'service_id' => $service_id,
                                                'is_default' => $key == 0 ? 1 : 0,
                                                'image_url' => $filepath,
                                                'thumbnail' => 'services/thumbs/' . $filename
                                            );
                                        }
                                    }
                                }
                                DB::table('service_images')->insert($banner_data);
                            }
                            $ssfor = array();
                            if (isset($request->service_for)) {
                                DB::table('service_service_for')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->service_for);
                                foreach ($myArray as $sfor) {
                                    $ssfor[] = array(
                                        'service_id' => $service_id,
                                        'sfor_id' => $sfor
                                    );
                                }
                                DB::table('service_service_for')->insert($ssfor);
                            }
                            $sdep = [];
                            if (isset($request->dependency)) {
                                DB::table('service_dependencies')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->dependency);
                                foreach ($myArray as $dep) {
                                    if ($dep != "") {
                                        $sdep[] = array('service_id' => $service_id, 'dependency_id' => $dep);
                                    }
                                }
                                DB::table('service_dependencies')->insert($sdep);
                            }
                            $activitiess = [];
                            if (isset($request->activities)) {
                                DB::table('service_activities')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->activities);
                                foreach ($myArray as $act) {
                                    $activitiess[] = array(
                                        'service_id' => $service_id,
                                        'activity_id' => $act
                                    );
                                }
                                DB::table('service_activities')->insert($activitiess);
                            }
                            $serv_programs = [];
                            if (count($request->schedule_title)) {
                                $s_title = $request->schedule_title;
                                $g_date = $request->gathering_date;
                                $g_stime = $request->gathering_start_time;
                                $g_etime = $request->gathering_end_time;
                                $p_desc = $request->program_description;
                                DB::table('service_programs')->where('service_id', '=', $service_id)->delete();
                                foreach ($request->schedule_title as $key => $act) {
                                    $serv_programs[] = array(
                                        'service_id' => $service_id,
                                        'title' => $s_title[$key],
                                        'start_datetime' => $g_date[$key] . ' ' . $g_stime[$key] . ':00',
                                        'end_datetime' => $g_date[$key] . ' ' . $g_etime[$key] . ':00',
                                        'description' => $p_desc[$key]
                                    );
                                }
                                DB::table('service_programs')->insert($serv_programs);
                            }
                            if ($request->service_plan == 1) {
                                $spd_data = [];
                                DB::table('service_plan_day_date')->where('service_id', '=', $service_id)->delete();
                                $myArray = explode(',', $request->service_plan_days);
                                foreach ($myArray as $spd) {
                                    $spd_data[] = array(
                                        'service_id' => $service_id,
                                        'day' => $spd
                                    );
                                }
                                DB::table('service_plan_day_date')->insert($spd_data);
                            }
                            if ($request->service_plan == 2) {
                                $pd_data = [];
                                DB::table('service_plan_day_date')->where('service_id', '=', $service_id)->delete();
                                foreach (explode(',', $request->particular_date) as $p_date) {
                                    $pd_data[] = array(
                                        'service_id' => $service_id,
                                        'date' => date('Y-m-d', strtotime($p_date))
                                    );
                                }
                                DB::table('service_plan_day_date')->insert($pd_data);
                            }
                            return $this->sendResponse('Service Created Successfully!', 200);
                        } else {
                            return $this->sendResponse('Something went wrong. Please try again', 422);
                        }
                    }
                }
            }
        }
    }
    //You have made no changes to save.
    public function getservice_sector(Request $request)
    {
        $sectors = Service_sector::get();
        return $this->sendResponse($sectors, 200);
    }
    public function allowed_mime()
    {
        return ['jpeg', 'jpg', 'png'];
    }
    public function getservice_categories(Request $request)
    {
        $categories = Service_categorie::get();
        return $this->sendResponse($categories, 200);
    }
    public function getservice_type(Request $request)
    {
        $service = Service_type::get();
        return $this->sendResponse($service, 200);
    }
    public function getservice_level(Request $request)
    {
        $service = Service_level::get();
        return $this->sendResponse($service, 200);
    }
    public function get_regions(Request $request, $id)
    {
        if ($id) {
            $service = DB::table('regions')->select('id', 'region')->where('country_id', $id)->get();
        } else {
            $service = DB::table('regions')->select('id', 'region')->get();
        }

        return $this->sendResponse($service, 200);
    }
    public function getReviews(Request $request)
    {
        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'service_id' => 'required',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $services = DB::table('service_reviews as rev')
                ->select(['rev.*'])
                ->where('rev.service_id', $request->service_id)
                ->get();

            if (count($services) >0) {
                $review_count = count($services);
                $totalrating=0;
                foreach ($services as $key => $ser) {
                   // dd($ser);
                    $service_id = $ser->service_id;
                    $userData = DB::table('users as u')
                        ->select(['u.*','ctri.country'])
                        ->join('countries as ctri', 'u.country_id', '=', 'ctri.id')
                        ->where('u.id', $ser->user_id)->get();
                    $services[$key]->userData = $userData ?? [];
                    $services[$key]->count = count($services);
                    if ($request->user_id >= 1) {
                        $is_liked = DB::table('service_likes')
                            ->select(['service_id'])
                            ->where('user_id', $request->user_id)
                            ->first();
                        $services[$key]->is_liked = isset($is_liked->service_id) ? 1 : 0;
                    }
                    $totalrating += $ser->star;
                }
               $avarage_rating= $totalrating/$review_count;
               $data=array(
                   'avarage_rating'=>$avarage_rating,
                   'review'=>$services
                   );

                if ($review_count >0) {
                    return $this->sendResponse('Data found successfully', $data, 200);
                }else{
                       return $this->sendError('Data not found', [], 400);
                }
               
            }
           return $this->sendError('Data not found', [], 400);
        }
    }
    
     public function getLocationReviews(Request $request)
    {
        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'location_id' => 'required',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $services = DB::table('location_reviews')
            ->where('location_id', $request->location_id)
                ->get();

            if (count($services) >0) {
                $review_count = count($services);
                $totalrating=0;
                foreach ($services as $key => $ser) {
                   // dd($ser);
                    $location_id = $ser->location_id;
                    $userData = DB::table('users as u')
                        ->select(['u.*','ctri.country'])
                        ->join('countries as ctri', 'u.country_id', '=', 'ctri.id')
                        ->where('u.id', $ser->user_id)->get();
                    $services[$key]->userData = $userData ?? [];
                    $services[$key]->count = count($services);
                    if ($request->user_id >= 1) {
                        $is_liked = DB::table('service_likes')
                            ->select(['service_id'])
                            ->where('user_id', $request->user_id)
                            ->first();
                        $services[$key]->is_liked = isset($is_liked->service_id) ? 1 : 0;
                    }
                    $totalrating += $ser->rating;
                }
               $avarage_rating= $totalrating/$review_count;
               $data=array(
                   'avarage_rating'=>$avarage_rating,
                   'review'=>$services
                   );

                if ($review_count >0) {
                    return $this->sendResponse('Data found successfully', $data, 200);
                }else{
                       return $this->sendError('Data not found', [], 400);
                }
               
            }
           return $this->sendError('Data not found', [], 400);
        }
    }

    public function getDuration()
    {
        $duration = Duration::get();
        return $this->sendResponse($duration, 200);
    }

    public function getActivityIncludes()
    {
        $activities = Activities::get();
        return $this->sendResponse($activities, 200);
    }

    public function getParticipants(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'service_id' => 'required',
        ]);
        if ($validator->fails()) {
            $validation = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $validation[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($validation)), [], 401);
        } else {
            $services = DB::table('bookings as bkng')
                ->select([
                    'bkng.id as booking_id',
                    'bkng.user_id as booking_user',
                    'srvc.owner as provider_id',
                    'usr.profile_image as provider_profile',
                    'usr.email',
                    'usr.nationality_id',
                    'srvc.owner as owner_id',
                    'srvc.id as service_id',
                    'client.health_conditions',
                    'cntri.country',
                    'rgn.region',
                    'srvc.adventure_name',
                    'usr.name as provider_name',
                    'client.name as customer',
                    'client.email',
                    'bkng.booking_date as service_date',
                    'bkng.created_at as booked_on',
                    'bkng.adult',
                    'bkng.kids',
                    'bkng.unit_amount as unit_cost',
                    'bkng.total_amount as total_cost',
                    'bkng.discounted_amount as discounted_amount',
                    'bkng.payment_channel as payment_channel',
                    //'pmnt.payment_method as payment_channel',
                    'cntri.currency as currency',
                    'client.dob',
                    'client.height',
                    'client.weight',
                    'bkng.message',
                    'bkng.status as booking_status',
                    'bkng.status',
                    //'bkng.payment_status',
                    'catg.category'
                ])
                ->leftJoin('services as srvc', 'srvc.id', '=', 'bkng.service_id')
                ->leftJoin('service_categories as catg', 'catg.id', '=', 'srvc.service_category')
                ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
                ->leftJoin('regions as rgn', 'rgn.id', '=', 'srvc.region')
                ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
                ->leftJoin('users as client', 'client.id', '=', 'bkng.user_id')
                //->leftJoin('payments as pmnt', 'pmnt.booking_id', '=', 'bkng.id')
                ->where('bkng.service_id', $request->service_id)
                ->orderBy('bkng.id', 'DESC')
                ->get();
            //dd($services);
            if (!$services->isEmpty()) {
                foreach ($services as $key => $service) {
                    //dd($service);
                    $country = DB::table('countries')->where('id', $service->nationality_id)->first();
                    $services[$key]->nationality = $country->short_name;
                    $service_images = DB::table('service_images')->where('service_id', $service->service_id)->get();
                    $services[$key]->service_images = $service_images;
                    $health_condtions = DB::table('health_conditions')
                        ->select([DB::raw("GROUP_CONCAT(name) AS healths")])
                        ->whereIn('id', explode(',', $service->health_conditions))
                        ->first();
                    $services[$key]->health_conditions =  $health_condtions->healths;
                }
                //dd($service);
                if ($services) {
                    return $this->sendResponse("Request list", $services, 200);
                } else {
                    return $this->sendError('No record found', [], 401);
                }
            } else {
                return $this->sendError('No record found', [], 401);
            }
        }
    }
}
