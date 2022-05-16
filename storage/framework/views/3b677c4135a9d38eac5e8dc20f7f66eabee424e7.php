<style type="text/css">
    .colerclass{
        color: #317eeb;
    }
    .menustyle{
        margin: 10px;
    }
</style>
<?php $segment = Request::segment(2);?>
<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="<?php echo e(URL::to('list-adventure-users')); ?>">Users</a> > Add New User</h4>
            </div>
        </div>
        <?php //echo"<pre>";print_r($editData);exit;
         if(!empty($editData)){
         ?>
        <input type="hidden" name="id" id="id"  value="<?php echo e($editData->id); ?>">
           <?php  $s = URL::to('add-adventure-user/'.$editData->id ) ;
          }else{
             $s = URL::to('add-adventure-user');
          }
      ?>
      <form  action="<?php echo e($s); ?>" method="POST" id="FormValidation" enctype="multipart/form-data">
         <?php echo csrf_field(); ?>
        <!--<form  action="<?php echo e(URL::to('add-adventure-user')); ?>" method="POST"  enctype="multipart/form-data">-->
        <!--    <?php echo csrf_field(); ?>-->
            <div class="row" id="example-basic">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">  
                            <div class="col-md-12">
                                <h5><?php if($segment){echo 'Edit User';} else {echo 'Add New User';}?></h5>
                            </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                        $name = '';
                                        if (request('name')) {
                                            $name = request('name');
                                        } elseif (!empty($user_detail) && (request('name') == '')) {
                                            $name = $user_detail['name'];
                                        }
                                        ?>
                                        <input type="text" id="name" name="name" class="form-control" aria-required="true" value="<?php echo e($name); ?>" placeholder="User Name" > 
                                        <?php if (isset($validation['name'])) { ?>
                                            <label class="error"><?php echo e($validation['name']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">  
                                        <?php
                                        $email = '';
                                        if (request('email')) {
                                            $email = request('email');
                                        } elseif (!empty($user_detail) && (request('email') == '')) {
                                            $email = $user_detail['email'];
                                        }
                                        ?>
                                        <input type="text" id="email" name="email" class="form-control" value="<?php echo e($email); ?>" aria-required="true" placeholder="Email Address"> 
                                        <?php if (isset($validation['email'])) { ?>
                                            <label class="error"><?php echo e($validation['email']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                        $country = '';
                                        if (request('country')) {
                                            $country = request('country');
                                        } elseif (!empty($user_detail) && (request('country') == '')) {
                                            $country = $user_detail['country'];
                                        }
                                        ?>

                                        <select class="form-control" id="country" name="country"  >
                                            <option value="">Select Country</option>
                                            <?php
                                            foreach ($countries as $value) {
                                                $sel = '';
                                                if ($country == $value->id) {
                                                    $sel = 'selected';
                                                }
                                                ?>
                                                <option value="<?php echo e($value->id); ?>" <?php echo $sel; ?>><?php echo e($value->country); ?></option>
                                            <?php } ?>
                                        </select>
                                        <?php if (isset($validation['country'])) { ?>
                                            <label class="error"><?php echo e($validation['country']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php $region = DB::table('regions')->get(); ?>
                                        <select class="form-control" id="region" name="region"  >

                                        </select>
                                        <?php if (isset($validation['region'])) { ?>
                                            <label class="error"><?php echo e($validation['region']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <?php
                                                $mobile_code = '';
                                                if (request('mobile_code')) {
                                                    $mobile_code = request('mobile_code');
                                                } elseif (!empty($user_detail) && (request('mobile_code') == '')) {
                                                    $mobile_code = $user_detail['mobile_code'];
                                                }
                                                ?>

                                                <select class="form-control" id="mobile_code" name="mobile_code"  >
                                                    <option value="">Select Code</option>
                                                    <?php
                                                    foreach ($countries as $value) {
                                                        $sel = '';
                                                        if ($mobile_code == $value->id) {
                                                            $sel = 'selected';
                                                        }
                                                        ?>
                                                        <option value="<?php echo e($value->id); ?>" <?php echo $sel; ?>><?php echo e($value->code.' - '.$value->country); ?></option>
                                                    <?php } ?>
                                                </select>
                                                <?php if (isset($validation['mobile_code'])) { ?>
                                                    <label class="error"><?php echo e($validation['mobile_code']); ?></label>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="form-group">  
                                                <?php
                                                $mobile = '';
                                                if (request('mobile')) {
                                                    $mobile = request('mobile');
                                                } elseif (!empty($user_detail) && (request('mobile') == '')) {
                                                    $mobile = $user_detail['mobile'];
                                                }
                                                ?>
                                                <input type="text" id="mobile" name="mobile" class="form-control" value="<?php echo e($mobile); ?>" aria-required="true" placeholder="Mobile Number" > 
                                                <?php if (isset($validation['mobile'])) { ?>
                                                    <label class="error"><?php echo e($validation['mobile']); ?></label>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group date_of_birth">
                                        <?php
                                        $dob = '';
                                        if (request('dob')) {
                                            $dob = request('dob');
                                        } elseif (!empty($user_detail) && (request('dob') == '')) {
                                            $dob = $user_detail['dob'];
                                        }
                                        ?>
                                        <input type="text" id="dob" name="dob" class="form-control datepicker" value="<?php echo e($dob); ?>" placeholder="Date of birth" readonly > 
                                        <?php if (isset($validation['dob'])) { ?>
                                            <label class="error"><?php echo e($validation['dob']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">  
                                        <?php
                                        $weight = '';
                                        if (request('weight')) {
                                            $weight = request('weight');
                                        } elseif (!empty($user_detail) && (request('weight') == '')) {
                                            $weight = $user_detail['weight'];
                                        }
                                        ?>
                                        <input type="text" id="weight" name="weight" class="form-control" value="<?php echo e($weight); ?>" aria-required="true" placeholder="Weight in KG" > 
                                        <?php if (isset($validation['weight'])) { ?>
                                            <label class="error"><?php echo e($validation['weight']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <?php
                                        $height = '';
                                        if (request('height')) {
                                            $height = request('height');
                                        } elseif (!empty($user_detail) && (request('height') == '')) {
                                            $height = $user_detail['height'];
                                        }
                                        ?>
                                        <input type="text" id="height" name="height" class="form-control" value="<?php echo e($height); ?>" aria-required="true" placeholder="Height in CM" >
                                        <?php if (isset($validation['height'])) { ?>
                                            <label class="error"><?php echo e($validation['height']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <label for="field-1" class="control-label">Profile image: <span style="color: red;">*</span></label> 
                                        <input  type="file" id="image" name="image" class="form-control"  aria-required="true" accept="image/*"> 
                                        <?php if (isset($validation['image'])) { ?>
                                            <label class="error"><?php echo e($validation['image']); ?></label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <p class="control-label"><b>Status</b> <font color="red">*</font></p>
                                        <div class="radio radio-info form-check-inline">
                                            <input type="radio" id="active" value="1" name="status" <?php if(request('status') == '' || request('status') == '1'){ echo 'checked';}?>>
                                            <label for="inlineRadio1"> Active </label>
                                        </div>
                                        <div class="radio radio-info form-check-inline">
                                            <input type="radio" id="inactive" value="0" name="status" <?php if(request('status') == '0'){ echo 'checked';}?>>
                                            <label for="inlineRadio1"> Inactive </label>
                                        </div>
                                    </div>
                                </div>
                                <?php
                                if (count($health_condtions)) {
                                    $health_condition = [];
                                    if (request('health_condition')) {
                                        $health_condition = request('health_condition');
                                    } elseif (!empty($user_detail) && (request('health_condition') == '')) {
                                        $health_condition = $user_detail['health_condition'];
                                    }

                                    foreach ($health_condtions as $hel) {
                                        $checked = '';
                                        if (in_array($hel->id, $health_condition)) {
                                            $checked = 'checked';
                                        }
                                        ?>
                                        <div class="col-md-3">
                                            <div class="form-group">  
                                                <input type="checkbox" id="chk_1" value="<?php echo e($hel->id); ?>" name="health_condition[]" <?php echo $checked; ?>>
                                                <span for="chk_1"><?php echo e($hel->title); ?></span>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                }
                                ?>
                                <?php if (isset($validation['health_condition'])) { ?>
                                    <label class="error"><?php echo e($validation['health_condition']); ?></label>
                                <?php } ?>

                            </div>

                            <div class="modal-footer text-center">
                                <button type="cancel" id="canceltbtn" class="btn btn-default cancel"><a href="<?php echo e(url()->previous()); ?>">Cancel</a></button>
                                <button type="submit" id="submitbtn" class="btn btn-primary save">Save</button>
                            </div>                     
                        </div><!-- End card-body -->
                    </div> <!-- End card -->
                    </form><!-- Form End -->
                </div><!-- container -->
            </div>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#dob").datepicker({
                         format: 'yyyy-mm-dd',
                        // startDate: '+1d',
                         autoclose: true,
                        // showOn: "button",
                        // buttonImage: "public/images/calender.png",
                        // buttonImageOnly: true,
                        // buttonText: "Select date",
                    });
                    $('#country').change(function () {
                        base_url = '<?php echo URL::to('/'); ?>';
                        $country_id = $('#country').val();
                        $('#currency').val($country_id);
                        $.post(base_url + '/get_regions/' + $country_id,
                                {
                                    "_token": "<?php echo e(csrf_token()); ?>",
                                    count: $country_id
                                }, function (data) {
                            $('#region').html(data);
                        });
                    });
                });
<?php if (request('country')) { ?>
                    base_url = '<?php echo URL::to('/'); ?>';
                    $country_id = <?php echo request('country'); ?>;
                    $region = <?php echo request('region') ?? 0; ?>;
                    $('#currency').val($country_id);
                    $.post(base_url + '/get_regions/' + $country_id,
                            {
                                "_token": "<?php echo e(csrf_token()); ?>",
                                count: $country_id,
                                region: $region
                            }, function (data) {
                        $('#region').html(data);
                    });
<?php } ?>



            </script>

<?php /**PATH /home/arknewtech/public_html/adventuresClub/resources/views/admin/adventure_users/add_adventure_users.blade.php ENDPATH**/ ?>