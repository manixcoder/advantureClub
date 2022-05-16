<div class="content">
    <div class="container-fluid">
        <!-- Page-Title -->
        <?php $curr_tab = Request::segment(1) ?? 'countries'; ?>
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">Locations </h4>
                <ol class="breadcrumb pull-right">
                    <?php if ($curr_tab == 'countries' || $curr_tab == '') { ?>
                        <li>
                            <a href="<?php echo e(URL::to('countries/add')); ?>" class="waves-effect">
                                <img src="<?php echo e(asset('/public/images/add_user.png')); ?>">&nbsp;&nbsp;
                                <span>Create Country</span>
                            </a>
                        <?php } elseif ($curr_tab == 'cities') { ?>
                        <li>
                            <a href="<?php echo e(URL::to('cities/add')); ?>" class="waves-effect">
                                <img src="<?php echo e(asset('/public/images/add_user.png')); ?>">&nbsp;&nbsp;
                                <span>Create City</span>
                            </a>
                        <?php } elseif ($curr_tab == 'regions') { ?>
                        <li>
                            <a href="<?php echo e(URL::to('regions/add')); ?>" class="waves-effect">
                                <img src="<?php echo e(asset('/public/images/add_user.png')); ?>">&nbsp;&nbsp;
                                <span>Create Region</span>
                            </a>
                        <?php } ?>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th width="75px">Location ID</th>
                            <th>Country</th>
                            <th>Regions</th>
                            <th>City</th>
                            <th>Created On</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        foreach ($cities as $data) {
                            $country = DB::table('countries')->select(['*'])->where('id', $data->country_id)->first();
                            $regions = DB::table('regions')->select(['*'])->where('id', $data->region_id)->first();
                        ?>
                            <tr>
                                <td>#<?php echo e($i); ?></td>
                                <td><?php echo e($country->country); ?></td>
                                <td><?php echo e($regions->region); ?></td>
                                <td><?php echo e($data->city); ?></td>
                                <td><?php echo e(date('d M Y', strtotime($data->created_at))); ?></td>
                                <td class="actions">
                                    <a href="<?php echo e(URL::to('cities/delete', $data->id)); ?>" class="on-default remove-row" onclick="return confirm('Are you sure you want to delete this item?');" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><span class="badge bg-red location_icons"><i class="fas fa-trash"></i></span></a>
                                </td>
                            </tr>
                        <?php
                            $i++;
                        } ?>
                    </tbody>
                </table>
            </div>
            <?php echo $__env->yieldContent('', View::make('admin.locations.location_sidebar')); ?>
        </div>
    </div>
</div><?php /**PATH /home/advent12/public_html/admin/resources/views/admin/locations/city_list.blade.php ENDPATH**/ ?>