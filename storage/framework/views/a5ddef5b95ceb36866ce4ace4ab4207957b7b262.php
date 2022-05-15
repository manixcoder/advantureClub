<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="<?php echo e(URL::to('about-us')); ?>">About Us</a> > Edit</h4>
            </div>
        </div>
        <form action="<?php echo e(URL::to('about-us/add')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="row">
                <div class="col-md-10 offset-1">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="title-div">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="file" name="image" class="form-control">
                                            <?php if (isset($validation['image'])) { ?>
                                                <label class="error"><?php echo e($validation['image']); ?></label>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <img src="<?php echo e(url('/public/')); ?>/<?php echo e($terms->image); ?>">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <?php
                                            $description = '';
                                            if (request('description')) {
                                                $description = request('description');
                                            } elseif (!empty($terms) && (request('description') == '')) {
                                                $description = $terms->content;
                                            }
                                            ?>
                                            <textarea type="text" name="description" rows='6' class="form-control" placeholder="Description"><?php echo e($description); ?></textarea>
                                            <?php if (isset($validation['description'])) { ?>
                                                <label class="error"><?php echo e($validation['description']); ?></label>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="cancel" class="btn btn-default cancel"><a href="<?php echo e(url()->previous()); ?>">Cancel</a></button>
                        <button type="submit" class="btn btn-primary save">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div><?php /**PATH /home/advent12/public_html/admin/resources/views/admin/pages/update_about_us.blade.php ENDPATH**/ ?>