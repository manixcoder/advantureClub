<style type="text/css">
   .colerclass {
      color: #317eeb;
   }

   .menustyle {
      margin: 10px;
   }


   /* Style the tab */
   .tab {
      overflow: hidden;
      border: 1px solid #ccc;
      background-color: #f1f1f1;
   }

   /* Style the buttons that are used to open the tab content */
   .tab button {
      background-color: inherit;
      float: left;
      border: none;
      outline: none;
      cursor: pointer;
      padding: 14px 16px;
      transition: 0.3s;
   }

   /* Change background color of buttons on hover */
   .tab button:hover {
      background-color: #ddd;
   }

   /* Create an active/current tablink class */
   .tab button.active {
      background-color: #ccc;
   }

   /* Style the tab content */
   .tabcontent {
      display: none;
      padding: 6px 12px;
      border: 1px solid #ccc;
      border-top: none;
   }
</style>
<div class="content partner_details">
   <div class="container-fluid">
      <div class="row">
         <div class="col-sm-12">
            <?php  // echo"<pre>";print_r($editdata);exit;  
            ?>
            <h4 class="pull-left page-title">
               <a href="<?php echo e(URL::to('list-adventure-partners')); ?>">
                  Partner
               </a> >
               #<?php echo e($editdata->id); ?>

            </h4>
         </div>
      </div>

      <div class="partners">
         <div class="row">
            <div class="col-md-6">
               <ul>
                  <li>
                     <p>Partner ID :</p>
                     <h3>#<?php echo e(!empty($editdata->id) ? $editdata->id : ''); ?></h3>
                  </li>
                  <li>
                     <p>Partner Name :</p>
                     <h3><?php echo e(!empty($editdata->name)?$editdata->name:''); ?></h3>
                  </li>
                  <li>
                     <p>Email Address :</p>
                     <h3><?php echo e(!empty($editdata->email)?$editdata->email:''); ?></h3>
                  </li>
                  <li>
                     <p>Mobile No. :</p>
                     <h3><?php echo e(!empty($editdata->mobile)?$editdata->mobile:''); ?></h3>
                  </li>
                  <li>
                     <p>Nationality :</p>
                     <h3><?php echo e($editdata->country); ?></h3>
                  </li>
                  <li>
                     <p>City/State :</p>
                     <h3><?php echo e(!empty($editdata->city_id)?$editdata->city_id:''); ?></h3>
                  </li>
                  <li>
                     <p>Date of Birth :</p>
                     <h3><?php echo e(date('d M Y'  , strtotime($editdata->dob))); ?></h3>
                  </li>
                  <li>
                     <p>Profile Pic :</p>
                     <h3>
                        <?php if(!empty($editdata->profile_image)): ?>
                        <img src="<?php echo e(asset('public').'/'.$editdata->profile_image); ?>" alt="image" width="100" height="100">
                        <?php else: ?>
                        <img src="<?php echo e(asset('public/uploads/profile.png')); ?>" alt="image" width="100" height="100">
                        <?php endif; ?>
                     </h3>
                  </li>
                  <li>
                     <p>Health Conditions :</p>
                     <h3 class="ellipsis">
                        <?php foreach ($healthConditionData as $val) {
                           if (count($healthConditionData) > 1) { ?>
                              <span><?php echo e($val->name .', '); ?></span>
                           <?php } else { ?>
                              <span><?php echo e($val->name); ?></span>
                        <?php }
                        } ?>
                     </h3>
                  </li>
                  <li>
                     <p>Weight in Kg :</p>
                     <h3><?php echo e($editdata->weight); ?></h3>
                  </li>
                  <li>
                     <p>Height in CM :</p>
                     <h3><?php echo e($editdata->height); ?></h3>
                  </li>
                  <li>
                     <p>Status :</p>
                     <?php
                     if ($editdata->is_approved == 1) {
                        $statVal = 1;
                        $checked = 'checked = checked';
                        $stat = 'Active';
                        $class = 'badge-success';
                     } else {
                        $statVal = 0;
                        $checked = '';
                        $stat = 'InActive';
                        $class = 'badge-danger';
                     }
                     ?>
                     <span id="statusText_<?php echo e($editdata->id); ?>" class="$class"><?php echo e($stat); ?> &nbsp;&nbsp;</span>
                     <span>
                     <h3>
                        <label class="switch">
                              <input type="checkbox" class="togBtn" id="togBtn_<?php echo e($editdata->id); ?>" name="togBtn_<?php echo e($editdata->id); ?>" value="<?php echo e($statVal); ?>" <?php echo $checked; ?> />
                              <span class="slider round"></span>
                           </label>
                     </h3>
                     </span>
                  </li>
               </ul>
            </div>
            <div class="col-md-6">
               <ul>
                  <li>
                     <p>Company Name :</p>
                     <h3><?php echo e(!empty($editdata->company_name)?$editdata->company_name:''); ?></h3>
                  </li>
                  <li>
                     <p>Address :</p>
                     <h3><?php echo e(!empty($editdata->address)?$editdata->address:''); ?></h3>
                  </li>
                  <li>
                     <p>GeoLocation :</p>
                     <h3><?php echo e(!empty($editdata->location)?$editdata->location:''); ?></h3>
                  </li>
                  <li>
                     <p>Licensed :</p>
                     <?php echo e(!empty($editdata->license)? 'Yes':'No'); ?>


                  </li>

                  <li>
                     <p>CR Name :</p>
                     <h3><?php echo e(!empty($editdata->cr_name)?$editdata->cr_name:''); ?></h3>
                  </li>
                  <li>
                     <p>CR Number :</p>
                     <h3><?php echo e(!empty($editdata->cr_number)?$editdata->cr_number:''); ?></h3>
                  </li>
                  <li>
                     <p>Cr Copy :</p>
                     <h3>
                        <?php if($editdata->cr_copy != ''): ?>
                        <img src="<?php echo e(URL::asset('/public/crCopy/')); ?>/<?php echo e($editdata->cr_copy ?? ''); ?>" alt="image" width="250" height="150">
                        <?php else: ?>
                        <img src="<?php echo e(URL::asset('/public/crCopy/no.png')); ?>" alt="image" width="100" height="100">
                        <?php endif; ?>
                     </h3>
                  </li>
                  <?php if($editdata->packages_id !='0'): ?>
                  <?php
                  $package = DB::table('packages')
                  ->select('*')
                  ->where('id',$editdata->packages_id)
                  ->first();
                  ?>
                  <li>
                     <p> Subscription Type :</p>
                     <h3 class="ellipsis"><?php echo e($package->title); ?></h3>
                  </li>
                  <li>
                     <p>Start Date :</p>
                     <h3 class="ellipsis"><?php echo e(date('d M Y | H:i'  , strtotime($editdata->start_date))); ?></h3>
                  </li>
                  <li>
                     <p> End Date :</p>
                     <h3 class="ellipsis"><?php echo e(date('d M Y | H:i'  , strtotime($editdata->end_date))); ?></h3>
                  </li>
                  <?php else: ?>
                  <li>
                     <p> Subscription Type :</p>
                     <h3 class="ellipsis">No Subscription active</h3>
                  </li>
                  <?php endif; ?>

                  <li>
                     <p> Is Online :</p>
                     <h3><?php echo e(!empty($editdata->is_online)? 'Yes':'No'); ?></h3>
                  </li>

                  <li>
                     <p> Payon Arrival :</p>
                     <h3><?php echo e(!empty($editdata->debit_card)? 'Yes':'No'); ?></h3>
                  </li>

                  <li>
                     <p> Paypal :</p>
                     <h3><?php echo e($editdata->paypal); ?></h3>
                  </li>

                  <li>
                     <p> Bank Name :</p>
                     <h3><?php echo e($editdata->bankname); ?></h3>
                  </li>

                  <li>
                     <p> Account Holder Name :</p>
                     <h3 class="ellipsis"><?php echo e($editdata->account_holdername); ?></h3>
                  </li>

                  <li>
                     <p> Account Number :</p>
                     <h3><?php echo e($editdata->account_number); ?></h3>
                  </li>
                  <li>
                     <p> Description :</p>
                     <h3><?php echo e($editdata->description); ?></h3>
                  </li>

                  <li>
                     <p> Ratings & Reviews :  </p>
                     <h3>
                     <?php
                     for ($i = 0; $i < 5; $i++) {
                        $checked = '';
                        if ($i < $starRating) {
                           $checked = 'checked';
                        }
                        ?>
                        <span class="fa fa-star <?php echo $checked; ?>"></span>
                        <?php } ?>&nbsp;&nbsp; <?php echo e($numberofreview); ?> Reviews
                      </h3>
                     
                  </li>
                  <?php 
                  // foreach ($bookings as $key => $service) {
                  //    echo $service->status;
                  // }
                  ?>

               </ul>
            </div>
         </div>
      </div>
      <div class="col-md-12">
         <!-- Tab links -->
         <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'Services')">Services</button>
            <button class="tablinks" onclick="openCity(event, 'Requests')">Requests</button>
         </div>
         <!-- Tab content -->
         <div id="Services" class="tabcontent">
            <table id="datatable-responsive" class="table table-striped table-bordered" style="border: none;">
               <thead>
                  <tr>
                     <th>Adventure ID</th>
                     <th>Adventure Name</th>
                     <th>Country/Region</th>
                     <th>Participants</th>
                     <th>Availability</th>
                     <th>Total Cost</th>
                     <th>Receivable</th>
                     <th>Reviews</th>
                     <th>Actions</th>
                  </tr>
               </thead>
               <tbody>
                  <?php 
                  foreach ($services as $key => $service) {

                  ?>
                     <tr class="gradeX">
                        <td><?php echo e($key+1); ?></td>
                        <td><?php echo e($service->adventure_name); ?></td>
                        <td><?php echo e($service->country.' / '.$service->region); ?></td>
                        <td><a href=""><?php echo e($service->participants .' Participant'); ?></a></td>
                        <td>
                           <?php if($service->service_plan =='1'){
                              $availabilityData = DB::table('service_plan_day_date as spd')
                              ->join('weekdays as wd', 'spd.day', '=', 'wd.id')
                              ->select(['wd.*'])
                              ->where('spd.service_id', $service->id)
                              ->get();
                              foreach($availabilityData as $days){ ?>
                                 <li>
                                    <?php echo $days->day; ?>
                                 </li>
                              <?php }
                           }else{
                           echo  date('d M Y | H:i', strtotime($service->start_date))  ." - " .  date('d M Y | H:i', strtotime($service->end_date)) ;
                           }
                           ?>

                        </td>
                        <td> OMR <?php echo e($service->totalAmount); ?> </td>
                        <td>OMR <?php echo $service->totalAmount*50/100;?> </td>
                        <td>Reviews</td>
                        <td>
                           <ul class="edit_icon action_icons dashboard_icons">
                              <li><a href="<?php echo e(URL::to('/service/view/'.$service->id)); ?>" class="bg-black"><i class="fa fa-eye"></i></a></li>
                              <li><a href="<?php echo e(URL::to('/')); ?>" onclick="return confirm('Are you sure you want to edit this item ?')" class="bg-green"><i class="fa fa-pencil"></i></a></li>
                              <li><a href="<?php echo e(URL::to('/service/detele/'.$service->id)); ?>" onclick="return confirm('Are you sure you want to delete this request ?')" class="bg-red"><i class="fa fa-trash"></i></a></li>
                           </ul>
                        </td>
                     </tr>
                  <?php } ?>
               </tbody>
            </table>
         </div>

         <div id="Requests" class="tabcontent">
            <table id="datatable-responsive" class="table table-striped table-bordered" style="border: none;">
               <thead>
                  <tr>
                     <th>Requested ID</th>
                     <th>Adventure</th>
                     <th>User Name</th>
                     <th>Country</th>
                     <th>Nationality</th>
                     <th>Registrations</th>
                     <th>Total Cost</th>
                     <th>Req. Date</th>
                     <th>Status</th>
                     <th>Actions</th>
                  </tr>
               </thead>
               <tbody>
                  <?php foreach ($bookings as $key => $service) {
                     if($service->nationality_id !='0'){
                        $nationalityData = DB::table('countries')->where('id', $service->nationality_id)->first();
                       $nationality =  $nationalityData->short_name;
                     }else{
                        $nationality='';
                     }
                     ?>
                     <tr class="gradeX">
                        <td><?php echo e($key+1); ?></td>
                        <td><a href="<?php echo e(URL::to('/service/view/'.$service->id)); ?>"><?php echo e($service->adventure_name); ?></a></td>
                        <td><a href="<?php echo e(URL::to('/view-adventure-user/'.$service->client_id)); ?>"><?php echo e($service->customer); ?></a></td>
                        <td><?php echo e($service->country); ?></td>
                        <td><?php echo e($nationality); ?></td>
                        <td> <?php echo e($service->adult); ?>  Adults, <?php echo e($service->kids); ?> Youngsters</td>
                        <td>$ <?php echo e($service->total_cost); ?></td>
                        <td>  <?php echo e(date('d M Y | H:i', strtotime($service->required_at))); ?></td>
                        <td>
                           <?php 
                           // 0=Pending/Requested,1=Accepted,2=Payment Done,3=Cancelled,4= Completed   
                           if ($service->status =='0' ) { ?>
                              <span class="text-yellow">Requested</span>
                           <?php } elseif ($service->status =='1') { ?>
                              <span class="text-blue">Accepted</span>
                           <?php } elseif ($service->status =='3') { ?>
                              <span class="text-red">Cancelled</span>
                           <?php }elseif($service->status =='4') { ?>
                              <span class="text-green">Cancelled</span>
                           <?php }else{?>
                              <span class="text-green">Payment Done</span>
                           <?php }
                           ?>
                        </td>
                        <td>
                           <ul class="edit_icon action_icons dashboard_icons">
                              <li><a href="<?php echo e(URL::to('/service/view/'.$service->id)); ?>" class="bg-black"><i class="fa fa-eye"></i></a></li>
                              <li><a href="<?php echo e(URL::to('/')); ?>" onclick="return confirm('Are you sure you want to edit this item ?')" class="bg-green"><i class="fa fa-pencil"></i></a></li>
                              <li><a href="<?php echo e(URL::to('/service/detele/'.$service->id)); ?>" onclick="return confirm('Are you sure you want to delete this request ?')" class="bg-red"><i class="fa fa-trash"></i></a></li>
                           </ul>
                        </td>
                     </tr>
                  <?php } ?>
               </tbody>
            </table>
         </div>


      </div>



   </div><!-- container -->
