<?php
$segment = Request::segment(2);
if (!$segment) {
    $segment = 'vendors';
}
$base_url = URL::to('/');
?>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">Services </h4>
                <ul class="breadcrumb pull-right">
                    <li>
                        <!--<a href="{{URL::to('services/add')}}" class="waves-effect">
                            <img src="{{ asset('/public/images/add_user.png')}}">
                            &nbsp;&nbsp;<span>Create Service</span>
                        </a>-->
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <input type="radio" class="cursor-pointer myservice_types" name="recommended" id="recommended" value="2" <?php
                        if ($segment == 'vendors') {
                            echo 'checked';
                        }
                        ?>  onchange="return window.location.href = '<?php echo $base_url . '/requests/vendors' ?>'" >
                        Partner Requests
                    </div>
                    <div class="col-md-6">
                        <input type="radio" class="cursor-pointer myservice_types" name="recommended" id="recommended" value="1" <?php
                        if ($segment == 'adventures') {
                            echo 'checked';
                        }
                        ?> onchange="return window.location.href = '<?php echo $base_url . '/requests/adventures' ?>'" >
                        Adventure Requests
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <table id="datatable-responsive" class="table table-striped table-bordered" style="border: none;">
                <thead>
                    <tr>
                        <th>Request Id</th>
                        <th>Adventure Name</th>
                        <th>Country/Region</th>
                        <th>Category</th>
                        <th>Level</th>
                        <!--<th>Aimed For</th>-->
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (count($services)) {
                        foreach ($services as $key => $service) {
                            $service_for = DB::table('service_service_for')->where('service_id', $service->id)->first();
                            //dd($service_for);
                            //$role_exist = DB::table('service_for')->where('id', $service->sforid)->get();
                            //dd($role_exist);
                            ?>
                            <tr class = "gradeX">
                                <td>#{{$service->id}}</td>
                                <td>{{$service->adventure_name}}</td>
                                <td>{{$service->country.' / '.$service->region}}</td>
                                <td>{{$service->service_level}}</td>
                                <td>{{$service->service_category}}</td>
                                <!--<td>{{@$service_for->sfor_id}}</td>-->
                                <td>
                                    <ul class="edit_icon action_icons dashboard_icons">
                                        <li><a href="{{URL::to('/service/view/'.$service->id)}}" class="bg-black"><i class="fa fa-eye"></i></a></li>
                                        <li><a href="{{URL::to('/')}}" onclick="return confirm('Are you sure you want to edit this item ?')" class="bg-green"><i class="fa fa-pencil"></i></a></li>
                                        <li><a href="{{URL::to('/service/detele/'.$service->id)}}" onclick="return confirm('Are you sure you want to delete this request ?')" class="bg-red"><i class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <?php
                        }
                    } else {
                        ?>
                        <tr class = "gradeX">
                            <td colspan="7" class="text-center">No request found</td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>