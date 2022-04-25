<?php
$segment = Request::segment(3);
$base_url = URL::to('/');
?>
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="pull-left page-title">Adventure Requests > #{{$segment}}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="box">
                    <div class="box-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="th">Requests ID :</td>
                                    <td>#{{ $service->id }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Company Name :</td>
                                    <td>{{ $service->company_name }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Official Address :</td>
                                    <td>{{ $service->address }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Country :</td>
                                    <td>{{ $service->country }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Nationality :</td>
                                    <td>{{ $service->country }}</td>
                                </tr>
                                <tr>
                                    <td class="th">GeoLocation :</td>
                                    <td>{{ $service->location }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Licensed :</td>
                                    <td>{{ $service->license }}</td>
                                </tr>
                                <tr>
                                    <td class="th">CR Name :</td>
                                    <td>{{ $service->cr_name }}</td>
                                </tr>
                                <tr>
                                    <td class="th">CR Number :</td>
                                    <td>{{ $service->cr_number }}</td>
                                </tr>
                                <tr>
                                    <td class="th">CR Copy :</td>
                                    <td>
                                        @if($service->cr_copy!='')
                                        <img src="{{ asset('public/').'/'.$service->cr_copy }}" alt="image" width="100" height="100">
                                        @else
                                        <img src="{{ asset('public/images/noImages.png') }}" alt="image" width="100" height="100">
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td class="th">Partnership :</td>
                                    <td>{{ $service->title }}</td>
                                </tr>
                                <tr>
                                    <td class="th">Payment :</td>
                                    <td> {{ $service->title }} </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6 service-right-section">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-12">
                            <div class="box">
                                <div class="box-body">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td class="th">Requests On :</td>
                                                <td>{{ date("d M Y", strtotime($service->request_date))  }}</td>
                                            </tr>
                                            <tr>
                                                <td class="th">Payment Setup :</td>
                                                <td>
                                                    @if($service->debit_card == '1' )
                                                    {{ "debit card" }}
                                                    @endif

                                                    @if($service->visa_card)
                                                    {{ "visa card" }}
                                                    @endif

                                                    @if($service->payon_arrival)
                                                    {{ "payon arrival" }}
                                                    @endif

                                                    @if($service->paypal)
                                                    {{ "paypal" }}
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="star-div">
                                        <button type="button" class="btn btn-block btn-primary">Notify</button>
                                        <button type="button" class="btn btn-block btn-success">Accept</button>
                                        <button type="button" class="btn btn-block btn-danger">Decline</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>