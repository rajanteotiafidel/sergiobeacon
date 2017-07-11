<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" 
	content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Beacons</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" type="text/css" 
  	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" type="text/css" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" type="text/css" href="css/AdminLTE.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
  <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
  <style>
  	td img { width: 100%; }
  	.copyright { position:absolute; bottom:0.1px; color:#fff; text-align:center; font-size:85%; }
  	.avatar { width: 40px; height: 40px; position: relative; margin-top: -13px; margin-bottom: -11px; margin-right: 10px;}
    .img-circle {border-radius:50%; width: 60px; height: 60px;}
    .pic {border-radius:50%; width: 50px; height: 50px;}
    #map { height: 100%; width: 250px; }
    #locationField, #controls { position: relative; }
    .controls { background-color: #fff; border-radius: 2px; border: 1px solid transparent; width: 400px; 
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3); box-sizing: border-box; font-family: Roboto; font-size: 15px; font-weight: 300;
        height: 29px; margin-left: 17px; margin-top: 10px; outline: none; padding: 0 11px 0 13px; text-overflow: ellipsis; }
    .controls:focus { border-color: #4d90fe; }
    .title { font-weight: bold; }
    #infowindow-content { display: inline; }
	#map1 {height: calc(100vh - 150px); min-height: 100%;overflow-x: auto;overflow-y: auto;}
    .search { height: calc(100vh - 150px); min-height: auto; overflow: auto; margin-left:-20px;width:370px}
    .searchbox{float:left; border-radius: 0px margin-top: 0px;margin-left: 0px;margin-bottom: -15px; width:265px;border-color: white;    margin-top: -2px;}
	.pluscustom{float:right;border: 0;background: none;padding-top: 8px;padding-bottom: 8px;padding-left:25px;}
	@media (min-width: 800px) { .col-sm-8 {width: 66.66666667%;}}
	#myTable tr{cursor:pointer;}
	.p0{padding: 0 !important;}
	.inputcustom{border:1px solid #ccc; padding:3px; margin-bottom:5px;}
	.mb14{margin-bottom:14px;}
	.searchlist { height: calc(100vh - 150px); min-height: auto; overflow: auto; }
	.addbutton { padding-top: 3px; padding-left:15px; padding-right: 20px; height: 25px; font-size: 12px; line-height: 1.5; 
			border-radius: 0px; border-left-color: white; margin-top:-2px; margin-left:8px; padding-bottom:7px}
	.text-center {text-align:center;}
</style>
<!-- favicon icon -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
<link rel="icon" href="dist/img/r1.jpg" type="image" sizes="16x16">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="BeaconSuccess.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">MGB</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg text-left">MainGoesBig</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
<!--       <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Beacons</li>
      </ol>
    </section> -->
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li><img src="dist/img/defaultuser.png" title="${name}" alt="${name}" class="pic"></li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          		aria-haspopup="true" aria-expanded="false"> ${name} <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<li class="user-header"> <p style="text-align:center;"> ${name} <small></small> </p> </li>
            <li><a href="profile">Profile</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="logout">Sign out</a></li>
          </ul>
        </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" >
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image"> 
        	<img src="dist/img/defaultuser.png" title="${name}" alt="${name}" class="pic">
        </div> 
        <div class="pull-left info"> <p>${name}</p> </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
<!--        <li class="treeview"> <a href="index"> <i class="fa fa-dashboard"></i> <span>Location</span> </a> </li> -->
       <li class="treeview"> <a href="BeaconSuccess.jsp"> <i class="fa fa-signal"></i> <span>Beacons</span> </a> </li>
<!--        <li class="treeview"> <a href="nearable.jsp"> <i class="fa fa-road"></i> <span>Nearables</span> </a> </li>
       <li class="treeview"> <a href="app.jsp"> <i class="fa fa-bolt"></i> <span>App</span> </a> </li>
       <li class="treeview"> <a href="location.jsp"> <i class="fa fa-location-arrow"></i> <span>Locations</span> </a> </li>
       <li class="treeview">
          <a href="">
            <i class="fa fa-map-o"></i> <span>Here & Now</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
          <ul class="treeview-menu">
            <li><a href="beacon.jsp"><i class="fa fa-circle-o"></i> Beacon</a></li>
            <li><a href="links.jsp"><i class="fa fa-circle-o"></i> Links</a></li>
          </ul>
          </a>
        </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-connectdevelop"></i> <span>Analytics</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           <ul class="treeview-menu">
            <li><a href="analytics.jsp"><i class="fa fa-circle-o"></i> Analytics</a></li>
            <li><a href="dwelltime.jsp"><i class="fa fa-circle-o"></i> Dwell Time</a></li>
            <li><a href="location.jsp"><i class="fa fa-circle-o"></i> Locations</a></li>
            <li><a href="loyalty.jsp"><i class="fa fa-circle-o"></i> Loyalty</a></li>
            <li><a href="tags.jsp"><i class="fa fa-circle-o"></i> Tags</a></li>
            <li><a href="univisitors.jsp"><i class="fa fa-circle-o"></i> Unique Visitors</a></li>
            <li><a href="visits.jsp"><i class="fa fa-circle-o"></i> Visits</a></li>
          </ul>
          </a>
        </li> -->
        <li class="treeview"> <a href="profile"> <i class="fa fa-signal"></i> <span>Profile</span> </a> </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-television"></i> <span>Channels</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           	<ul class="treeview-menu">
            	<li><a href="googleapi.jsp"><i class="fa fa-circle-o"></i> Google API</a></li>
            </ul>
          </a>
        </li>
        <li style="position:absolute; bottom:10px; color:#fff; text-align:center; font-size:85%;">
        	Copyright &copy; 2017 MainGoesBig <br>All rights reserved.
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="min-height:598px;">
  	<section class="content" style="height:300px;padding-right:5px;margin-left:-5px">
        <div id="detail" class="modal fade" role="dialog">
            <div class="modal-dialog"> 
              Modal content
              <form method="post" action="beacondet" id="beacondet">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#add" data-toggle="tab" style="cursor:pointer">Details</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                      <div class="text-center">
                      	<img src="dist/img/Beacon.jpg" class="beaconimg" width="100" >
                      	</div>
                      	<div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Beacon Name :</label>
                          <div class="col-sm-12" id="locationField">
                          <input class="form-control" type="text" name="bn" id="bn" value="" autofocus>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Advertised Id :</label>
                          <div class="col-sm-12">
							<input class="form-control" name="atype" id="atype" type="text" value="" >
                          </div><br><br>
                          <div class="col-sm-12">
                          <input class="form-control" name="aid" id="aid" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Status :</label>
                          <div class="col-sm-12" id="locationField">
                          <input class="form-control" type="text" name="stats" id="stats" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Place ID :</label>
                          <div class="col-sm-12" id="locationField">
                          	<input class="form-control" name="placid" id="placid" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Co-ordinates :</label>
                          <div class="col-sm-12">
                          <input class="form-control" name="lati" id="lati" type="text" value="">
                          </div>
                          <div class="col-sm-12">
                          <input class="form-control" name="longi"id="longi" type="text" value="">
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Indoor Level :</label>
                          <div class="col-sm-12" id="locationField">
                          	<input class="form-control" name="ilname" id="ilname" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Expected Stability :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="stabily" id="stabily" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Description :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="descrip" id="descrip" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Properties :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="pname" id="pname" type="text" value="" >
                          </div>
                          <div class="col-sm-12">
                          	<input class="form-control" name="pplace" id="pplace" type="text" value="" >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save Changes</button>
              	</div>
              </div>
              </form>
            </div>
          </div> 
		<div id="add" class="modal fade" role="dialog">
            <div class="modal-dialog"> 
              <!-- Modal content-->
              <form method="post" action="addBeacon" id="addbeacon">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#add" data-toggle="tab" style="cursor:pointer">Add Details</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Advertised Id :</label>
                          <div class="col-sm-12">
								<select id="aidtype" name="aidtype" form="addbeacon" class="form-control" required autofocus>
									<option>---Select Type---</option>
									<option value="EDDYSTONE" autofocus>EDDYSTONE</option>
									<option value="iBEACON">iBEACON</option>
									<option value="ALTBEACON">ALTBEACON</option>
									<option value="EDDYSTONE-EID">EDDYSTONE-EID</option>
								</select>
                          </div><br><br>
                          <div class="col-sm-12">
                          <input class="form-control" name="aidid" id="aidid" placeholder="Enter Base64 ID" type="text" required>
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Address :</label>
                          <div class="col-sm-12" id="locationField">
                          <input class="form-control col-sm-12" type="text" name="address" id="address" value="" 
                          			placeholder="Enter beacon address" onFocus="geolocate()" required>
                          <input class="form-control" name="placeid" id="placeid" type="hidden" value="" >
                          <input class="form-control" name="addi" id="addi" type="hidden" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Co-ordinates :</label>
                          <div class="col-sm-12">
                          <input class="form-control" name="latitude" id="latitude" placeholder="Enter Latitude" type="text" readonly required>
                          </div>
                          <div class="col-sm-12">
                          <input class="form-control" name="longitude"id="longitude" placeholder="Enter Longitude" type="text" readonly required>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Expected Stability :</label>
                          <div class="col-sm-12">
                          	<select id="stability" name="stability" required form="addbeacon" class="form-control">
								<option>---Select Stability---</option>
								<option value="STABLE">STABLE</option>
								<option value="PORTABLE">PORTABLE</option>
								<option value="MOBILE">MOBILE</option>
								<option value="ROVING">ROVING</option>
							</select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
              	</div>
              </div>
              </form>
            </div>
          </div>
          <div class="col-sm-12"style="height:190%;padding-right:2px;padding-left:10px">
          	<div class="col-sm-4 pl panel searchlist" id="hidecol" style="width:425px;margin-left:-15px;height:105%">
				<div style="display: inline-flex; width: 100%; margin-top:10px; margin-bottom:10px;" class="">
					<input class="searchbox search form-control mb20 mt10" type="text" onkeyUp="myFunction()"
							placeholder="Search ... " id="myInput" autofocus style="border-color: #068ad6; 
							border-radius: 0px; background-color: white; margin-left:5px; height:25px;width:325px">
					<button data-target="#add" data-toggle="modal" type="button" class="btn btn-primary btn-sm  addbutton"
							style="border-radius: 0px; margin-bottom: 1; padding-bottom: 7px; border-left:0px;
							padding-top: 4px; padding-left: 15px; padding-right: 20px;
							border-left-color: white; color: white; ">
						<span class="glyphicon glyphicon-plus-sign">  Add  </span>
					</button>
				</div>
				<div>
					<table id="myTable" class="table table-bordered table-striped">
						<tbody style="font-size: 13px; overflow-x: hidden;" id="beacondetail"> </tbody>
					</table></div>
				</div>
			<div class="col-sm-8 pr" style="width:675px;padding-right:0px;padding-left:5px;height:105%">
			<div id="map1"></div>
		</div>
	</div>
</section>
<section class="content"> </section> 
</div>
<!-- /.content -->
<!-- /.content-wrapper -->
 </div>
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script type="text/javascript" src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript" src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script type="text/javascript" src="dist/js/demo.js"></script>
<!-- page script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var settings = {
		  "async": true,
		  "crossDomain": true,
	//   "url": "http://45.114.79.187/beacons/beaconSuccess",
          "url": "http://localhost:8080/beacons/beaconSuccess", 
 		  "cache": false,
		  "method": "GET",
		  "headers": {
		    "cache-control": "no-cache",
		    "postman-token": "bebf12a5-6901-8b78-2b26-1cec2d6e7aa7"
		  }
		}
		$.ajax(settings).done(function (response) {
			//console.log("1 "+response);
			var addy="";
			//console.log("2 "+addy);
			function address(add){
				   addy=add.results[0].formatted_address;
			   //	   console.log("4 "+addy);
			}
		   var content = "";
			var x=0;
			var bc = JSON.parse(response.toString());
			var ac = bc.beacons[0];
			console.log(bc);
			console.log("ac=="+ac);
		 	$.each(ac, function(i, item) {
		 	   if(x==bc.totalCount) {return false;}
		 	   x++;
		 	  var llt = ac.latLng.latitude;
			   var llg = ac.latLng.longitude;
			   var settings1 = {
 					"async": true,
 					"crossDomain": true,
 					"url": "https://maps.googleapis.com/maps/api/geocode/json?latlng="+llt+"%2C"+llg+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8",
 					"method": "GET",
 					"cache":false,
 					"headers": { }
				}
				$.ajax(settings1).done(function (response) {
 					console.log(response);
 					addy=response.results[0].formatted_address;
 			   	   console.log("4 "+addy);
				});
			   	var ab = bc.beacons[i];
			   	var bn = ac.beaconName;
			   	var at = ac.advertisedId.type;
			   	var ai = ac.advertisedId.id;
			   	var s = ac.status;
			   	var p = ac.placeId;
				console.log("5 "+addy);
				var iln = ac.indoorLevel.name;
				var ex = ac.expectedStability;
				var des = ac.description;
				var pn = ac.properties.Name;
				var pp = ac.properties.Place;
				console.log(ac);
			    content += "<tr data-target='#detail' data-toggle='modal' onclick='bd(\""+bn+"\")' onmouseover=myMap(\"" + llt + "," + llg + "\");>"
	 	 						+"<td style='padding-left:10px'>" + bn + ""
	 	 						+"<br>" + addy + "</td>"
			         			+"<td style='padding-left:2px'><img src=dist/img/Beacon.jpg></td>"
							+"</tr>";
			   });
			$('#beacondetail').append(content);
	 	 });
	});
