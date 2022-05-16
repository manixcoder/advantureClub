
<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="<?php echo e(URL::to('cities')); ?>" >Locations </a> > Create City</h4>
            </div>
        </div>
        <form  action="<?php echo e(URL::to('cities/add')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="row" id="example-basic">
                <div class="col-md-8 offset-2">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">  
                                <div class="col-md-12">
                                    <div class="form-group"> 
                                        <label for="field-1" class="control-label ">Create City</label> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <?php $region = !empty(request('region')) ? request('region') : ''; ?>
                                        <select name="region" class="form-control">
                                            <option value="">Select Country</option>
                                            <?php
                                            foreach ($countries as $val) {
                                                $sel = '';
                                                if ($region == $val->id) {
                                                    $sel = 'selected';
                                                }
                                                ?>
                                                <option value="<?php echo $val->id; ?>" <?php echo $sel; ?>><?php echo $val->region; ?></option>
                                            <?php } ?>

                                        </select>
                                        <?php if (isset($validation['region'])) { ?>
                                            <label class="error"><?php echo e($validation['region']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">         
                                    <div class="form-group"> 
                                        <?php
                                        $city = !empty(request('city')) ? request('city') : '';
                                        ?>
                                        <input type="text" class="form-control" id="city" placeholder="City" name="city" aria-required="true" aria-invalid="true" value="<?php echo $city; ?>" >
                                        <?php if (isset($validation['city'])) { ?>
                                            <label class="error"><?php echo e($validation['city']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer text-center">
                                <button type="cancel"  class="btn btn-default cancel"><a href="<?php echo e(url()->previous()); ?>">Cancel</a></button>
                                <button type="submit"  class="btn btn-primary save">Save</button>
                            </div> 
                        </div>   
                    </div>
                </div>
        </form>                           
    </div>
</div>
</div>


<?php /**PATH /home/advent12/public_html/admin/resources/views/admin/locations/add_city.blade.php ENDPATH**/ ?>