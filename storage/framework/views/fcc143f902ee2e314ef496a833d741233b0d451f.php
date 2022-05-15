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
                        <a href="<?php echo e(URL::to('services/add')); ?>" class="waves-effect">
                            <img src="<?php echo e(asset('/public/images/add_user.png')); ?>">
                            &nbsp;&nbsp;<span>Create Service</span>
                        </a>
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
                        <th>Aimed For</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (count($services)) {
                        foreach ($services as $key => $service) {
                            ?>
                            <tr class = "gradeX">
                                <td>#<?php echo e($service->id); ?></td>
                                <td><?php echo e($service->adventure_name); ?></td>
                                <td><?php echo e($service->country.' / '.$service->region); ?></td>
                                <td><?php echo e($service->service_level); ?></td>
                                <td><?php echo e($service->service_category); ?></td>
                                <td><?php echo e($service->aimed_for); ?></td>
                                <td>
                                    <ul class="edit_icon action_icons dashboard_icons">
                                        <li><a href="<?php echo e(URL::to('/service/view/'.$service->id)); ?>" class="bg-black"><i class="fa fa-eye"></i></a></li>
                                        <li><a href="<?php echo e(URL::to('/')); ?>" onclick="return confirm('Are you sure you want to edit this item ?')" class="bg-green"><i class="fa fa-pencil"></i></a></li>
                                        <li><a href="<?php echo e(URL::to('/service/detele/'.$service->id)); ?>" onclick="return confirm('Are you sure you want to delete this request ?')" class="bg-red"><i class="fa fa-trash"></i></a></li>
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
</div><?php /**PATH /home/arknewtech/public_html/adventuresClub/resources/views/admin/services/vendor_request.blade.php ENDPATH**/ ?>