</div>

<script type="text/javascript">
   function openCity(evt, cityName) {
      // Declare all variables
      var i, tabcontent, tablinks;

      // Get all elements with class="tabcontent" and hide them
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
      }

      // Get all elements with class="tablinks" and remove the class "active"
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
         tablinks[i].className = tablinks[i].className.replace(" active", "");
      }

      // Show the current tab, and add an "active" class to the button that opened the tab
      document.getElementById(cityName).style.display = "block";
      evt.currentTarget.className += " active";
   }
</script>
<script type="text/javascript">
   $(".chosen-select").chosen({
      no_results_text: "Oops, nothing found!"
   })
</script>
<!-- Script for datepicker -->
<script type="text/javascript">
   $(function() {
      $('.date-pick').datePicker()
      $('#dt1').bind(
         'dpClosed',
         function(e, selectedDates) {
            var d = selectedDates[0];
            if (d) {
               d = new Date(d);
               $('#dt2').dpSetStartDate(d.addDays(1).asString());
            }
         }
      );
      $('#dt2').bind(
         'dpClosed',
         function(e, selectedDates) {
            var d = selectedDates[0];
            if (d) {
               d = new Date(d);
               $('#dt1').dpSetEndDate(d.addDays(-1).asString());
            }
         }
      );
   });
