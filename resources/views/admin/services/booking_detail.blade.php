
<?php
$segment = Request::segment(3);
$base_url = URL::to('/');
?>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">My Services > #{{$segment}}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <section class="content-header">
                    <ol class="breadcrumb" style="padding-left: 0">
                        <li class="active">{{$service->category}}</li>
                    </ol>
                </section>
            </div>
            <div class="col-sm-6">
                <section class="content-header">
                    <ol class="breadcrumb pull-right booking-detail-booked-on" style="padding-right: 0">
                        <li>Booked on : {{date('d M, Y | h:i',strtotime($service->booked_on))}}</li>
                    </ol>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 booking-detail-banner">
                <img class="img-responsive" src="{{asset('public/walls/1.jpg')}}" alt="Photo">
            </div>
            <div class="col-md-3 booking-detail-banner">
                <img class="img-responsive" src="{{asset('public/walls/2.jpg')}}" alt="Photo">
            </div>
            <div class="col-md-3 booking-detail-banner">
                <img class="img-responsive" src="{{asset('public/walls/3.jpg')}}" alt="Photo">
            </div>
            <div class="col-md-3 booking-detail-banner">
                <img class="img-responsive" src="{{asset('public/walls/4.jpg')}}" alt="Photo">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="box">
                    <div class="box-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="th">Adventure Name :</td>
                                    <td>{{$service->adventure_name}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Booking Id :</td>
                                    <td>{{$service->booking_id}}</td>
                                </tr>
                                <tr>
                                    <td class="th">User Name :</td>
                                    <td>{{$service->customer}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Nationality :</td>
                                    <td>{{$service->country}}</td>
                                </tr>
                                <tr>
                                    <td class="th">How Old :</td>
                                    <td>{{getOldAge($service->dob)}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Service Date :</td>
                                    <td>{{date('d M, Y',strtotime($service->service_date))}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Registrations :</td>
                                    <td>{{$service->adult}} Adults, {{$service->adult}} Youngsters</td>
                                </tr>
                                <tr>
                                    <td class="th">Unit Cost :</td>
                                    <td>{{$service->currency.' '.$service->unit_cost}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Total Cost :</td>
                                    <td>{{$service->currency.' '.$service->total_cost}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Payment Chanel :</td>
                                    <td>{{$service->payment_channel??'N/A'}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Health Condition :</td>
                                    <td>Task</td>
                                </tr>
                                <tr>
                                    <td class="th">Height & Weight :</td>
                                    <td>{{$service->height}} | {{$service->weight}}</td>
                                </tr>
                                <tr>
                                    <td class="th">Client Message :</td>
                                    <td>{{$service->message}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <span class="badge bg-blue"><i class="fa fa-comments"></i> &nbsp;&nbsp;<span class="text-blue">Chat Client</span></span>
                            </div>
                            <?php
                            if ($service->status == 0) {
                                ?>
                                <div class="col-md-4">
                                    <a href="{{URL::to('booking/accept/'.$service->booking_id)}}" onclick="return confirm('Are you sure you want to accept this request ?')">
                                        <span class="badge bg-green"><i class="fa fa-check"></i> &nbsp;&nbsp;<span class="text-green" >Accept</span></span>
                                    </a>
                                </div>
                                <div class="col-md-4">
                                    <a href="{{URL::to('booking/decline/'.$service->booking_id)}}" onclick="return confirm('Are you sure you want to decline this request ?')">
                                        <span class="badge bg-red"><i class="fa fa-times" style="margin-left: 2px;"></i> &nbsp;&nbsp;<span class="text-red" >Decline</span></span>
                                    </a>
                                </div>
                            <?php } else if ($service->status == 1) {
                                ?>
                                <div class="col-md-4">
                                    <span class="text-green">{{$service->booking_status_text}}</span>
                                </div>
                            <?php } else if ($service->status == 2) {
                                ?>
                                <div class="col-md-4">
                                    <span class="text-red">{{$service->booking_status_text}}</span>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>