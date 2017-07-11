<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Location</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" type="text/css"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css"
	href="dist/css/skins/_all-skins.min.css">
	
<style>
td img {
	width: 40px
}
#myTable td{ width:40px}
#map {
	height: 500px;
}

.copyright {
	position: absolute;
	bottom: 0.1px;
	color: #fff;
	text-align: center;
	font-size: 85%;
}

#map {
	height: 500px;
	left-margin: 50px;
}

.copyright {
	position: absolute;
	bottom: 0.1px;
	color: #fff;
	text-align: center;
	font-size: 85%;
}

.avatar {
	width: 40px;
	height: 40px;
	position: relative;
	margin-top: -13px;
	margin-bottom: -11px;
	margin-right: 10px;
}

.img-circle {
	border-radius: 50%;
	width: 60px;
	height: 60px;
}

.pic {
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

.controls {
	background-color: #fff;
	border-radius: 2px;
	border: 1px solid transparent;
	width: 400px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	box-sizing: border-box;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	height: 29px;
	margin-left: 17px;
	margin-top: 10px;
	outline: none;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

.addbutton {
	padding: 7px 13px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 0px;
	border-color: #0291e4;
	border-left-color: white;
	background-color: #159cea;
}

#infowindow-content {
	display: none;
}

#infowindow-content {
	display: inline;
}

#map {
	height: calc(100vh - 150px);
	min-height: 100%;
}

.searchlist {
	height: calc(100vh - 150px);
	min-height: auto;
	overflow: auto;
}

.searchbox {
	float: left;
	border-radius: 0px margin-top: 0px;
	margin-left: 0px;
	margin-bottom: -15px;
	width: 265px;
	border-color: #068ad6;
	margin-top: 0px;
}

.pluscustom {
	float: right;
	border: 0;
	background: none;
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 5px;
}

