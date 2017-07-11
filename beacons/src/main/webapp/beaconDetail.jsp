<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Beacons Details | Ciweb</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
<style>
td img { width: 100%; }
#map{height:500px; left-margin: 50px;}
.copyright { position:absolute; bottom:0.1px; color:#fff; text-align:center; font-size:85%; }
.avatar { width: 40px; height: 40px; position: relative; margin-top: -13px; margin-bottom: -11px; margin-right: 10px;}
.img-circle {border-radius:50%; width: 60px; height: 60px;}
.pic {border-radius:50%; width: 50px; height: 50px;}
.controls { background-color: #fff; border-radius: 2px; border: 1px solid transparent; width: 400px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3); box-sizing: border-box; font-family: Roboto; font-size: 15px; font-weight: 300;
        height: 29px; margin-left: 17px; margin-top: 10px; outline: none; padding: 0 11px 0 13px; text-overflow: ellipsis;}
.controls:focus { border-color: #4d90fe; }
.title { font-weight: bold; }
#infowindow-content { display: none; }
#infowindow-content { display: inline; }
</style>
  <!--  <link rel="shortcut icon" href="dist/ico/minus.png"><img src="dist/img/user2-160x160.jpg" -->
<link rel="icon" href="dist/img/minus.png" type="image" sizes="16x16">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="dashboard.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">C</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg text-left">Ciweb Tech LLC</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
       <%--    <li class="dropdown user user-menu">
             <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs">${name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> 	
                 <p> ${name} <small></small> </p>	
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left"> <a href="profile" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right"> <a href="logout" class="btn btn-default btn-flat">Sign out</a> 
                </div> 
              </li>
            </ul>
          </li> --%>
           <li><img src="dist/img/user2-160x160.jpg" title="${name}" alt="${name}" class="pic"></li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          		aria-haspopup="true" aria-expanded="false"> ${name} <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<li class="user-header"> <p style="text-align:center;"> ${name} <small></small> </p> </li>
            <span class="glyphicon glyphicon-user" style="margin-left: 14px; color: #068ad6;"></span>
            <li><a href="profile" style="margin-left: 13px; margin-top: -24px;">Profile</a></li>
            <li role="separator" class="divider"></li>
             <span class="glyphicon glyphicon-edit" style="margin-left: 14px; color: #068ad6;"></span>
            <li><a href="changepassword" style="margin-left: 13px; margin-top: -24px;">  Change Password</a>
             <li role="separator" class="divider"></li>
             <span class="fa fa-sign-out" style="margin-left: 14px; color: #068ad6;"></span>
            <li><a href="logout" style="margin-left: 13px; margin-top: -24px;">Sign out</a>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
        	<%-- <p>${name}</p> --%>
        	<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div> <!--           
        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
        <div class="pull-left info">
          <p>${name}</p> <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu">
    	<li class="treeview"> <a href="dashboard.jsp"> <i class="glyphicon glyphicon-dashboard"></i> <span>Dashboard</span></a> </li>
    	<li class="treeview"> <a href="profile"> <i class="glyphicon glyphicon-user"></i> <span>Profile</span> </a> </li>
		<li class="treeview"> <a href="location.jsp"> <i class="fa fa-map-marker"></i> <span>Locations</span> </a> </li>
        <li class="treeview"> <a href="BeaconSuccess.jsp"> <i class="fa fa-signal"></i> <span>Beacons</span> </a> </li>
        <li class="treeview"> <a href="notification"> <i class="glyphicon glyphicon-bell"></i> <span>Notification</span></a></li>
        <li class="treeview">
          <a href=""><i class="fa fa-television"></i> <span>Channels</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           	<ul class="treeview-menu">
            	<li><a href="estimote.jsp"><i class="fa fa-circle-o"></i> Estimote</a></li>
            	<li><a href="googleapi.jsp"><i class="fa fa-circle-o"></i> Google API</a></li>
            </ul>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>  
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
<!--     <section class="content-header">
      <h1> iBeacon Detail </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="BeaconSuccess.jsp"><i class="fa fa-signal"></i> Beacons</a></li>
        <li class="active">Beacon Details</li>
      </ol>
    </section> -->
    <!-- Main content -->
    <section class="content">
    <!-- Default box -->
    <div class="box">
      <div class="box-body">
        <div class="container-fluid"> <a href="#edit" data-toggle="modal" class="btn btn-primary pull-right" >Edit Settings</a> 
   <!--        <div class="container-fluid"   style="margin-right: 10px">  <a href="location.jsp"  class="btn btn-primary pull-right" >Location</a> -->
          <!-- Modal -->
          <div id="edit" class="modal fade" role="dialog">
            <div class="modal-dialog"> 
              <!-- Modal content-->
       <form role="form" method="post" action="beaconDetail">
              <div class="modal-content">
                <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#device" data-toggle="tab" style="cursor:pointer">Device</a></li>
                    <li class=""><a data-target="#beacon" data-toggle="tab" style="cursor:pointer">iBeacon</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Name:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" value="${name1}" placeholder="Enter name" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Geo Locationn:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" value="${geolocation}" name="exampleInputEmail1" placeholder="Enter Geo Location" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Tags:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Tags" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Basic Battery Saving:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Super Battery Saving:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="beacon">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Proximity UUID:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Proximity UUID" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Major:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Major" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">minor:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter minor" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Secure UUID:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Custom Advertising Interval:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="Interval" class="col-sm-12">Interval:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="Interval" placeholder="Enter Interval" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Broadcasting Power:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>-30</option>
                            <option>-20</option>
                            <option>-16</option>
                            <option>-12</option>
                            <option>-8</option>
                            <option>-4</option>
                            <option>0</option>
                            <option>4</option>
                          </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                 <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit"  class="btn btn-primary">Save</button>
              </div>
              </div>
              </form>
            </div>
          </div>
        </div>
        <div style="width: 100%; text-align: center; margin: 30px auto;">  </div>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
         <img src="dist/img/beacon_blue.png" class="beaconimg" width="100">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Identifier</p>
              <p class="">Name</p>
              <p class="">Color</p>
              <p class="">Geo Location</p>
              <p class="">Indoor Location</p>
              <p class="">Tags</p>
              <p class="">Mesh Group</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="identifier"></p>
              <p id="name"></p>
              <p id="color"></p>
              <p id="geol"></p>
              <p id="inlocation"></p>
              <p id="tags"></p>
              <p id="mesh"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Smart Battery Saving</p>
              <p class="">Motion Detection</p>
              <p class="">Motion Only Broadcasting</p>
              <p class="">Motion Only Broadcasting Delay</p>
              <p class="">Flip To Sleep</p>
              <p class="">Eddystone Configuration Service</p>
              <p class="">Automatic Firmware Update</p>
              <p class="">Dark To Sleep</p>
              <p class="">Firmware Version</p>
              <p class="">Hardware Version</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="SmartBattery"></p>
              <p id="MotionDetection"></p>
              <p id="MotionBroadcasting"></p>
              <p id="MotionBroadDelay"></p>
              <p id="FlipSleep"></p>
              <p id="EddystoneConfig"></p>
              <p id="AutomaticFirm"></p>
              <p id="DarkSleep"></p>
              <p id="FirmwareVer"></p>
              <p id="HardwareVer"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2>Beacon Health Check</h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Battery Monitoring</p>
              <p class="">Remaining Battery Life</p>
            </div>
            <div class="col-sm-6 text-right rowbeacon pl">
              <p id="btrymonitrng"></p>
              <p id="btrylyf"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Beacon Fall Alert</p>
              <p class="">Beacon Missing Alert</p>
            </div>
            <div class="col-sm-6 text-right rowbeacon pl">
              <p id="fallalrt"></p>
              <p id="missingAlrt"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2>Broadcast Packets</h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
          <h3>Connection</h3>
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Broadcasting Power</p>
              <p class="">Advertising Interval</p>
              <p class="">Shake to Connect</p>
            </div>
            <div class="col-sm-6 pl text-right rowbeacon">
              <p id="power"></p>
              <p id="advertinterval"></p>
              <p id="shaketoconn"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2 id="ibeacon"></h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Proximity UUID</p>
              <p class="">Major</p>
              <p class="">Minor</p>
              <p class="">Security UUID</p>
            </div>
            <div class="col-sm-6 pl rowbeacon text-right">
              <p id="prouuid" style="font-size: 12px;padding-bottom: 13px;"></p>
              <p id="major"></p>
              <p id="minor"></p>
              <p id="secureuuid"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 pr rowbeacon">
              <p class="">Broadcasting Power</p>
              <p class="">Maximum Range</p>
              <p class="">Advertising Interval</p>
            </div>
            <div class="col-sm-6 pl rowbeacon text-right">
              <p id="brodpower"></p>
              <p id="maxrange"></p>
              <p id="advertintibeacon"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2 id="telemetry"></h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6 pull-right">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Broadcasting Power</p>
              <p class="">Maximum Range</p>
              <p class="">Advertising Interval</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="brodpowerTelemetry"></p>
              <p id="maxrangeTelemetry"></p>
              <p id="advertintTelemetry"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.box-body --> 
    </section>
    <!-- /.box-footer--> 
  </div>
  <!-- /.content --> 
  <footer class="main-footer" style="margin:0;bottom:0;padding: 7px; text-align:center;width:100%; position:relative">
   Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
  </footer>
<!-- Control Sidebar -->
</div>
<!-- /.content-wrapper -->
<!-- ./wrapper --> 
<!-- jQuery 2.2.3 --> 
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script  type="text/javascript">
$(document).ready(function() {
	var name ="<%=request.getParameter("identifier") %>";
	var settings = {
			  "async": true,
			  "crossDomain": true,
			   "url": "http://localhost:8080/beacons/beaconDetail",   
//				 "url": "http://45.114.79.187/beacons/beaconDetail",
			    "cache":false,
			      "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "d57f8b77-3232-0da8-fb17-7966407c71fb"
			  }
			}
	$.get( "beaconDetail", {identifier: "<%=request.getParameter("identifier")%>"},
            function(response) {
            	var myObj = JSON.parse(response);
            	var lat=myObj.shadow.location.latitude;
            	var img = JSON.parse(
        		"{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
                $('#identifier').append(myObj.identifier);
        		$('#name').append(myObj.shadow.name);
        		$('#color').append(myObj.color);
        		if(myObj.shadow.location.formatted_address===undefined ){ 
        			$('#geol').append(myObj.shadow.location.timezone);
        		}
        		else{
        			$('#geol').append(myObj.shadow.location.formatted_address);		
        		}
        		$('#inlocation').append(myObj.shadow.location.timezone);
        		$('#tags').append('-');
        		$('#mesh').append(myObj.mesh.name);
        		$('#SmartBattery').append(myObj.settings.general.smart_power_mode_enabled).html("On");
        		if(myObj.settings.general.motion_detection_enabled==false) {
        		 $('#MotionDetection').html("Off");
        		} else {
        		 $('#MotionDetection').html(myObj.settings.general.motion_detection_enabled);
        		}
        		if(myObj.settings.general.motion_only_enabled==false) {
        		 $('#MotionBroadcasting').html("Off");
        		} else {
        		 $('#MotionBroadcasting').html(myObj.settings.general.motion_only_enabled);
        		}
        		if(myObj.settings.general.flip_to_sleep_enabled==false) {
        		 $('#FlipSleep').html("Off");
        		} else {
        		 $('#FlipSleep').html(myObj.settings.general.flip_to_sleep_enabled);
        		}
        		if(myObj.settings.general.eddystone_configuration_service_enabled==false) {
        		 $('#EddystoneConfig').html("Off");
        		} else {
        		 $('#EddystoneConfig').html(myObj.settings.general.eddystone_configuration_service_enabled);
        		}
        		if(myObj.settings.general.automatic_firmware_update_enabled==false) {
        		 $('#AutomaticFirm').html("Off");
        		} else {
        		 $('#AutomaticFirm').html("On");
        		}
        		if(myObj.settings.general.dark_to_sleep_enabled==false) {
        		 $('#DarkSleep').html("Off");
        		} else {
        		 $('#DarkSleep').html(myObj.settings.general.dark_to_sleep_enabled);
        		}
        		$('#MotionBroadDelay').append(myObj.settings.general.motion_only_delay);
        		$('#FirmwareVer').append(myObj.status_report.firmware_version);
        		$('#HardwareVer').append(myObj.hardware_revision);
        		$('#btrymonitrng').append('-');
        		$('#btrylyf').append('-');
        		$('#fallalrt').append(myObj.alerts_configuration.beacon_fallen_notifications);
        		$('#missingAlrt').append(myObj.alerts_configuration.beacon_stolen_notifications);
        		$('#power').append(myObj.settings.advertisers.connectivity[0].power);
        		$('#advertinterval').append(myObj.settings.advertisers.connectivity[0].interval);
        		if(myObj.settings.advertisers.connectivity[0].shake_to_connect_enabled==false){
        			$('#shaketoconn').html("Off")
        			}else{$('#shaketoconn').append(myObj.settings.advertisers.connectivity[0].shake_to_connect_enabled);};
        		$('#prouuid').append(myObj.settings.advertisers.ibeacon[0].uuid);
        		$('#major').append(myObj.settings.advertisers.ibeacon[0].major);
        		$('#minor').append(myObj.settings.advertisers.ibeacon[0].minor);
        		$('#secureuuid').append('-'); //myObj.settings.advertisers.ibeacon[0].security.enabled.uuid
        		$('#brodpower').append(myObj.settings.advertisers.connectivity[0].power);
        		$('#maxrange').append('-');
        		$('#advertintibeacon').append(myObj.settings.advertisers.ibeacon[0].interval);
        		$('#brodpowerTelemetry').append(myObj.settings.advertisers.estimote_telemetry[0].power);
        		$('#maxrangeTelemetry').append('-');
        		$('#advertintTelemetry').append(myObj.settings.advertisers.estimote_telemetry[0].interval);
        		$("#ibeacon").append(myObj.settings.advertisers.ibeacon[0].name);
        		$("#telemetry").append(myObj.settings.advertisers.estimote_telemetry[0].name);
        
            });			
});
</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8sensor=false"></script>
<script type="text/javascript">
$(document).ready(function() {
var geocoder = new google.maps.Geocoder();
var address = "new york";
geocoder.geocode( { 'address': address}, function(results, status) {
  if (status == google.maps.GeocoderStatus.OK) {
    var latitude = results[0].geometry.location.lat();
    var longitude = results[0].geometry.location.lng();
    alert(latitude);
  } 
}); 
 
</script>
<!-- Bootstrap 3.3.6 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 
<!-- SlimScroll --> 
<script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script> 
<!-- FastClick --> 
<script type="text/javascript" src="plugins/fastclick/fastclick.js"></script> 
<!-- AdminLTE App --> 
<script type="text/javascript" src="dist/js/app.min.js"></script> 
<!-- AdminLTE for demo purposes --> 
<script type="text/javascript" src="dist/js/demo.js"></script>
</body>
</html>