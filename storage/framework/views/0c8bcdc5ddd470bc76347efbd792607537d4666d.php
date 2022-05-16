<?php $__env->startSection('content'); ?>

                    <div class="form">
                    <h1>Retrieve Password</h1>
                    <form class="cmxform form-horizontal tasi-form" id="loginForm" method="POST" action="<?php echo e(url('/forgot-password')); ?>" novalidate="novalidate">
                        <?php echo csrf_field(); ?>
                        <div class="alert alert-info alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                             <?php if(session('status')): ?>
                                <?php echo e(session('status')); ?>

                             <?php else: ?>
                             Enter your <b>Email</b> and instructions will be sent to you!
                             <?php endif; ?>
                        </div>
                        <div class="form-group">
                            <div class="col-12">
                                <input id="email" type="email" class="form-control input-lg <?php if ($errors->has('email')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('email'); ?> is-invalid <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>" name="email" value="<?php echo e(old('email')); ?>" autocomplete="email" required="" aria-required="true" autofocus placeholder="<?php echo e(__('Email Address')); ?>">
                                 <?php if ($errors->has('email')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('email'); ?>
                                <span class="invalid-feedback" role="alert">
                                    <label><?php echo e($message); ?></label>
                                </span>  
                                <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>                               
                            </div>
                        </div>
                        <div class="form-group retrieve_btn">
                            <div class="col-12">
                                <button class="btn btn-primary btn-lg w-lg waves-effect waves-light" type="submit"> <?php echo e(__('Send Password Reset Link')); ?></button> 
                            </div>
                        </div>
                    </form>
                   
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.forgot-password', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/advent12/public_html/admin/resources/views/customauth/password/email.blade.php ENDPATH**/ ?>