</script>
<script >
function bd(bn) {
	$.post("http://localhost:8080/beacons/oneBeacon", { 
//	$.post("http://45.114.79.187/beacons/oneBeacon", {
			bn : bn
	},  function(response) {
		  console.log(response);
		  var bd = JSON.parse(response.toString());
		  console.log(bd);
		  	$('#bn').val(bd.beaconName);
			$('#atype').val(bd.advertisedId.type);
			$('#aid').val(bd.advertisedId.id);
			$('#stats').val(bd.status);
			$('#placid').val(bd.placeId);
			$('#lati').val(bd.latLng.latitude);
			$('#longi').val(bd.latLng.longitude);
			$('#ilname').val(bd.indoorLevel.name);
			$('#stabily').val(bd.expectedStability);
			$('#descrip').val(bd.description);
			$('#pname').val(bd.properties.Name);
			$('#pplace').val(bd.properties.Place); 
		});
}
function myFunction() {
	  // Declare variables 
	  alert("Hiiiiii");
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  alert("1");
	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
		  alert("2");
	  }
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	
</script>
<!-- <script>
		var map;
		function myMap(lat, lng) {
			var myCenter = new google.maps.LatLng(lat, lng);
			var mapCanvas = document.getElementById("map");
			var mapOptions = {
				center : myCenter,
				zoom : 11
			};
			var map = new google.maps.Map(mapCanvas, mapOptions);
			var marker = new google.maps.Marker({
				position : myCenter
			});
			marker.setMap(map);
			// Zoom to 9 when clicking on marker
			google.maps.event.addListener(marker, 'click', function() {
				map.setZoom(9);
				map.setCenter(marker.getPosition());
			});
		}
