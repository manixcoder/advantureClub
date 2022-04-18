<style type="text/css">
    .colerclass {
        color: #317eeb;
    }

    .menustyle {
        margin: 10px;
    }
</style>
<?php $segment = Request::segment(2); ?>
<div class="content add_adventure_users">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title"><a href="{{ URL::to('list-adventure-users') }}">Announcement</a> > Add New Announcement</h4>
            </div>
        </div>

        <form action="#" method="POST" id="FormValidation" enctype="multipart/form-data">
            @csrf
            <!--<form  action="{{ URL::to('add-adventure-user') }}" method="POST"  enctype="multipart/form-data">-->
            <!--    @csrf-->
            <div class="row" id="example-basic">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h5></h5>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" id="Announcement Title" name="name" class="form-control" aria-required="true" placeholder="User Name">
                                        <?php if (isset($validation['name'])) { ?>
                                            <label class="error">{{ $validation['name'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">

                                        <input type="text" id="email" name="email" class="form-control" aria-required="true" placeholder="Email Address">
                                        <?php if (isset($validation['email'])) { ?>
                                            <label class="error">{{ $validation['email'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select class="form-control" id="country" name="country">
                                            <option value="">Select Country</option>
                                            <option value="">India</option>

                                        </select>
                                        <?php if (isset($validation['country'])) { ?>
                                            <label class="error">{{ $validation['country'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php $region = DB::table('regions')->get(); ?>
                                        <select class="form-control" id="region" name="region">

                                        </select>
                                        <?php if (isset($validation['region'])) { ?>
                                            <label class="error">{{ $validation['region'] }}</label>
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

                                                <select class="form-control" id="mobile_code" name="mobile_code">
                                                    <option value="">Select Code</option>

                                                    <option value="">dfgfdg</option>

                                                </select>
                                                <?php if (isset($validation['mobile_code'])) { ?>
                                                    <label class="error">{{ $validation['mobile_code'] }}</label>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="form-group">

                                                <input type="text" id="mobile" name="mobile" class="form-control" aria-required="true" placeholder="Mobile Number">
                                                <?php if (isset($validation['mobile'])) { ?>
                                                    <label class="error">{{ $validation['mobile'] }}</label>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group date_of_birth">

                                        <input type="text" id="dob" name="dob" class="form-control datepicker" placeholder="Date of birth" readonly>
                                        <?php if (isset($validation['dob'])) { ?>
                                            <label class="error">{{ $validation['dob'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        <input type="text" id="weight" name="weight" class="form-control" aria-required="true" placeholder="Weight in KG">
                                        <?php if (isset($validation['weight'])) { ?>
                                            <label class="error">{{ $validation['weight'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        <input type="text" id="height" name="height" class="form-control" aria-required="true" placeholder="Height in CM">
                                        <?php if (isset($validation['height'])) { ?>
                                            <label class="error">{{ $validation['height'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Profile image: <span style="color: red;">*</span></label>
                                        <input type="file" id="image" name="image" class="form-control" aria-required="true" accept="image/*">
                                        <?php if (isset($validation['image'])) { ?>
                                            <label class="error">{{ $validation['image'] }}</label>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <p class="control-label"><b>Status</b>
                                            <font color="red">*</font>
                                        </p>
                                        <div class="radio radio-info form-check-inline">
                                            <input type="radio" id="active" value="1" name="status">
                                            <label for="inlineRadio1"> Active </label>
                                        </div>
                                        <div class="radio radio-info form-check-inline">
                                            <input type="radio" id="inactive" value="0" name="status">
                                            <label for="inlineRadio1"> Inactive </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <input type="checkbox" id="chk_1" name="health_condition[]">
                                        <span for="chk_1">tret</span>
                                    </div>
                                </div>

                                <?php if (isset($validation['health_condition'])) { ?>
                                    <label class="error">{{ $validation['health_condition'] }}</label>
                                <?php } ?>

                            </div>

                            <div class="modal-footer text-center">
                                <button type="cancel" id="canceltbtn" class="btn btn-default cancel"><a href="{{url()->previous()}}">Cancel</a></button>
                                <button type="submit" id="submitbtn" class="btn btn-primary save">Save</button>
                            </div>
                        </div><!-- End card-body -->
                    </div> <!-- End card -->
        </form><!-- Form End -->
    </div><!-- container -->
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#dob").datepicker({
            format: 'yyyy-mm-dd',
            // startDate: '+1d',
            autoclose: true,
            // showOn: "button",
            // buttonImage: "public/images/calender.png",
            // buttonImageOnly: true,
            // buttonText: "Select date",
        });
        $('#country').change(function() {
            base_url = '<?php echo URL::to('/'); ?>';
            $country_id = $('#country').val();
            $('#currency').val($country_id);
            $.post(base_url + '/get_regions/' + $country_id, {
                "_token": "{{ csrf_token() }}",
                count: $country_id
            }, function(data) {
                $('#region').html(data);
            });
        });
    });
    <?php if (request('country')) { ?>
        base_url = '<?php echo URL::to('/'); ?>';
        $country_id = <?php echo request('country'); ?>;
        $region = <?php echo request('region') ?? 0; ?>;
        $('#currency').val($country_id);
        $.post(base_url + '/get_regions/' + $country_id, {
            "_token": "{{ csrf_token() }}",
            count: $country_id,
            region: $region
        }, function(data) {
            $('#region').html(data);
        });
    <?php } ?>
</script>