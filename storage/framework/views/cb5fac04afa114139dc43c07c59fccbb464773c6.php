<?php $curr_tab = Request::segment(1) ?? 'countries'; ?>
<div class="col-md-3 selections-tab">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <a class="nav-link <?php if ($curr_tab == 'countries' || $curr_tab == '') {
                                echo 'active';
                            } ?>" href="<?php echo e(URL::to('/countries')); ?>" role="tab" aria-controls="v-pills-home" aria-selected="true">Country</a>
        <a class="nav-link <?php if ($curr_tab == 'regions') {
                                echo 'active';
                            } ?>" href="<?php echo e(URL::to('/regions')); ?>" role="tab" aria-controls="v-pills-messages" aria-selected="false">Region</a>
        <a class="nav-link <?php if ($curr_tab == 'cities') {
                                echo 'active';
                            } ?>" href="<?php echo e(URL::to('/cities')); ?>" role="tab" aria-controls="v-pills-profile" aria-selected="false">City</a>

    </div>
</div><?php /**PATH /home/advent12/public_html/admin/resources/views/admin/locations/location_sidebar.blade.php ENDPATH**/ ?>