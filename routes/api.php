<?php

use Illuminate\Http\Request;

/*
  |--------------------------------------------------------------------------
  | API Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register API routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | is assigned the "api" middleware group. Enjoy building your API!
  |
 */

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});
Route::prefix('v1')->group(function () {
    Route::get('/get_countries', 'Api\V1\CountriesController@get_all');
    Route::get('/get_cities/{id}', 'Api\V1\CountriesController@getCities')->where(['id' => '[0-9]+']);
    Route::get('/get_regions/{id}', 'Api\V1\CountriesController@getRegions')->where(['id' => '[0-9]+']);
    Route::get('/get_healths', 'Api\V1\HealthConditionsController@get_all');
    Route::any('/sendSms_mobile', 'Api\V1\UsersController@sendSms_mobile');
    Route::post('/register', 'Api\V1\UsersController@add');
    Route::post('/get_otp', 'Api\V1\UsersController@getOtp');
    Route::post('/verify_otp', 'Api\V1\UsersController@verifyOtp');
    Route::post('/login', 'Api\V1\UsersController@login');
    Route::post('/create_forgot_password', 'Api\V1\UsersController@createNewPassword');
    Route::post('/change_password', 'Api\V1\UsersController@changePassword');
    Route::post('/become_partner', 'Api\V1\UsersController@becomepartner');
    Route::post('/update_subscription', 'Api\V1\UsersController@updateSubscription');
    Route::post('/remaining_days', 'Api\V1\UsersController@remainingDays'); 
    Route::post('/get_profile', 'Api\V1\UsersController@userProfile');
    Route::get('/serviceProviderProfile/{id?}', 'Api\V1\UsersController@serviceProviderProfile')->where(['id' => '[0-9]+']);

    Route::get('/banners/{id?}', 'Api\V1\BannersController@get')->where(['id' => '[0-9]+']);
    Route::get('/services/{id?}', 'Api\V1\ServicesController@get')->where(['id' => '[0-9]+']);
    Route::get('/get_allservices', 'Api\V1\ServicesController@get_all');
    Route::get('/categories/{id?}', 'Api\V1\CategoriesController@get')->where(['id' => '[0-9]+']);
    Route::get('/filter_modal_data', 'Api\V1\FiltersController@get');
    Route::post('/like_service', 'Api\V1\ServicesController@likeService');
    Route::post('/myServicereview', 'Api\V1\ServicesController@myServicereview');
    Route::post('/add_review', 'Api\V1\ServicesController@addReview');
    Route::post('/create_service', 'Api\V1\ServicesController@create_service');
    Route::get('/get_service_sector', 'Api\V1\ServicesController@getservice_sector');
    Route::get('/get_service_categories', 'Api\V1\ServicesController@getservice_categories');
    Route::get('/get_service_type', 'Api\V1\ServicesController@getservice_type');
    Route::get('/get_service_level', 'Api\V1\ServicesController@getservice_level');
    Route::get('/get_regions', 'Api\V1\ServicesController@get_regions');

    Route::post('/myserviceapi', 'Api\V1\ServicesController@myserviceapi');
    Route::post('/hillclimblingdelete', 'Api\V1\ServicesController@hillclimblingdelete');

    Route::post('/book_service', 'Api\V1\ServicesController@bookService');
    Route::post('/cancelrequest', 'Api\V1\ServicesController@cancelrequest');
    Route::post('/acceptrequest', 'Api\V1\ServicesController@acceptrequest');
    Route::post('/check_promocode', 'Api\V1\ServicesController@checkPromoCode');
    Route::post('/update_payments', 'Api\V1\ServicesController@updatePayment');
    Route::any('/get_favourite', 'Api\V1\ServicesController@getFavourite');
    Route::post('/add_favourite', 'Api\V1\ServicesController@addFavourite');
    Route::post('/remove_favourite', 'Api\V1\ServicesController@removeFavourite');
    Route::post('/get_wallet_points', 'Api\V1\ServicesController@getPoints');
    Route::post('/contact_us', 'Api\V1\ServicesController@contactUs');
    Route::get('/get_contact_us_pupose', 'Api\V1\ServicesController@getPurpose');
    Route::get('/get_requests', 'Api\V1\ServicesController@getRequests');
    Route::get('/about-us', 'Api\V1\FiltersController@aboutUs');
    Route::get('/terms-conditions', 'Api\V1\FiltersController@termsConditions');
    Route::get('/privacy-policy', 'Api\V1\FiltersController@privacyPolicy');
    Route::post('/update_health_conditions', 'Api\V1\UsersController@updateHealthConditions');
    Route::get('/get_packages', 'Api\V1\VendorsController@getPackages');
    Route::post('/update_profile', 'Api\V1\UsersController@updateProfile');
    Route::post('/profilePhotoUpdate', 'Api\V1\UsersController@profilePhotoUpdate');
    Route::get('/scheduled_session', 'Api\V1\ServicesController@scheduledSession');
    Route::post('/future_plan', 'Api\V1\ServicesController@planForFuture');
    Route::post('/get_notification_list', 'Api\V1\UsersController@getNotificationList');
    Route::post('/createnotification', 'Api\V1\UsersController@createnotification');
});

Route::group(['middleware' => 'api_auth:api'], function () {
    Route::post('join_invite', 'Api\V1\UsersController@joinInvite');
    Route::get('profile/{id}', 'Api\V1\UsersController@get')->where(['id' => '[0-9]+']);
    Route::post('profile_update/{id}', 'Api\V1\UsersController@profile_update')->where(['id' => '[0-9]+']);
    Route::post('change_password', 'Api\V1\UsersController@changePassword')->where(['id' => '[0-9]+']);
    Route::get('logout', 'Api\V1\UsersController@logout');
    Route::get('banners/{id?}', 'Api\V1\BannersController@get')->where(['role' => '[0-9]+', 'id' => '[0-9]+']);
    Route::post('tournaments/register', 'Api\V1\TournamentsController@register');
    Route::post('tournaments/wallet', 'Api\V1\TournamentsController@wallet');
    Route::get('user_transactions/{id}', 'Api\V1\TournamentsController@myTransactions')->where(['id' => '[0-9]+']);
    Route::get('user_earnings/{id}', 'Api\V1\TournamentsController@myEarnings')->where(['id' => '[0-9]+']);
    Route::get('user_matches/{id}', 'Api\V1\TournamentsController@myMatches')->where(['id' => '[0-9]+']);
    Route::get('tournaments/poolPrice', 'Api\V1\TournamentsController@pricePool');
    Route::post('tournaments/update_payment', 'Api\V1\TournamentsController@paymentUpdate');
    Route::post('tournaments/add_player', 'Api\V1\TournamentsController@addPlayer');
    Route::post('join_invitation', 'Api\V1\TournamentsController@joinInvitation');
    Route::post('change_mobile', 'Api\V1\UsersController@changeMobile');
});