#myTable tr{cursor:pointer;}
.p0{padding: 0 !important;}
.inputcustom{border:1px solid #ccc; padding:3px; margin-bottom:5px;}
.mb14{margin-bottom:9px; text-align: left;word-break: break-word;}
.btn-custom{border-radius: 0px; margin-top: 0px; margin-bottom: 1; padding-bottom: 7px; padding-top: 7px; padding-left: 15px; padding-right: 20px; border-color: #068ad6; border-left-color: white; color: white; background-color: #068ad6;}
</style>
<!-- favicon icon -->


<link rel="icon" href="dist/img/minus.png" type="image" sizes="16x16">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body 
	class="hold-transition skin-blue sidebar-mini  style="padding-right: 0px;"">
	    
	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> <a
			href="location.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini">C</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg text-left">Ciweb Tech LLC</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a> <!-- Navbar Right Menu -->
		<div class="navbar-custom-menu" style="background-color: #068ad6">
			<ul class="nav navbar-nav">
				<%--   <li class="dropdown user user-menu">
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
				<li><img src="dist/img/user2-160x160.jpg" title="${name}"
					alt="${name}" class="pic"></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> ${name} <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="user-header">
							<p style="text-align: center;">
								${name} <small></small>
							</p>
						</li>
						<li><a href="profile">Profile</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="logout">Sign out</a></li>
					</ul></li>
			</ul>
		</div>
		</nav> </header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user2-160x160.jpg" class="img-circle"
					alt="User Image">
				<%--  <p>${name}</p> --%>
			</div>
			<div class="pull-left info">
				<p>${name}</p>
				<!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">

			<li class="treeview"><a href="BeaconSuccess.jsp"> <i
					class="fa fa-signal"></i> <span>Beacons</span>
			</a></li>
			<li class="treeview"><a href="location.jsp"> <i
					class="fa fa-dashboard"></i> <span>Location</span>
			</a></li>

			<li class="treeview"><a href="profile"> <i
					class="fa fa-signal"></i> <span>Profile</span>
			</a></li>
			<li class="treeview"><a href=""> <i class="fa fa-television"></i>
					<span>Channels</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
					<ul class="treeview-menu">
						<li><a href="estimote.jsp"><i class="fa fa-circle-o"></i>
								Estimote</a></li>
						<li><a href="googleapi.jsp"><i class="fa fa-circle-o"></i>
								Google API</a></li>
					</ul>
			</a></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">


			<section class="content"> <!-- <a href="" data-toggle="modal"
					class="btn btn-primary mb20 pull-right">Add Beacon</a> -->
			<div class="">

				<div class="col-sm-4 pl panel searchlist p0" id="hidecol">
<div class="col-sm-12" style="display: inline-flex; width: 100%; margin-top:10px; margin-bottom:10px;" class="">
							<input class="searchbox search form-control mb20 mt10" type="text" onkeyUp="myFunction()"
								placeholder="Search by Beacons Name... " id="myInput"
								style="border-color: #068ad6; border-radius: 0px; background-color: white";>
							<!-- <button data-target="#add" data-toggle="modal" class="glyphicon glyphicon-plus pluscustom" aria-hidden="true"></button> -->

							<!-- <button type="button" class="btn btn-default btn-sm  addbutton" style="border-radius: 0px;">
          <span class="glyphicon glyphicon-plus-sign"></span> Add </button> -->

							<button data-target="#add" data-toggle="modal" type="button"
								class="btn btn-default btn-sm  addbutton btn-custom">
								<span class="glyphicon glyphicon-plus-sign"></span> Add
							</button>
						</div>
				<div>
					<table id="myTable" class="table table-hover">
						

					<tbody style="font-size: 13px; overflow-x: hidden;"
							id="beacondetail">
					</tbody>
					</table></div>
					
				</div>
				
				<div class="col-sm-4 pl panel details panel-body" style="display:none; background-color:white; word-wrap:break-word; border-color: #068ad6;">
				<div class=""><a href="javascript:void(0)" onclick="closebtn()"><i class="fa fa-close pull-right"></i></a></div>
				<div class="col-sm-12">
				<div class="col-sm-12 beaconimg text-center" style="margin-bottom: 10px">
				<img id="imgbeacon" src="dist/img/beacon_blue.png" class="" width="100px">
				
				</div>
				</div>
            <div class="col-sm-12 rowbeacon p0">
              <div class="text-left col-sm-6 p0" style="">
              <p class="mb14"  style="margin-bottom: 27px">Identifier :</p>
              <p class="mb14" >Name :</p>
              <p class="mb14">Color :</p>
          <!--<p class="mb14" style="margin-bottom: 32px">Proximit UUID :</p> -->
              <p class="mb14" style="margin-bottom: 10px">Major :</p>
              <p class="mb14" style="margin-bottom: 10px">Minor :</p>
              <p class="mb14" style="margin-bottom: 10px">Firmware Version :</p>
              <p class="mb14" style="margin-bottom: 85px">Address :</p>
          <!--<p class="mb14" style="margin-bottom: 14px">Hardware Version :</p> -->
              
           <!--<p class="mb14">Indoor Location</p> -->
            <!--<p class="mb14" >Tags</p> -->
           <!--<p class="mb14">Mesh Group</p> -->
              </div>
              <div class="text-right col-sm-6 p0" id="editelements">
               <p id="identifier" class="mb14" style="margin-bottom:8px"></p>
               <input value="ddfw" class="inputid inputcustom" style="display:none" id="">
		              <p id="name" class="mb14"  ></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		              <p id="color" class="mb14"style="margin-bottom: 10px;"></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		             
		              <p id="prouuid" class="mb14"></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		              <p id="major" class="mb14" ></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		              <p id="minor" class="mb14"></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		              <p id="FirmwareVer" class="mb14" style="margin-bottom: 11px;"></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		               <p id="geol" class="mb14"></p>
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		         
		            <!--   <p id="inlocation" class="mb14"></p> -->
		              <input value="vgv" class="inputid inputcustom"  style="display:none" id="">
		            <!--   <p id="tags" class="mb14"></p> -->
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
		             <!--  <p id="mesh" class="mb14"></p> -->
		              <input value="vgv" class="inputid inputcustom" style="display:none" id="">
              </div>
         <a href="#edit" data-toggle="modal" class="btn btn-primary pull-right" >Edit Settings</a> 
        
            <!--   <a href="javascript:void(0)" class="btn btn-primary" onclick="editbeacon()">edit</a>   -->
             <!-- view deatils and edit Funcationlity --> 
    
   <!--  <i class="material-icons" style="font-size:48px;color:#068ad6;position:absolute;margin-top:242px;margin-left:-295px;
}">border_color</i>   -->       
 <!--  <button style="font-size:20px;color:white;position:absolute;
 margin-top:242px;margin-left:-295px;border-color:white; 
 background-color:#068ad6" >Edit <i class="material-icons" >border_color</i></button> --> 
   
   
 <!-- <input class="edit btn btn-primary" style="position:absolute;
 margin-top:270px;margin-left:-310px;"type="button" value="Edit" />   -->   
 
  
 
 <!-- <div class="container-fluid"> <a href="#edit" data-toggle="modal" class="btn btn-primary pull-right" >Edit Settings</a> --> 
   <!--  <input class="save btn btn-primary" type="button" value="Save" />
    <input class="cancel btn btn-primary" type="button" value="Cancel" /> -->
            </div> 
				
				</div>
				<div class="col-sm-8 pr">
					<div id="map"></div>
				</div>
			</div>
			</section>
			</section>
			<section class="content">
			<div class="container-fluid">
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
				<div id="add" class="modal fade" role="dialog">
					<div class="modal-dialog">
						
						<form method="post" action="addBeacon" id="addbeacon">
							<div class="modal-content">
								<div class="modal-body">
									<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a data-target="#add"data-toggle="tab" style="cursor: pointer">Add Details</a></li>
		<li class=""><a data-target="#beacon" data-toggle="tab" style="cursor:pointer">iBeacon</a></li>	
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="device">
											<div class="panel-body clearfix">
												<div class="form-group clearfix">
													<label for="name" class="col-sm-12">Advertised Id :</label>
													<div class="col-sm-12">
														<select id="aidtype" name="aidtype" required autofocus
															form="addbeacon" class="form-control">
															<option>---Select Type---</option>
															<option value="EDDYSTONE" autofocus>EDDYSTONE</option>
															<option value="iBEACON">iBEACON</option>
															<option value="ALTBEACON">ALTBEACON</option>
															<option value="EDDYSTONE-EID">EDDYSTONE-EID</option>
														</select>
													</div>
													<br> <br>
													<div class="col-sm-12">
														<input class="form-control" name="aidid" id="aidid"
															placeholder="Enter Base64 ID" type="text" required>
													</div>
												</div>
												<div class="form-group clearfix">
													<label for="name" class="col-sm-12">Address :</label>
													<div class="col-sm-12">
														<input class="form-control" name="placeid" id="placeid"
															placeholder="Enter Place ID" type="text" required>
													</div>
												</div>
												<div class="form-group clearfix">
													<label for="name" class="col-sm-12">Co-ordinates :</label>
													<div class="col-sm-12">
														<input class="form-control" name="latitude" id="latitude"
															placeholder="Enter Latitude" type="text" readonly required>
													</div>
													<div class="col-sm-12">
														<input class="form-control" name="longitude"
															id="longitude" placeholder="Enter Longitude" type="text"
															readonly required>
													</div>
												</div>
												<div class="form-group clearfix">
													<label for="name" class="col-sm-12">Expected
														Stability :</label>
													<div class="col-sm-12">
														<select id="stability" name="stability" required
															form="addbeacon" class="form-control">
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
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			</section>
			
		</div>
		<!-- /.content-wrapper -->
		<div class="control-sidebar-bg"></div>
	</div>
	<footer class="main-footer"
		style="margin:0;bottom:0;    padding: 7px; text-align:center;width:100%;position:relative ">
	Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/">
		Ciweb Tech LLC</a>. All rights reserved. </footer>
	</div>
	<!-- jQuery 2.2.3 -->
	<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script type="text/javascript" src="dist/js/app.min.js"></script> 
	<!-- Sparkline -->
	

<script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script> 
<!-- FastClick --> 
<script type="text/javascript" src="plugins/fastclick/fastclick.js"></script>
	
	<!-- <script type="text/javascript"
		src="plugins/slimScroll/jquery.slimscroll.min.js"></script> -->
	<!-- ChartJS 1.0.1 -->
	<!-- <script type="text/javascript" src="plugins/chartjs/Chart.min.js"></script>
	 -->
	<!-- AdminLTE for demo purposes -->
	<script type="text/javascript" src="dist/js/demo.js"></script>
	
	<script type="text/javascript">
	var init = function() {
	    var email = "<%=(String) session.getAttribute("email")%>";

			if (email === "null") {
				window.location.href = "login.jsp";
				var i = true;
			} else if (i) {
				if (email != "null") {
					i = false;
					window.location.href = "index.jsp";
				}
			}
			init = true;
		};
		if (init) {
			init();
		}
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var settings = {
								"async" : true,
								"crossDomain" : true,
								"url" : "http://localhost:8080/beacons/beaconSuccess",
						//		"url": "http://45.114.79.187/beacons/beaconSuccess",
								"cache": false,			 
								"method" : "GET",
								"headers" : {
									"cache-control" : "no-cache",
									"postman-token" : "d57f8b77-3232-0da8-fb17-7966407c71fb"
								}
							}
							$
									.ajax(settings)
									.done(
											function(response) {
												var data = JSON.parse(response);
												var content = null;
												var img = JSON
														.parse("{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
												$
														.each(
																data,
																function(i,
																		item) {
																	var identifier = item.identifier;
																	var addre = item.shadow.location.timezone;
																	var latitude = item.shadow.location.latitude;
																	var longitude = item.shadow.location.longitude;
																	var formatted_address = item.shadow.location.formatted_address;
																	if (formatted_address === undefined) {
																		formatted_address = "America/Los_Angeles";
																	}

																	content += "<tr onclick='detail(\""
																		    + identifier
			    + "\")' onmouseover=openBeaconDetail(\""+ identifier+ "\");>"	
																			+ "<td><img src=" + img[item.color] + " /></td>"
																			+ "<td>&nbsp;"														
																			+ item.shadow.name.bold().toUpperCase()																			
																			+ ""
																			+ "<br>&nbsp;"
																			+formatted_address
																			+ ""
																			+ "</td>"

																			+"</tr>";
																});
												$('#beacondetail').append(
														content);
												
											});
						});
	</script>
	​
