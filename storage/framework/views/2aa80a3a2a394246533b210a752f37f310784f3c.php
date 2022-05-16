<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">Subscription Packages </h4>
                <ul class="breadcrumb pull-right">
                    <li>
                        <a href="<?php echo e(URL::to('sub-packages/add')); ?>" class="waves-effect">
                            <img src="<?php echo e(asset('/public/images/add_user.png')); ?>">
                            &nbsp;&nbsp;<span>Create package</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap datatable-package" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Package ID</th>
                            <th>Package Name</th>
                            <th>Includes</th>
                            <th>Not Includes</th>                           
                            <th>Cost</th>                           
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($packages)) {
                            foreach ($packages as $pkg) {
                                ?>
                                <tr class="gradeX">
                                    <td>#<?php echo e($pkg->id); ?></td>
                                    <td><?php echo e($pkg->title); ?></td>
                                    <td>includes</td>
                                    <td>Not includes</td>
                                    <td><?php echo e(abs($pkg->cost)); ?></td>
                                    <td>
                                        <?php if ($pkg->status == 1) { ?>
                                            <span class="text-green">Active</span>
                                        <?php } else { ?>
                                            <span class="text-red">Inactive</span>
                                        <?php } ?>
                                    </td>
                                    <td>
                                        <ul class="edit_icon action_icons dashboard_icons">
                                            <?php if ($pkg->status == 1) { ?>
                                                <a href="<?php echo e(URL::to('sub-package',$pkg->id)); ?>" class="waves-effect" data-toggle="tooltip" data-placement="top" title="" data-original-title="Status"><img src="<?php echo e(asset('/public/images/ac_active.png')); ?>"></a>
                                            <?php } else { ?>
                                                <a href="<?php echo e(URL::to('sub-package',$pkg->id)); ?>" class="waves-effect" data-toggle="tooltip" data-placement="top" title="" data-original-title="Status"><img src="<?php echo e(asset('/public/images/ac_inactive.png')); ?>"></a>
                                            <?php } ?>
                                            <li><a href="<?php echo e(URL::to('sub-package/decline/'.$pkg->id)); ?>" onclick="return confirm('Are you sure you want to decline this request ?')" style="background: #FF4444;"><i class="fa fa-trash"></i></a></li>
                                        </ul>
                                    </td>
                                </tr>    
                                <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div> 
<script type="text/javascript">
    $(document).ready(function () {
        //Get the total rows

        var table = $('.datatable-package').dataTable({
            searching: true,
            paging: true,
            info: false, // hide showing entries
            ordering: false, // hide sorting
            bLengthChange: false, // hide showing entries in dropdown
            "dom": '<"pull-left"f><"pull-right"l>tip', //align search to left
            "language": {
                "search": "_INPUT_",
                "searchPlaceholder": "Search here...",
//         "paginate": {
//            previous: '&#x3c;', // or '<'
//            next: '&#x3e;' // or '>' 
//         }
            }
        });

        $('#datatable-responsive_wrapper .pull-right ').append('<div class="dataTables_length"><label for="Total Subscription Package">Total Subscription Package : ' + table.fnGetData().length + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></div>');
        $('.pull-right .dataTables_length').css({'font-size': '15px', 'color': '#fff'});
        $('#datatable-responsive_wrapper').
                css({
                    'background': '#7CA7BB',
                    'padding': '10px 0px 0px 0px',
                    'font-size': '18px',
                    'color': '#fff',
                    'border-radius': '8px 8px 0px 0px'
                });

        $('#datatable-responsive').css({
            'border': '0px',
            'margin-bottom': '0px !important'
        });

        $('#datatable-responsive_paginate').css({'background': '#fff'});

        $('.dataTables_filter input[type="search"]').
                css({'width': '250px'});
    });
</script><?php /**PATH /home/arknewtech/public_html/adventuresClub/resources/views/admin/pages/packages.blade.php ENDPATH**/ ?>