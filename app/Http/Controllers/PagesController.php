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
use Illuminate\Support\MessageBag;
use Session;
use DB;
use Hash;
use Auth;

class PagesController extends MyController
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('role');
    }

    public function termsConditions(Request $request)
    {
        $terms = DB::table('terms_conditions')
            ->get();
        if ($terms->isEmpty()) {
            $terms = [];
        }
        $data['content'] = 'admin.pages.terms_conditions_list';
        return view('layouts.content', compact('data'))
            ->with([
                'terms' => $terms
            ]);
    }

    public function addTermsConditions(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make($request->all(), [
                'title.*' => 'required|string|distinct|min:15|max:200',
                'description.*' => 'required|string|distinct|min:15|max:500',
            ], [], [
                'title.*' => 'title',
                'description.*' => 'description',
            ]);
            if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
            } else {
                $term_data = [];
                foreach ($request->title as $key => $val) {
                    $term_data[] = array(
                        'title' => $request->title[$key],
                        'description' => $request->description[$key]
                    );
                }
                DB::table('terms_conditions')
                    ->truncate();
                if (DB::table('terms_conditions')
                    ->insert($term_data)
                ) {
                    $request->session()->flash('success', 'Record has been added successfully.');
                } else {
                    $request->session()->flash('error', 'Something went wrong. Please try again.');
                }
                return redirect('/terms-conditions/add');
            }
        }
        $terms = DB::table('terms_conditions')
            ->get();
        $data['content'] = 'admin.pages.update_terms_conditions';
        return view('layouts.content', compact('data'))
            ->with([
                'validation' => $validation ?? [],
                'terms' => $terms
            ]);
    }

    public function privacyPolicies(Request $request)
    {
        $terms = DB::table('privacy_policy')
            ->get();
        if ($terms->isEmpty()) {
            $terms = [];
        }
        $data['content'] = 'admin.pages.privacy_policy_list';
        return view('layouts.content', compact('data'))
            ->with([
                'terms' => $terms
            ]);
    }

    public function addPrivacyPolicy(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make($request->all(), [
                'title.*' => 'required|string|distinct|min:15|max:200',
                'description.*' => 'required|string|distinct|min:15|max:500',
            ], [], [
                'title.*' => 'title',
                'description.*' => 'description',
            ]);
            if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
            } else {
                $term_data = [];
                foreach ($request->title as $key => $val) {
                    $term_data[] = array(
                        'title' => $request->title[$key],
                        'description' => $request->description[$key]
                    );
                }
                DB::table('privacy_policy')
                    ->truncate();
                if (DB::table('privacy_policy')->insert($term_data)) {
                    $request->session()->flash('success', 'Record has been added successfully.');
                } else {
                    $request->session()->flash('error', 'Something went wrong. Please try again.');
                }
                return redirect('/privacy-policy/add');
            }
        }
        $terms = DB::table('privacy_policy')->get();
        $data['content'] = 'admin.pages.update_privacy_policies';
        return view('layouts.content', compact('data'))
            ->with([
                'validation' => $validation ?? [],
                'terms' => $terms
            ]);
    }

    public function aboutUs(Request $request)
    {
        $terms = DB::table('about_us')->first();
        $data['content'] = 'admin.pages.about_us_list';
        return view('layouts.content', compact('data'))
            ->with([
                'terms' => $terms
            ]);
    }

    public function addAboutUs(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make($request->all(), [
                'description' => 'required|string|min:15|max:1000',
            ]);
            if ($validator->fails()) {
                $validation = array();
                foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                    $validation[$field_name] = $messages[0];
                }
            } else {
                DB::table('about_us')->truncate();
                if (DB::table('about_us')->insert([
                    'content' => $request->description
                ])) {
                    $request->session()->flash('success', 'Record has been added successfully.');
                } else {
                    $request->session()->flash('error', 'Something went wrong. Please try again.');
                }
                return redirect('/about-us/add');
            }
        }
        $terms = DB::table('about_us')->first();
        $data['content'] = 'admin.pages.update_about_us';
        return view('layouts.content', compact('data'))
            ->with([
                'validation' => $validation ?? [],
                'terms' => $terms
            ]);
    }

    public function transactions()
    {
        $result = DB::table('payments as pmt')
            ->select(['pmt.*', 'usr.name'])
            ->leftJoin('users as usr', 'usr.id', '=', 'pmt.user_id')
            ->get();
        $data['content'] = 'admin.pages.transactions';
        return view('layouts.content', compact('data'))
            ->with([
                'result' => $result
            ]);
    }
}
