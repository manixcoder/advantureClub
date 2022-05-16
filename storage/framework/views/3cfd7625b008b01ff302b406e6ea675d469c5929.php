<?php $__env->startSection('content'); ?>

<div class="container">
     <div class="row justify-content-center">
         <div class="col-md-8">
             <div class="card">
                 <div class="card-header">Verify Your Email Address</div>
                   <div class="card-body">
                    <?php if(session('resent')): ?>
                         <div class="alert alert-success" role="alert">
                            <?php echo e(__('A fresh verification link has been sent to your email address.')); ?>

                        </div>
                    <?php endif; ?>
                    <a href="url('\<?php echo e($token); ?>\reset-password')">Click Here</a>.
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.forgot-password', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/advent12/public_html/admin/resources/views/customauth/verify.blade.php ENDPATH**/ ?>