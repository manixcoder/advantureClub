<?php
$segment = Request::segment(3);
$base_url = URL::to('/');
?>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">My Services > #<?php echo e($service->service_id); ?> > Participant</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 offset-1">
                <div class="box">
                    <div class="box-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="th">Booking ID :</td>
                                    <td>#<?php echo e($service->booking_id); ?></td>
                                </tr>
                                <tr>
                                    <td class="th">User Name :</td>
                                    <td><?php echo e($service->customer); ?></td>
                                </tr>
                                <tr>
                                    <td class="th">Nationality :</td>
                                    <td><?php echo e($service->country); ?></td>
                                </tr>
                                <tr>
                                    <td class="th">How Old :</td>
                                    <td><?php echo e(getOldAge($service->dob)); ?></td>
                                </tr>
                                <tr>
                                    <td class="th">Service Date :</td>
                                    <td><?php echo e($service->service_date); ?></td>
                                </tr>
                                <tr>
                                    <td class="th">Registration :</td>
                                    <td><?php echo e($service->adult); ?> Adults, <?php echo e($service->kids); ?> Youngsters</td>
                                </tr>
                                <tr>
                                    <td class="th">Unit cost :</td>
                                    <td><?php echo e($service->currency.' '.$service->unit_cost); ?> </td>
                                </tr>
                                <tr>
                                    <td class="th">Total cost :</td>
                                    <td><?php echo e($service->currency.' '.$service->total_cost); ?> </td>
                                </tr>
                                <tr>
                                    <td class="th">Payment Chanel :</td>
                                    <td><?php echo e($service->payment_channel); ?> </td>
                                </tr>
                                <tr>
                                    <td class="th">Profile Pic :</td>
                                    <td>
                                        <?php if($service->profile_image !=''): ?>
                                        <img src="<?php echo e(asset('public/profile_image/'.$service->profile_image)); ?>" class="user-image-thumb" />
                                        <?php else: ?>
                                        <img src="<?php echo e(asset('public/uploads/profile.png')); ?>" class="user-image-thumb" />
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-4 service-right-section">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box">
                            <div class="box-body">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td class="th">Health Condition :</td>
                                            <td><?php echo implode('<br>', array_column($service->dependencies, 'dependency_name')); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="th">Weight :</td>
                                            <td><?php echo e($service->Weight); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="th">Height :</td>
                                            <td><?php echo e($service->Height); ?></td>
                                        </tr>
                                        <tr>
                                            <td class="th">Description :</td>
                                            <td><?php echo e($service->message); ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><?php /**PATH /home/advent12/public_html/admin/resources/views/admin/services/booked_client_view.blade.php ENDPATH**/ ?>