</script>
<script type="text/javascript" 
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&libraries=places&callback=myMap"
		async defer></script> -->
<script type="text/javascript">
 function myMap() {
	  var myCenter = new google.maps.LatLng(18.5643478,73.781288);
	  var mapCanvas = document.getElementById("map1");
	  var mapOptions = {center: myCenter, zoom: 10};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	  google.maps.event.addListener(marker,'click',function() {
	    map.setZoom(5);
	    map.setCenter(marker.getPosition());
	  });

        var input = document.getElementById('addi');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map); 
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({ map: map });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
         autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }
          // Set the position of the marker using the place ID and location.
          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);
          var x = place.place_id;
          var y = place.formatted_address;
          console.log("x "+x);
		  console.log("y "+y); 
		  document.getElementById("pid").value = x;
		  document.getElementById("add").value = y;
		  infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-id'].textContent = x;
          infowindowContent.children['place-address'].textContent = x;
          infowindow.open(map, marker);
        });
         google.maps.event.addDomListener(window, "load", myMap);
      }
</script>
<script>
var autocomplete;
var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };
function initAutocomplete() {
	myMap();
	var myCenter = new google.maps.LatLng(18.5643478,73.781288);
	  var mapCanvas = document.getElementById("map1");
	  var mapOptions = {center: myCenter, zoom: 10};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	  google.maps.event.addListener(marker,'click',function() {
	    map.setZoom(5);
	    map.setCenter(marker.getPosition());
	  });
	  
	var input = document.getElementById('address');
	autocomplete = new google.maps.places.Autocomplete( (input), {types: ['geocode']});
	console.log(autocomplete);
	autocomplete.bindTo('bounds', map);
    autocomplete.addListener('place_changed', fillInAddress);
  }
  function fillInAddress() {
    var place = autocomplete.getPlace();
/*     for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
    } 
    for (var i = 0; i < place.address_components.length; i++) {
      var addressType = place.address_components[i].types[0];
      if (componentForm[addressType]) {
         var val = place.address_components[i][componentForm[addressType]];
         document.getElementById(addressType).value = val;
      }
    } */
      
    var x = place.place_id;
    var y = place.formatted_address;
	document.getElementById("placeid").value = x;
	document.getElementById("address").value = y;
	var a = y.replace(/,/g, "");
    console.log(a);
    var settings = {
    		  "async": true,
    		  "crossDomain": true,
    		  "url": "https://maps.googleapis.com/maps/api/geocode/json?address=%20"+a+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&sensor=true",
    		  "method": "GET",
    		  "Access-Control-Allow-Origin": "",
    		  "headers": {}
    		}
    		$.ajax(settings).done(function (response) {
	   		  console.log(response);
  			var ab = response.results;
  			var bc = ab[0];
  			var cd = bc.geometry;
  			var de = cd.location;
  			document.getElementById("latitude").value = de.lat;
  			document.getElementById("longitude").value = de.lng;
    		});
  }
  function geolocate() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var geolocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          var circle = new google.maps.Circle({
            center: geolocation,
            radius: position.coords.accuracy
          });
          autocomplete.setBounds(circle.getBounds());
        });
      }
    }
</script>
<script type="text/javascript" 
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&libraries=places&callback=initAutocomplete"
        async defer></script>
<script type="text/javascript">
	var init = function() {
	    var email = "<%= (String)session.getAttribute("email")%>";
	    if(email === "null") {
	    	window.location.href="login.jsp";
	    	var i=true;
	    } else if(i) {
	    	if (email != "null") {
	    	i=false;
	    	window.location.href="BeaconSuccess.jsp";
	    	}
	    }
	    init = true;
	};
	if(init) { init(); }
</script>
</body>
</html>