<script>

	/*  $(".save, .cancel").hide();
	 $('.edit').click(function() {
		    $(this).hide();
		    $(this).siblings('.save, .cancel').show();
		});
		$('.cancel').click(function() {
		    $(this).siblings('.edit').show();
		    $(this).siblings('.save').hide();
		    $(this).hide();
		});
		$('.save').click(function() {
		    $(this).siblings('.edit').show();
		    $(this).siblings('.cancel').hide();
		    $(this).hide();
		    $("#editelements p").remove();
			$(".inputid").css('display','block');
		}); */
	function closebtn(){
		
		$(".details").hide();
		//$(".details").fadeIn(500);
		$("#hidecol").show();
		//location.reload();
		//window.close();
		//document.location.load();
	}
	
	 
	
	function detail(identifier){
		
	 	    $.post("http://localhost:8080/beacons/beaconDetail", { 
		// 	$.post("http://45.114.79.187/beacons/beaconDetail", { 
			identifier : identifier
		},  function(data, status) {

		            	var myObj = JSON.parse(data);
		            	var lat=myObj.shadow.location.latitude;
		            	var img = JSON.parse(
		        		"{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
		             //  $('#imgbeacon').html(data[item.color]);
		            	$('#identifier').html(myObj.identifier);
		        		$('#name').html(myObj.shadow.name);
		        		$('#color').html(myObj.color);
		        		if(myObj.shadow.location.formatted_address===undefined ){ 
		        			$('#geol').html(myObj.shadow.location.timezone);
		        		}
		        		else{
		        			$('#geol').html(myObj.shadow.location.formatted_address);		
		        		}
		        		$('#inlocation').html(myObj.shadow.location.timezone);
		        		/* $('#prouuid').html(myObj.settings.advertisers.ibeacon[0].uuid); */
		        		$('#major').html(myObj.settings.advertisers.ibeacon[0].major);
		        		$('#minor').html(myObj.settings.advertisers.ibeacon[0].minor);
		        		$('#FirmwareVer').html(myObj.status_report.firmware_version);
		        		/* $('#HardwareVer').append(myObj.hardware_revision); */
		        	/* 	$('#tags').html('-'); */
		        		/* $('#mesh').html(myObj.mesh.name); */
		        		
		            });			
		

		
		$(".details").show();
		//$(".details").fadeIn(500);
		$("#hidecol").hide();
		//$("#hidecol").fadeOut();
		$("#editelements p").show();
	//	$("#editelements p").css('display','block');
		$(".inputid").css('display','none');
	}
	 
	/* $(".edit").click(function(){
		//$("#inputid").show();
		$("#editelements p").remove();
		$(".inputid").css('display','block');
		
	}); */
	// append detail script
	
	
	// search script
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
		 	<script type="text/javascript">
		function openBeaconDetail(identifier) {
			
		     $.post("http://localhost:8080/beacons/beaconDetail", { 
		//	 $.post("http://45.114.79.187/beacons/beaconDetail", { 
				identifier : identifier
			}, function(data, status) {

				var myObj = JSON.parse(data);
			    var beaconname=myObj.shadow.name;
				var lat = myObj.shadow.location.latitude;
				var lng = myObj.shadow.location.longitude;
				var address=myObj.shadow.location.formatted_address;
				
			    if (address === undefined) {
					 address = "America/Los_Angeles";
					}
				if (lat === undefined || lng === undefined) {
					lat = 34.1017;
					lng = -118.3382;
				}

				initMap(lat,lng,address,beaconname);
				//alert("data: "+data+ "status:"+status);

			});
		}

			   
		
	        function initMap(lat,lng,address,beaconname) {
	    	  
	    	var myCenter = new google.maps.LatLng(lat, lng);
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myCenter,
	          zoom: 15
	        });

	        var infowindow = new google.maps.InfoWindow();
	      //  var service = new google.maps.places.PlacesService(map);

	       /*  service.getDetails({
	          placeId:'ChIJN1t_tDeuEmsRUsoyG83frY4'
	        }, function(place, status) {
	          if (status === google.maps.places.PlacesServiceStatus.OK) { */
	            var marker = new google.maps.Marker({
	              map: map,
	              position: myCenter
	            });
	            google.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.setContent('<div><strong>'+ beaconname.toUpperCase() + '</strong><br>' 
        		 + address.fontcolor("#068ad6")+ '<br>' +'</div>');
			              infowindow.open(map, this);
	            });
	     //     }
	     //   });
	      }
	      
	</script>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&callback=initMap"
		async defer></script>



</body>
</html>