<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MyController;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use App\Models\Countrie;
use Session;
use Response;
use DB;
use Hash;
use Auth;

class UsersController extends MyController
{

  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('role');
  }

  public function vendors(Request $request, $id = null)
  {
    $where = ' 1 ';
    if ($id) {
      $where .= ' && srvc.id = ' . $id;
    }
    //DB::raw("GROUP_CONCAT(sfor.sfor) as aimed_for")
    $services = DB::table('services as srvc')
      ->select([
        'srvc.*',
        'usr.name as provider_name',
        DB::raw("CONCAT(srvc.duration,' Min') AS duration"),
        'scat.category as service_category',
        'ssec.sector as service_sector',
        'styp.type as service_type',
        'slvl.level as service_level',
        'cntri.country',
        'crnci.sign as currency_sign',
        'rgns.region'
      ])
      ->leftJoin('users as usr', 'usr.id', '=', 'srvc.owner')
      ->leftJoin('countries as cntri', 'cntri.id', '=', 'srvc.country')
      ->leftJoin('regions as rgns', 'rgns.id', '=', 'srvc.region')
      ->leftJoin('service_categories as scat', 'scat.id', '=', 'srvc.service_category')
      ->leftJoin('service_sectors as ssec', 'ssec.id', '=', 'srvc.service_sector')
      ->leftJoin('service_types as styp', 'styp.id', '=', 'srvc.service_type')
      ->leftJoin('service_levels as slvl', 'slvl.id', '=', 'srvc.service_level')
      ->leftJoin('currencies as crnci', 'crnci.id', '=', 'srvc.currency')
      ->where([
        'srvc.deleted_at' => NULL,
        'srvc.status' => 0
      ])
      ->whereRaw($where)
      ->orderBy('srvc.id', 'DESC')
      ->get();
    // if (!$services[0]->id) {
    //   $services = [];
    // }
    $data['content'] = 'admin.services.vendor_request';
    return view('layouts.content', compact('data'))
      ->with([
        'services' => $services
      ]);
  }

  public function role_access()
  {
    $data['content'] = 'admin.roleaccess';
    return view('layouts.content', compact('data'))
      ->with([
        'usersdata' => ''
      ]);
  }


  public function save_country_session(Request $request)
  {

    $country_id = $_POST['country'];
    Session::put('country_id', $country_id);
    $arrayVal = $request->checkbox;
    // echo $country_id.'--->'. print_r($arrayVal);die;
    $sort = 0;

    //$validator = Validator::make($request->all(), [

    // 		'role_id' => ['unique:role_assignments'],

    //         ]);


    if (!empty($arrayVal)) {
      foreach ($arrayVal as $Val) {

        $role_exist = DB::table('role_assignments')
          ->where('country_id', $country_id)
          ->where('role_id', $Val)
          ->count();
        if ($role_exist == 0) {

          $datass = array(
            'country_id'        => $country_id,
            'role_id'       => $Val,
            'sort' => $sort,
          );
          $addData = DB::table('role_assignments')->insertGetId($datass);
        }
      }
    }



    return redirect()->back();
  }


  public function get_roles(Request $request)
  {
    //  echo '123';die;

    $country_id = $_POST['country'];
    Session::put('country_id', $country_id);



    return redirect()->back();
  }
}
