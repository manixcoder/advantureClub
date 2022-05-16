
<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="<?php echo e(URL::to('regions')); ?>" >Locations </a> > Create Region</h4>
            </div>
        </div>
        <form  action="<?php echo e(URL::to('regions/add')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="row" id="example-basic">
                <div class="col-md-8 offset-2">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">  
                                <div class="col-md-12">
                                    <div class="form-group"> 
                                        <label for="field-1" class="control-label ">Create Region</label> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <?php $country = !empty(request('country')) ? request('country') : ''; ?>
                                        <select name="country" class="form-control">
                                            <option value="">Select Country</option>
                                            <?php
                                            foreach ($countries as $val) {
                                                $sel = '';
                                                if ($country == $val->id) {
                                                    $sel = 'selected';
                                                }
                                                ?>
                                                <option value="<?php echo $val->id; ?>" <?php echo $sel; ?>><?php echo $val->country; ?></option>
                                            <?php } ?>

                                        </select>
                                        <?php if (isset($validation['country'])) { ?>
                                            <label class="error"><?php echo e($validation['country']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">         
                                    <div class="form-group"> 
                                        <?php
                                        $region = !empty(request('region')) ? request('region') : '';
                                        ?>
                                        <input type="text" class="form-control" id="region" placeholder="Region" name="region" aria-required="true" aria-invalid="true" value="<?php echo $region; ?>" >
                                        <?php if (isset($validation['region'])) { ?>
                                            <label class="error"><?php echo e($validation['region']); ?></label>
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


<?php /**PATH /home/advent12/public_html/admin/resources/views/admin/locations/add_region.blade.php ENDPATH**/ ?>