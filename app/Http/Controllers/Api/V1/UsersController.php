<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Otp;
use Twilio\Rest\Client;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\MyController;
use Illuminate\Validation\Rule;
use Hash;
use DB;

class UsersController extends MyController
{
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|min:3|max:50|unique:users',
            'mobile_code' => 'required|numeric',
            'mobile' => 'required|numeric',
            'email' => 'required|email:filter|unique:users',
            'nationality' => 'required|numeric',
            'now_in' => 'required|min:3|max:100',
            'dob' => 'required|date_format:Y-m-d',
            'health_conditions' => 'required',
            'height' => 'required',
            'weight' => 'required',
            'password' => 'required|min:5|max:40',
            'user_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($errors)), [], 422);
        } elseif (!$this->checkPasswordStrength($request->password)) {
            return $this->sendError('Validation errors', [
                'password' => 'Password should contain minimum 8 characters with an uppercase letter, a lowercase letter, a number and a special character'
            ], 422);
        } else {
            $msg = 'You have been register successfully.';
            $mobile_number = $request->post('mobile');
            $email = $request->post('email');
            $id = $request->user_id;
            $data = new User();
            $user_exist = $data->where('mobile', $mobile_number)->first();
            if (!empty($user_exist)) {
                if ($user_exist['mobile_verified_at'] == null) {
                    $errors['mobile'] = 'Mobile number is not verified.Please verify mobile first.';
                    return $this->sendError('Validation errors', $errors, 422);
                } elseif ($user_exist->id != $request->user_id) {
                    $errors = 'Mobile number has been taken already.';
                    return $this->sendError($errors, [], 422);
                }
            } else {
                $errors = 'Mobile number not registered.';
                return $this->sendError($errors, [], 422);
            }
            if ($id) {
                $result = $data->find($id);
                if (!empty($result)) {
                    $data = $result;
                    $msg = 'User updated successfully.';
                } else {
                    $msg = 'User not found';
                    return $this->sendError($msg, 'Error', 404);
                }
            }
            $data->name                 = $request->post('username');
            $data->mobile_code          = $request->post('mobile_code');
            $data->mobile               = $request->post('mobile');
            $data->email                = $request->post('email');
            $data->country_id           = $request->post('nationality');
            $data->now_in               = $request->post('now_in');
            $data->dob                  = $request->post('dob');
            $data->health_conditions    = $request->post('health_conditions');
            $data->health_conditions_id = $request->post('health_conditions_id');
            $data->Height               = $request->post('height');
            $data->Weight               = $request->post('weight');
            $data->password             = bcrypt($request->password);
            $data->profile_image        = '';
            $data->save();
            $data['become_partner'] = null;
            return $this->sendResponse($msg, $data, 201);
        }
    }
    public function sendOtp($user_id, $mobile, $type = null)
    {
        $otp_model = new Otp();
        $otp = $otp_model->select([
            'user_id',
            'id',
            'otp',
            'mobile'
        ])
            ->where(array(
                'user_id' => $user_id,
                'status' => 0,
                'mobile' => $mobile
            ))
            ->first();
        if (!empty($otp)) {
            $update = Otp::select(['user_id', 'id', 'otp', 'mobile'])->find($otp->id);
            $otp_model = $update;
        }
        $otp_num = $this->getRandomNumber();
        $otp_model->otp = $otp_num;
        $otp_model->user_id = $user_id;
        $otp_model->mobile = $mobile;
        if ($type == 1) {
            $otp_model->type = 1;
            $msg = 'Your OTP for sign-up is ' . $otp_num;
        } elseif ($type == 3) {
            $otp_model->type = 3;
            $msg = 'Your OTP for login is ' . $otp_num;
        } elseif ($type == 4) {
            $otp_model->type = 4;
            $msg = 'Your OTP for change mobile number is ' . $otp_num;
        } elseif ($type == 5) {
            $otp_model->type = 5;
            $msg = 'Your resent OTP is ' . $otp_num;
        }
        $otp_model->save();
        $this->sendSms($mobile, $msg);
    }
    public function getOtp(Request $request)
    {
        // dd($request->all());
        if (is_numeric($request->mobile)) {
            $validator = Validator::make($request->all(), [
                'mobile' => 'required|numeric'
            ]);
            $field = 'mobile';
        } else {
            $validator = Validator::make(
                $request->all(),
                [
                    'mobile' => 'required|email:filter'
                ],
                [
                    'required' => 'The email field is required.',
                    'email:filter' => 'email must be a valid email address.'
                ],
                [
                    'mobile' => 'email'
                ]
            );
            $field = 'email';
        }
        if ($validator->fails()) {
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($errors)), [], 422);
        }
        $result = User::Select(array(
            'id',
            'users_role',
            'name',
            'mobile_code',
            'mobile',
            'mobile_verified_at',
            'email',
            'email_verified_at',
            'profile_image',
            'status'
        ))
            ->where(array($field => $request->mobile))
            ->where('deleted_at', null)
            ->first();

        if (!empty($result)) {
            $user_id = $result->id;
            $user_mobile = $result->mobile;
            $user_email = $result->email;
            $forgot_password = $request->forgot_password;
            if ($forgot_password) {
                $otp_model = new Otp();
                $otp = $otp_model->select(['user_id', 'id', 'otp'])
                    ->where(array(
                        'user_id' => $user_id,
                        $field => $user_mobile,
                        'status' => 0
                    ))
                    ->first();
                if (!empty($otp)) {
                    $update = Otp::select([
                        'user_id',
                        'id',
                        'otp'
                    ])
                        ->find($otp->id);
                    $otp_model = $update;
                }
                $otp_model->otp = $this->getRandomNumber();
                if ($field == 'mobile') {
                    $otp_model->mobile_code = $request->mobile_code;
                    $otp_model->mobile = $user_mobile;
                } else {
                    $otp_model->otp_on = 2;
                    $otp_model->email = $request->mobile;
                }
                $otp_model->user_id = $user_id;
                $otp_model->type = 2;
                $otp_model->save();
                if ($field == 'mobile') {
                    //$this->sendSms($user_mobile, 'OTP is ' . $otp_model->otp);
                    $this->sendSms_mobile($request->mobile_code, $result->mobile, $otp_model->otp);
                } else {
                    $this->sendEmail(['email' => $request->mobile, 'message' => 'OTP is ' . $otp_model->otp]);
                }
                return $this->sendResponse(config('constants.OTP_SENT'), $otp_model, 200);
            }
            if ($field == 'mobile') {
                if ($result->mobile_verified_at !== null) {
                    return $this->sendResponse(config('constants.MOBILE_ALREADY_VERIFIED'), array($result), 201);
                }
            } elseif ($field == 'email') {
                if ($result->email_verified_at !== null) {
                    return $this->sendResponse(config('constants.EMAIL_VERIFIED'), array($result), 200);
                }
            }
        } else {
            if ($request->forgot_password) {
                if ($field == 'mobile') {
                    return $this->sendError('Mobile number not registered to any account.', [], 422);
                } else {
                    return $this->sendError('Email address not registered to any account.', [], 422);
                }
            }
            if ($field == 'email') {
                $data = new User();
                $data->email = $request->mobile;
                $data->added_from = 1;
                $data->save();
                $user_id = $data->id;
            } else {
                $data = new User();
                $data->mobile_code = $request->mobile_code;
                $data->mobile = $request->post('mobile');
                $data->added_from = 1;
                $data->save();
                $user_id = $data->id;
                $user_mobile = $data->mobile;
            }
        }
        $otp_model = new Otp();
        $otp = $otp_model->select([
            'user_id',
            'id',
            'otp'
        ])
            ->where(array(
                'user_id' => $user_id,
                $field => $request->mobile,
                'status' => 0
            ))
            ->first();

        if (!empty($otp)) {
            $update = Otp::select([
                'user_id',
                'id',
                'otp'
            ])
                ->find($otp->id);
            $otp_model = $update;
        }

        $otp_model->otp = $this->getRandomNumber();

        if ($field == 'mobile') {
            $otp_model->mobile_code = $request->mobile_code;
            $otp_model->mobile = $request->mobile;
        } else {
            $otp_model->otp_on = 2;
            $otp_model->email = $request->mobile;
        }
        $otp_model->user_id = $user_id;
        $otp_model->save();
        if ($field == 'mobile') {
            $sentSms = $this->sendSms_mobile(
                $request->mobile_code,
                $request->mobile,
                $otp_model->otp
            );
            //$sentSms = $this->sendSms($user_mobile, 'OTP is ' . $otp_model->otp, $request->mobile_code);
            if ($sentSms) {
                return $this->sendResponse(config('constants.OTP_SENT'), $otp_model, 200);
            }
            return $this->sendError(config('constants.OTP_SENT'), $otp_model, 200);
        } else {
            $this->sendEmail(['email' => $request->mobile, 'message' => 'OTP is ' . $otp_model->otp]);
        }
        return $this->sendResponse(config('constants.OTP_SENT'), $otp_model, 200);
    }
    public function verifyOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'otp' => 'required|numeric|digits:4'
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', array_values($errors)), [], 422);
        }
        if ($request->forgot_password) {
            $where = array(
                'type' => 2,
                'user_id' => $request->user_id,
                'status' => 0,
                'otp' => $request->otp
            );
        } else {
            $where = array(
                'type' => 1,
                'user_id' => $request->user_id,
                'status' => 0,
                'otp' => $request->otp
            );
        }
        $otp = Otp::select([
            'user_id',
            'id',
            'otp',
            'otp_on',
            'updated_at'
        ])
            ->where($where)
            ->first();
        if (!empty($otp)) {
            if ($otp->otp_on == 2) {
                $otp_on = 'email';
                if (time() - strtotime($otp->updated_at) > 300) {
                    return $this->sendError(config('constants.OTP_EXPIRED'), [], 422);
                }
            } elseif ($otp->otp_on == 1) {
                $otp_on = 'mobile';
                if (time() - strtotime($otp->updated_at) > 120) {
                    return $this->sendError(config('constants.OTP_EXPIRED'), [], 422);
                }
            }
            if ($request->forgot_password) {
                $update = Otp::select([
                    'user_id',
                    'id',
                    'otp'
                ])
                    ->find($otp->id);
                $update->status = 1;
                $update->save();
                $otp_id = $update->id;
            } else {
                $update = Otp::find($otp->id);
                $update->delete();
                DB::table('otp')
                    ->whereRaw(
                        'status=1 && DATE_FORMAT(created_at, "%Y-%m-%d") < CURDATE()'
                    )
                    ->delete();
            }

            $user = User::select([
                'id',
                'id as user_id',
                'name',
                'email',
                'profile_image',
                'mobile',
                'mobile_verified_at',
                'status'
            ])
                ->find($request->user_id);
            if (!$request->forgot_password) {
                if ($otp_on == 'email') {
                    $user->email_verified_at = date('Y-m-d H:i:s');
                } elseif ($otp_on == 'mobile') {
                    $user->mobile_verified_at = date('Y-m-d H:i:s');
                }
                $user->status = 1;
                $user->save();
            }
            unset($user->id);
            if ($request->forgot_password) {
                $user->otp_id = $otp_id;
            }
            return $this->sendResponse(config('constants.OTP_VERIFIED'), $user, 200);
        } else {
            return $this->sendResponse(config('constants.INCORRECT_OTP'), config('constants.INCORRECT_OTP'), 201);
        }
    }
    public function login(Request $request)
    {
        $url = asset('public');
        $validator = Validator::make($request->all(), [
            'email' => 'required|string',
            'password' => 'required|min:5|max:40'
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('constants.NOT_VALID'), $errors, 422);
        }
        $fieldType = filter_var($request->email, FILTER_VALIDATE_EMAIL) ? 'email' : 'name';
        request()->merge([$fieldType => $request->email]);
        $credentials = request([$fieldType, 'password']);
        if (!Auth::attempt($credentials)) {
            $error = array('error_msg' => config('constants.INCORRECT_PASSWORD'));
            return $this->sendError(config('constants.INVALID_EMAIL_AND_PASSWORD'), [], 401);
        }
        $where = array($fieldType => $request->email);
        $result = User::select([
            '*',
            DB::raw("CONCAT('+',mobile_code) AS mobile_code"),
            DB::raw("CONCAT('" . $url . "',profile_image) AS profile_image")
        ])
            ->where($where)
            ->first();
        // dd($result->id);
        $health = $result->health_conditions;
        //echo $health; die;
        $health_condtions = DB::table('health_conditions')->select([DB::raw("GROUP_CONCAT(name) AS healths")])
            ->whereIn('id', explode(',', $health))
            ->first();
        $become_partner = DB::table('become_partner')->select('*')
            ->where('user_id', $result->id)
            ->first();
        //dd($become_partner);
        $result['health_conditions_id'] = $health;
        $result['health_conditions'] = $health_condtions->healths;
        $result['become_partner'] = $become_partner;
        if ($result->status == 0) {
            return $this->sendError('Account Deactivated.Please contact to admin.', [], 401, 'account_deactivated');
        }
        return $this->sendResponse(config('constants.LOGIN'), $result);
    }
    /**
     * Show the profile for the given user.
     * 

     * @param  int  $id

     * @return View

     */

    public function userProfile(Request $request)
    {
        $data =  DB::table('users')->select('*')->where('id', $request->user_id)->first();
        $partnerData =  DB::table('become_partner')
            ->select('*')
            ->where('user_id', $request->user_id)
            ->first();
        $data->become_partner = $partnerData;
        if (!empty($data)) {
            $msg = "Data found successfully!";
            return $this->sendResponse($msg, $data, 200);
        }
        return $this->sendError('Data not found.', [], 404);
    }
    public function serviceProviderProfile(Request $request)
    {
        //$data = User::where(['id' => $request->id, 'users_role' => 2, 'deleted_at' => null])->first();
        $url = asset('public/profile_image/');
        $result = DB::table('services as servi')
            ->select([
                'servi.*',
                DB::raw("CONCAT('" . $url . "/',servi.image) AS image"),
                DB::raw("CONCAT('" . $url . "/',servi.favourite_image) AS favourite_image"),
                'usr.name as name',
                DB::raw("CONCAT('" . $url . "/',usr.profile_image) AS profile_image")
            ])
            ->leftJoin('users as usr', 'usr.id', '=', 'servi.owner')
            ->where(['owner' => $request->id])
            ->get();
        $new_data = array();
        foreach ($result as $key => $value) {
            $data =  DB::table('service_reviews')
                ->select('star as rating')
                ->where(['service_id' => $value->id])
                ->first();
            if ($data != null) {
                $rating = $data->rating;
            } else {
                $rating = 0;
            }
            $new_data[] = array(
                "id" => $value->id,
                "rating" => $rating,
                "owner" => $value->owner,
                "adventure_name" => $value->adventure_name,
                "country" => $value->country,
                "region" => $value->region,
                "service_sector" => $value->service_sector,
                "service_category" => $value->service_category,
                "service_type" => $value->service_type,
                "service_level" => $value->service_level,
                "duration" => $value->duration,
                "available_seats" => $value->available_seats,
                "start_date" => $value->start_date,
                "end_date" => $value->end_date,
                "write_information" => $value->write_information,
                "service_plan" => $value->service_plan,
                "availability" => $value->availability,
                "geo_location" => $value->geo_location,
                "specific_address" => $value->specific_address,
                "cost_inc" => $value->cost_inc,
                "cost_exc" => $value->cost_exc,
                "currency" => $value->currency,
                "points" => $value->points,
                "pre_requisites" => $value->pre_requisites,
                "minimum_requirements" => $value->minimum_requirements,
                "terms_conditions" => $value->terms_conditions,
                "recommended" => $value->recommended,
                "status" => $value->status,
                "image" => $url . $value->image,
                "descreption" => $value->descreption,
                "favourite_image" => $url . $value->favourite_image,
                "created_at" => $value->created_at,
                "updated_at" => $value->updated_at,
                "deleted_at" => $value->deleted_at,
                "name" => $value->name,
                "profile_image" => $url . $value->profile_image
            );
        }
        if (!empty($result)) {
            return $this->sendResponse(config('custom.DATA_FOUND'), $new_data, 200);
        }
        return $this->sendError('Data not found.', [], 404);
    }
    public function delete($id)
    {
        $delete = User::destroy(array($id));
        if ($delete) {
            return $this->sendResponse($delete, config('custom.USER_DELETED'));
        }
        return $this->sendError(config('custom.DATA_NOT_FOUND'));
    }
    public function profile_update(Request $request, $id)
    {
        $banner_rule = 'required|image|mimes:jpeg,jpg,png|max:2048';
        $email_rule = 'required|email:filter|unique:users';
        $result = array();
        if ($id) {
            $result = User::find($id);
            if (!empty($result)) {
                $banner_rule = 'nullable|mimes:jpeg,jpg,png|max:2048';
            }
            if ($result['email'] == $request->post('email')) {
                $email_rule = 'required|email:filter';
            }
        }
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|min:3|max:50',
            'last_name' => 'required|min:3|max:50',
            'email' => $email_rule,
            'profile_picture' => $banner_rule,
            'facebook' => 'nullable|url',
            'instagram' => 'nullable|url',
            'twitter' => 'nullable|url'
        ], [
            'url' => 'Please enter valid :attribute profile url.',
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('custom.NOT_VALID'), $errors);
        } else {
            $msg = config('custom.USER_ADDED');
            if ($request->file('profile_picture')) {
                if (isset($result['profile_picture']) && $result['profile_picture'] != '') {
                    Storage::disk('public')->delete($result['profile_picture']);
                }
                $extension = $request->file('profile_picture')->extension();
                $filepath = Storage::disk('public')
                    ->putFileAs(
                        'profile_pictures',
                        $request->file('profile_picture'),
                        time() . '.' . $extension
                    );
            }
            $data = new User();
            if ($id) {
                $result = $data->find($id);
                if (!empty($result)) {
                    $data = $result;
                    $msg = config('custom.USER_UPDATED');
                } else {
                    $msg = config('custom.DATA_NOT_FOUND');
                    return $this->sendError($msg);
                }
            }

            $data->first_name = $request->post('first_name');
            $data->last_name = $request->post('last_name');
            $data->email = $request->post('email');
            $data->facebook = $request->post('facebook', '');
            $data->instagram = $request->post('instagram', '');
            $data->twitter = $request->post('twitter', '');
            if ($request->file('profile_picture')) {
                $data->profile_picture = $filepath;
            }
            $data->save();
            return $this->sendResponse($msg, $data);
        }
    }
    public function changeMobile(Request $request)
    {
        if ($request->post('otp_for_update_mobile_number')) {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required|numeric',
                'old_mobile' => 'required|numeric|digits:10',
                'new_mobile_number' => 'required|numeric|digits:10',
                'otp_for_update_mobile_number' => 'required|numeric|digits:6',
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required|numeric',
                'old_mobile' => 'required|numeric|digits:10',
                'new_mobile_number' => 'required|numeric|digits:10'
            ]);
        }
        $errors = array();
        if ($validator->fails()) {
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('custom.NOT_VALID'), $errors);
        } else {
            $msg = config('custom.MOBILE_UPDATED');
            $user_id = $request->post('user_id');
            $old_mobile = $request->post('old_mobile');
            $mobile_number = $request->post('new_mobile_number');
            if ($request->post('otp_for_update_mobile_number')) {
                $otp = $request->post('otp_for_update_mobile_number');
                $otp_qry = Otp::select(['user_id', 'id', 'otp'])
                    ->where(array('user_id' => $user_id, 'status' => 0, 'otp' => $otp, 'mobile' => $mobile_number))
                    ->first();
                if (!empty($otp_qry)) {
                    $update = Otp::select(['user_id', 'id', 'otp'])->find($otp_qry->id);
                    $update->status = 1;
                    $update->save();
                    $user = User::select([
                        'id',
                        'first_name',
                        'last_name',
                        'email',
                        'profile_picture',
                        'mobile',
                        'mobile_verified_at',
                        'status'
                    ])
                        ->find($user_id);
                    $user->mobile = $mobile_number;
                    $user->mobile_verified_at = date('Y-m-d H:i:s');
                    $user->status = 1;
                    $user->save();
                    return $this->sendResponse(config('custom.OTP_VERIFIED'), $user);
                } else {
                    return $this->sendError(config('custom.INCORRECT_OTP'), array(
                        'otp_for_update_mobile_number' => config('custom.INCORRECT_OTP')
                    ), 200);
                }
            }
            if ($old_mobile == $mobile_number) {
                $errors['new_mobile_number'] = 'Please enter new mobile number.';
                return $this->sendError(config('custom.NOT_VALID'), $errors, 200);
            }
            $data = new User();
            $user_exist = $data->where(array(
                'mobile' => $mobile_number
            ))
                ->first();
            if (!empty($user_exist)) {
                if ($user_exist['id'] != $user_id) {
                    $errors['new_mobile_number'] = 'This mobile has been already taken.';
                    return $this->sendError(config('custom.NOT_VALID'), $errors, 200);
                }
            } else {
                $this->sendOtp($user_id, $mobile_number, 4);
                $msg = 'OTP has been sent.';
                return $this->sendResponse($msg, array('id' => $user_id, 'mobile' => $mobile_number));
            }
        }
    }
    public function createNewPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp_id' => 'required|numeric',
            'user_id' => 'required|numeric',
            'password' => 'required|min:5|max:40|confirmed',
            'password_confirmation' => 'required|min:5|max:40'
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('custom.NOT_VALID'), $errors);
        } elseif (!$this->checkPasswordStrength($request->password)) {
            return $this->sendError('Validation errors', ['password' => 'Password should contain minimum 8 characters with an uppercase letter, a lowercase letter, a number and a special character'], 422);
        } else {
            $check_otp_verify = Otp::where(array(
                'id' => $request->otp_id,
                'user_id' => $request->user_id,
                'type' => 2,
                'status' => 1
            ))
                ->first();

            if (empty($check_otp_verify)) {
                return $this->sendError('Please verify your email or mobile number first for create new password.', [], 401);
            }
            $user_id = $request->post('user_id');
            $user_res = User::where(array(
                'id' => $user_id
            ))
                ->get();
            if (!empty($user_res)) {
                $u_dt = new User();
                $result = $u_dt->find($user_id);
                $result->password = bcrypt($request->password);
                if ($result->save()) {
                    $otp_modal = Otp::find($request->otp_id);
                    $otp_modal->delete();
                    return $this->sendResponse('Password has been updated successfully.', [], 200);
                } else {
                    return $this->sendError('Something went wrong. Please try again.', array('error' => 'Something went wrong. Please try again.'), 404);
                }
            }
            return $this->sendError('User not found. Please try again.', array('error' => 'Something went wrong. Please try again.'), 404);
        }
    }
    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'old_password' => 'required|min:5|max:40',
            'password' => 'required|min:5|max:40|confirmed',
            'password_confirmation' => 'required|min:5|max:40'
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', $errors), [], 422);
        } else {
            $user_id = $request->post('user_id');
            $user_res = User::where(array('id' => $user_id))->get();
            if (!Hash::check($request->post('old_password'), $user_res[0]['password'], [])) {
                return $this->sendError('Please enter correct old password.', [], 422);
            } elseif (!$this->checkPasswordStrength($request->password)) {
                return $this->sendError('Validation errors', [
                    'password' => 'Password should contain minimum 8 characters with an uppercase letter, a lowercase letter, a number and a special character'
                ], 422);
            } else {
                $u_data = User::find($user_id);
                $u_data->password = bcrypt($request->password);
                if ($u_data->save()) {
                    return $this->sendResponse('Password has been updated successfully.', [], 200);
                } else {
                    return $this->sendError('Something went wrong. Please try again.', array(
                        'error' => 'Something went wrong. Please try again.', 422
                    ));
                }
                return $this->sendError('Something went wrong. Please try again.', array(
                    'error' => 'Something went wrong. Please try again.'
                ), 422);
            }
        }
    }
    public function updateHealthConditions(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
            'health_conditions' => 'required',
            'height' => 'required',
            'weight' => 'required',
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('constants.NOT_VALID'), $errors, 422);
        } else {
            $user_id = $request->post('user_id');
            $user_res = User::where(array('id' => $user_id))->first();
            if ($user_res) {
                $u_data = User::find($user_id);
                $u_data->health_conditions = $request->post('health_conditions');
                $u_data->Height = $request->post('height');
                $u_data->Weight = $request->post('weight');
                if ($u_data->save()) {
                    return $this->sendResponse(
                        'Record has been updated successfully.',
                        [
                            'user_id' => $user_id,
                            'Height' => $u_data->Height,
                            'Weight' => $u_data->Weight,
                            'Health_conditions' => $u_data->health_conditions
                        ],
                        200
                    );
                } else {
                    return $this->sendError('Something went wrong. Please try again.', array('error' => 'Something went wrong. Please try again.', 422));
                }
                return $this->sendError('Something went wrong. Please try again.', array('error' => 'Something went wrong. Please try again.'), 422);
            } else {
                return $this->sendError('User not found', [], 422);
            }
        }
    }
    public function updateProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'name' => 'required',
            'mobile_code' => 'required',
            'mobile' => 'required',
            'email' => 'required',
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', $errors), [], 422);
        } else {
            $user_id = $request->post('user_id');
            $user_res = User::where(array('id' => $user_id))->first();
            if (!$user_res) {
                return $this->sendError('User not found', [], 422);
            }
            $mobile_exist = User::where('id', '!=', $request->user_id)->where(['mobile' => $request->mobile])->first();
            if ($mobile_exist) {
                $errors = 'Mobile number has been taken already.';
                return $this->sendError($errors, [], 422);
            }
            $email_exist = User::where('id', '!=', $request->user_id)->where(['email' => $request->email])->first();
            if ($email_exist) {
                $errors = 'Email address has been taken already.';
                return $this->sendError($errors, [], 422);
            }
            $name_exist = User::where('id', '!=', $request->user_id)
                ->where(['name' => $request->name])
                ->first();
            if ($name_exist) {
                $errors = 'Name has been taken already.';
                return $this->sendError($errors, [], 422);
            }
            $user_id = $request->post('user_id');
            $user_res = User::where(array('id' => $user_id))->first();
            if ($user_res) {
                $u_data = User::find($user_id);
                $u_data->name = $request->post('name');
                $u_data->mobile_code = $request->post('mobile_code');
                $u_data->mobile = $request->post('mobile');
                $u_data->email = $request->post('email');
                if ($u_data->save()) {
                    return $this->sendResponse('Record has been updated successfully.', $request->post(), 200);
                } else {
                    return $this->sendError('Something went wrong. Please try again.', array('error' => 'Something went wrong. Please try again.', 422));
                }
                return $this->sendError('Something went wrong. Please try again.', array('error' => 'Something went wrong. Please try again.'), 422);
            } else {
                return $this->sendError('User not found', [], 422);
            }
        }
    }
    public function profilePhotoUpdate(Request $request)
    {
        $id = $request->user_id;
        $banner_rule = 'required|image|mimes:jpeg,jpg,png|max:2048';
        $result = array();
        if ($id) {
            $result = User::find($id);
            if (!empty($result)) {
                $banner_rule = 'nullable|mimes:jpeg,jpg,png|max:2048';
            }
        }
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'profile_picture' => $banner_rule
        ], [
            'url' => 'Please enter valid :attribute profile url.',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Please try again.', 204);
        } else {
            if ($request->file('profile_picture')) {
                $file = $request->file('profile_picture');
                $fileName = $file->getClientOriginalName();
                $destinationPath = public_path() . '/profile_image/';
                $file->move($destinationPath, $fileName);
            }
            $data = User::find($id);
            if ($request->file('profile_picture')) {
                $data->profile_image = 'profile_image/' . $fileName;
            }
            $data->save();
            return $this->sendResponse('Image uploaded', 200);
        }
    }
    public function getNotificationList(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|numeric',
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(implode(',', $errors), [], 422);
        } else {
            $url = asset('public/profile_image/');
            $result = DB::table('notifications as noti')
                ->select(['noti.*', DB::raw("CONCAT('" . $url . "/',usr.profile_image) AS sender_image")])
                ->leftJoin('users as usr', 'usr.id', '=', 'noti.sender_id')
                ->where(['user_id' => $request->user_id])
                ->orderBy('id', 'DESC')
                ->get();
            if ($result->isEmpty()) {
                return $this->sendError('Data not found.', [], 404);
            }
            return $this->sendResponse(config('custom.DATA_FOUND'), $result, 200);
        }
    }
    public function createnotification(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'message' => 'required',
            'title' => 'required'
        ]);
        if ($validator->fails()) {
            $errors = array();
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $errors[$field_name] = $messages[0];
            }
            return $this->sendError(config('custom.NOT_VALID'), $errors);
        } else {
            $wallet_data = array(
                'user_id'    => $request->post('user_id'),
                'sender_id'    => $request->post('user_id'),
                'title'      => $request->post('title'),
                'message'    => $request->post('message'),
                'created_at' => date('Y-m-d H:i:s')
            );
            DB::table('notifications')->insert($wallet_data);
            $responseData = $this->sendResponse('Notification Created Successfully.', [], 200);
            return $responseData;
        }
    }
    public function becomepartner(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'packages_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendResponse('error', $validator->errors(), 404);
            return response()->json(['error' => $validator->errors()], 404);
        }
        try {
            $become_partnerData = DB::table('become_partner')
                ->where('user_id', $request->user_id)
                ->orderBy('id', 'DESC')
                ->first();
            if ($become_partnerData) {
                return $this->sendResponse('Your request allready send', [], 404);
            } else {
                // if ($request->file('cr_copy')) {
                //     $extension = $request->file('cr_copy')->extension();
                //     $filepath = Storage::disk('public')

                //         ->putFileAs('profile_pictures', $request->file('cr_copy'), time() . '.' . $extension);

                // } else {

                //     $filepath = null;

                // }
                if ($file = $request->file('cr_copy')) {
                    $destinationPath = base_path('public/crCopy/');
                    $cr_copy = uniqid('file') . "-" . $file->getClientOriginalName();
                    $path = $file->move($destinationPath, $cr_copy);
                } else {
                    $cr_copy = "";
                }
                if ($request->packages_id != '0') {
                    $packageData = DB::table('packages')
                        ->where('id', $request->packages_id)
                        ->orderBy('id', 'DESC')
                        ->first();
                    $day = $packageData->days - 1;
                    $start_date = date("Y-m-d H:i:s");
                    $enddate = date('Y-m-d H:i:s', strtotime("+" . $day . " day", strtotime(date("Y-m-d H:i:s"))));
                } else {
                    $day = 0;
                    $start_date = Null;
                    $enddate = Null;
                }
                DB::table('users')
                    ->where('id', $request->user_id)
                    ->update(array(
                        'users_role' => '2',
                    ));
                $insertData = array(
                    'user_id' => $request->user_id,
                    'company_name' => $request->company_name,
                    'address' => $request->address,
                    'location' => $request->location,
                    'description' => $request->description,
                    'license' => $request->license,
                    'cr_name' => $request->cr_name,
                    'cr_number' => $request->cr_number,
                    'cr_copy' => $cr_copy,
                    'debit_card' => $request->debit_card,
                    'visa_card' => $request->visa_card,
                    'payon_arrival' => $request->payon_arrival,
                    'paypal' => $request->paypal,
                    'bankname' => $request->bankname,
                    'account_holdername' => $request->account_holdername,
                    'account_number' => $request->account_number,
                    'is_online' => $request->is_online,
                    'packages_id' => $request->packages_id,
                    'is_wiretransfer' => $request->is_wiretransfer,
                    'start_date' => $start_date,
                    'end_date' => $enddate,
                    'created_at' => date("Y-m-d H:i:s")
                );
                $like = DB::table('become_partner')->insert($insertData);
                if ($like) {
                    return $this->sendResponse('Data Inserted Successfully', [], 200);
                } else {
                    return $this->sendResponse('Somethingwent wrong', [], 404);
                }
            }
        } catch (\Exception $e) {

            return $this->sendResponse($e->getMessage(), [], 404);
        }
    }
    public function updateSubscription(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'packages_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendResponse('error', $validator->errors(), 404);
            return response()->json(['error' => $validator->errors()], 404);
        }
        try {
            if ($request->payment_status == '1') {
                $partnerData = DB::table('become_partner')
                    ->where('user_id', $request->user_id)
                    ->first();
                $packageData = DB::table('packages')
                    ->where('id', $request->packages_id)
                    ->orderBy('id', 'DESC')
                    ->first();
                $cost = $packageData->cost;
                $day = $packageData->days - 1;
                $end_date = date('Y-m-d H:i:s', strtotime("+" . $day . " day", strtotime(date("Y-m-d H:i:s"))));
                if ($request->payment_amount == '0') {
                    if ($partnerData->is_free_used == '0') {
                        $is_free_used = '1';
                        $updatetData = array(
                            'packages_id' => $request->packages_id,
                            'start_date' => date("Y-m-d H:i:s"),
                            'end_date' => $end_date,
                            'is_free_used' => $is_free_used
                        );
                        $like = DB::table('become_partner')
                            ->where('user_id', $request->user_id)
                            ->update($updatetData);

                        $history = DB::table('subscription_plan_history')
                            ->insert([
                                'user_id' => $request->user_id,
                                'package_id' => $request->packages_id,
                                'order_id' => $request->order_id,
                                'payment_type' => $request->payment_type,
                                'payment_status' => $request->payment_status,
                                'payment_amount' => $request->payment_amount,
                                'created_at' => date("Y-m-d H:i:s"),
                                'updated_at' => date("Y-m-d H:i:s")
                            ]);

                        $like = DB::table('become_partner')
                            ->where('user_id', $request->user_id)
                            ->get();

                        if ($like) {
                            return $this->sendResponse('Data updated Successfully', $like, 200);
                        } else {
                            return $this->sendResponse('Somethingwent wrong', [], 404);
                        }
                    } else {

                        return $this->sendResponse('You allready used free subscription', [], 200);
                    }
                } else {
                    DB::table('subscription_plan_history')
                        ->insert([
                            'user_id' => $request->user_id,
                            'package_id' => $request->packages_id,
                            'order_id' => $request->order_id,
                            'payment_type' => $request->payment_type,
                            'payment_status' => $request->payment_status,
                            'payment_amount' => $request->payment_amount,
                            'created_at' => date("Y-m-d H:i:s"),
                            'updated_at' => date("Y-m-d H:i:s")
                        ]);
                    $like = DB::table('become_partner')
                        ->where('user_id', $request->user_id)
                        ->get();
                    if ($like) {
                        return $this->sendResponse('Record inserted - Subscription not updated', $like, 200);
                    } else {
                        return $this->sendResponse('Somethingwent wrong', [], 404);
                    }
                }
            } else {
                return $this->sendResponse(
                    'Payment status 0',
                    [],
                    200
                );
            }
        } catch (\Exception $e) {
            return $this->sendResponse($e->getMessage(), [], 404);
        }
    }
    public function sendSms_mobile($country_code, $phone, $otp)
    {
        require base_path('public/twilio-php-main/src/Twilio/autoload.php');
        $twilio = new Client(env('SID'), env('TWILIO_TOKEN'));
        $message = $twilio->messages->create(
            $country_code . $phone,
            array(
                "messagingServiceSid" => env('TWILIO_FROM'),
                //"from" =>"Duradrive",
                "body" => 'Otp code from Adventure is:' . $otp
            )
        );
    }
    public function remainingDays(Request $request)

    {
    }
}