</script>

<script>
   $(window).load(function() {
      $('.togBtn').click(function() {
         var btnId = $(this).attr('id');
         var ret = btnId.split("_");
         var id = ret[1];
         var status = $(this).val(); 
         console.log(status);
         if (status == 1) {
            var changedStatus = $(this).val('0');
            var statusNew = changedStatus.attr('value');
            var textStatus = $("#statusText_" + id).text("InActive"); //console.log("text"+textStatus.text());
            $("#statusText_" + id).removeClass("badge-success").addClass("badge-danger");
         } else {
            var changedStatus = $(this).val('1');
            var statusNew = changedStatus.attr('value');
            var textStatus = $('#statusText_' + id).text('Active'); //console.log("text_in"+textStatus.text());
            $("#statusText_" + id).removeClass("badge-danger").addClass("badge-success");
         }
         let _token = $('meta[name="csrf-token"]').attr('content');
         $.ajax({
            url: "<?php echo e(url('update-partner-status')); ?>" + '/' + id,
            method: "GET",
            contentType: 'application/json',
            headers: {
               'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
               "id": id,
               "status": statusNew,
               "become": 1,
            },
            success: function(response) {
               console.log(response);
            }
         });
      });
   });
</script>
<script type="text/javascript">
   $(document).ready(function() {
      //Get the total rows
      $('.table-striped').each(function() {
         var title = $(this).text();
         $(this).html('<input type="text" placeholder="' + title + ' Search" />');
      });
      var table = $('table ').dataTable({
         searching: true,
         paging: true,
         info: false, // hide showing entries
         ordering: true, // hide sorting
         columnDefs: [{
            orderable: false,
            targets: "no-sort"
         }],
         bLengthChange: false, // hide showing entries in dropdown
         "dom": '<"pull-left"f><"pull-right"l>tip', //align search to left
         "language": {
            "search": "_INPUT_",
            "searchPlaceholder": "Search here...",
            "paginate": {
               previous: '&#x3c;', // or '<'
               next: '&#x3e;' // or '>' 
            },
         }
      });

      $('#datatable-responsive .pull-right ').append('<div class="dataTables_length"><label for="Total Users">Total Users : ' + table.fnGetData().length + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></div>');
      $('.pull-right .dataTables_length').css({
         'font-size': '15px',
         'color': '#fff'
      });
      $('#datatable-responsive').
      css({
         'background': '#7CA7BB',
         'background-repeat': 'no-repeat',
         'padding': '10px 0px 0px 0px',
         'font-size': '18px',
         'color': '#fff',
         'border-radius': '8px 8px 0px 0px',
      });

      $('#datatable-responsive').css({
         "border": "0px",
         "margin-bottom": "0px !important",
      });

      $('#datatable-responsive_paginate').css({
         'background': '#fff'
      });

      $('.dataTables_filter input[type="search"]').
      css({
         'width': '250px'
      });
   });

   /* Status toggle starts */
 
   /* Status toggle ends */
   function editRecords(id) {
      $.ajaxSetup({
         headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
      });

      $.ajax({
         url: "<?php echo e(url('user/role/edit/')); ?>" + '/' + id,
         method: "POST",
         contentType: 'application/json',
         success: function(data) {
            $('#unique-model').modal('show');
            document.getElementById("ids").value = data.id;
            document.getElementById("username").value = data.username;
            document.getElementById("email").value = data.email;
            document.getElementById("password").value = data.password;
            var val = data.status;

            if (val == 1) {
               $('input[name=status][value=' + val + ']').prop('checked', true);
            } else {
               $('input[name=status][value=' + val + ']').prop('checked', true);
            }
            document.getElementById("submitbtn").innerText = 'UPDATE';
         }
      });
   }

   function addRecords() {
      document.getElementById("FormValidation").reset();
      document.getElementById("submitbtn").innerText = 'Save';
      $('#unique-model').modal('show');
   }
</script><?php /**PATH /home/advent12/public_html/admin/resources/views/admin/adventure_partners/view_adventure_partner.blade.php ENDPATH**/ ?>