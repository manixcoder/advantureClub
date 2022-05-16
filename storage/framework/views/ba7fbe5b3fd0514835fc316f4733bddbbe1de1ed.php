<style type="text/css">
    .colerclass{
        color: #317eeb;
    }
    .menustyle{
        margin: 10px;
    }
</style>
<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="<?php echo e(URL::to('selections')); ?>" >Selection Manage</a> > Create Selection</h4>
            </div>
        </div>

        <form  action="<?php echo e(URL::to('selections/add')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="row" id="example-basic">
                <div class="col-md-10 offset-1">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">  
                                <div class="col-md-12">
                                    <div class="form-group"> 
                                        <label for="field-1" class="control-label ">Create Selection</label> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <?php
                                        $selection_name = '';
                                        if (request('selection_name')) {
                                            $selection_name = request('selection_name');
                                        }
                                        ?>
                                        <input type="text" class="form-control" id="selection_name" placeholder="Create selection" name="selection_name" aria-required="true" aria-invalid="true"value="<?php echo $selection_name; ?>" >
                                        <?php if (isset($validation['selection_name'])) { ?>
                                            <label class="error"><?php echo e($validation['selection_name']); ?></label>
                                            <?php
                                        }
                                        ?>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                        $comes_under = '';
                                        if (request('comes_under')) {
                                            $comes_under = request('comes_under');
                                        }
                                        ?>
                                        <select class="form-control" name="comes_under">
                                            <option value="" >Select</option>
                                            <?php
                                            foreach ($under as $key => $res) {
                                                $sel = '';
                                                if ($comes_under == $key) {
                                                    $sel = 'selected';
                                                }
                                                ?>
                                                <option value="<?php echo $key; ?>" <?php echo $sel;
                                                ?> ><?php echo $res; ?></option>
                                                    <?php } ?>
                                        </select>
                                        <?php if (isset($validation['comes_under'])) { ?>
                                            <label class="error"><?php echo e($validation['comes_under']); ?></label>
                                            <?php
                                        }
                                        ?>
                                    </div>
                                </div> 
                            </div>
                            <div class="modal-footer text-center">
                                <button type="cancel"  class="btn btn-default cancel"><a href="<?php echo e(url()->previous()); ?>">Cancel</a></button>
                                <button type="submit"  class="btn btn-primary save">Save</button>
                            </div>                     
                        </div><!-- End card-body -->
                    </div> <!-- End card -->
                    </form><!-- Form End -->
                </div><!-- container -->
            </div>


<?php /**PATH /home/advent12/public_html/admin/resources/views/admin/selections/update_selections.blade.php ENDPATH**/ ?>