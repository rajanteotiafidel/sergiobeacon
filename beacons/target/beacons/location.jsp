<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Locations | Ciweb</title>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
td img { width: 40px }
#myTable td{ width:40px} 
#myTable {table-layout:fixed;}
#map { height: 500px;}
      /* class for map and AutoComplete serachbox  */
.pac-container { background-color: #ffe; z-index: 1040 !important; position: fixed; display: inline-block; float: left; }
.modal{ z-index: 20; margin-top:50px;}
.modal-backdrop{ z-index: 10; }
.copyright { position: absolute; bottom: 0.1px; color: #fff; text-align: center; font-size: 85%;}
#map {height: 500px; left-margin: 50px;}
.avatar { width: 40px; height: 40px; position: relative; margin-top: -13px; margin-bottom: -11px; margin-right: 10px;}
.img-circle { border-radius: 50%; width: 60px; height: 60px;}
.pic { border-radius: 50%; width: 50px; height: 50px;}
fieldset {  overflow: hidden}
.some-class {  float: left; clear: none; }
label {  float: left; clear: none; display: block; padding: 2px 1em 0 0;}
input[type=radio],
input.radio { margin-left: 30px; margin-top: 6px; float: left; clear: none; }
.controls { background-color: #fff; border-radius: 2px; border: 1px solid transparent; width: 400px; 
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3); box-sizing: border-box; font-family: Roboto; font-size: 15px;
		font-weight: 300; height: 29px; margin-left: 17px; margin-top: 10px; outline: none; padding: 0 11px 0 13px; 
		text-overflow: ellipsis;}
.controls:focus {	border-color: #4d90fe;}
.title {	font-weight: bold;}
.addbutton {	padding: 7px 13px; font-size: 12px; line-height: 1.5; border-radius: 0px; }
#infowindow-content {	display: none;}
#infowindow-content {	display: inline;}
#map {	height: calc(100vh - 150px); min-height: 100%;}
.searchlist {	height: calc(100vh - 150px); min-height: auto; overflow: auto;}
.searchbox { float: left; border-radius: 0px margin-top: 0px; margin-left: 0px; margin-bottom: -15px; width: 265px;
	border-color: #068ad6; margin-top: 0px;}
.pluscustom { float: right; border: 0; background: none; padding-top: 8px; padding-bottom: 8px; padding-left: 5px;}
.edit-coustom{position: absolute; margin-top: 256px; margin-left: -305px; background-color: #068ad6; padding-left: 20px;
    padding-right: 22px; background-color: #068ad6;	}
.edit-coustom2 { position: absolute; margin-top: 250px; margin-left: -300px; background-color: #068ad6; padding-left: 20px;
    padding-right: 22px; background-color: #068ad6;}
#myTable tr{cursor:pointer;}
.p0{padding: 7px !important; border-radius: 5px;    margin-bottom: -15px;}
.inputcustom{border:1px solid #ccc; padding:3px; margin-bottom:5px;}
.mb14{margin-bottom:9px; text-align: left;word-break: break-word;}
.btn-custom{border-radius: 0px; margin-top: 0px; margin-bottom: 1; padding-bottom: 7px; padding-top: 7px; padding-left: 15px; 
	padding-right: 20px; border-color: #068ad6; border-left-color: white; color: white; background-color: #068ad6;}
.main-footer{padding-left: 0px;padding-right: 0px;}
.graph .axis {stroke-width: 1;}
.graph .axis .tick line {stroke: black;}
.graph .axis .tick text {fill: black;font-size: 0.7em;}
.graph .axis .domain {fill: none;stroke: black;}
.graph .group {fill: none;stroke: black;stroke-width: 1.5;}
svg{padding-top: 35px;}
.customCharts{position:relative !important}
.canvasjs-chart-canvas{position:relative !important}
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
    <!-- Main content -->
    <section class="content"> <!-- <a href="" data-toggle="modal" class="btn btn-primary mb20 pull-right">Add Beacon</a> -->
			<div class="">
				<div class="col-sm-4 pl panel searchlist p0" id="hidecol">
				<!-- 	radio-button -->
    			    <div>     
						<div class="some-class" style="display: inline-flex;">
    						<input type="radio" class="radio" name="x" value="y" id="y" checked />
    						<label for="y" style="padding-left: 4px; color: #3F51B5;">ESTIMOTE LIST</label>
    						<input type="radio" class="radio" name="x" value="z" id="z"/>
    						<label for="z" style="padding-left: 4px; color: #3F51B5;">GOOGLE API LIST</label>
  						</div>
					</div> 
        			<div class="col-sm-12" style="display: inline-flex; width: 100%; margin-top:10px; margin-bottom:10px;" class="">
						<input class="searchbox search form-control mb20 mt10" type="text" onkeyUp="myFunction()"
								placeholder="Search by Beacons Name " id="myInput"
								style="border-color: #068ad6; border-radius: 0px; background-color: white">
						<button data-target="#add" data-toggle="modal" type="button"
								class="btn btn-default btn-sm  addbutton btn-custom"  style="
                        		background-color: #068ad6;color: white;">
							<span class="glyphicon glyphicon-plus-sign"></span> Add
						</button>
					</div>
	    			<div>
						<table id="myTable" class="table table-hover">
							<tbody style="font-size: 13px; overflow-x: hidden;" id="beacondetail"> </tbody>
						</table>
					</div>
					<table id="myTable2" class="table table-hover">
						<tbody style="font-size: 13px; overflow-x: hidden;" id="beacondetail2"> </tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-4 pl panel details panel-body" style="display:none; background-color:white; 
					word-wrap:break-word; border-color: #068ad6;">
				<div class=""><a href="javascript:void(0)" onclick="closebtn()"><i class="fa fa-close pull-right"></i></a></div>
				<div class="col-sm-12">
					<div class="col-sm-12 beaconimg text-center p0" style="margin-bottom: 10px">
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
              			<a href="location.jsp" class="mb14 glyphicon glyphicon-map-marker " 
              				style="margin-bottom: 84px ;color: #068ad6;"> Address :</a>
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
		           		<input value="vgv" class="inputid inputcustom"  style="display:none" id="">
		           		<!--   <p id="tags" class="mb14"></p> -->
		           		<input value="vgv" class="inputid inputcustom" style="display:none" id="">
		           		<!--  <p id="mesh" class="mb14"></p> -->
		           		<input value="vgv" class="inputid inputcustom" style="display:none" id="">
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
		       			<input value="vgv" class="inputid inputcustom"  style="display:none" id="">
		       			<input value="vgv" class="inputid inputcustom" style="display:none" id="">
		       			<input value="vgv" class="inputid inputcustom" style="display:none" id="">
              		</div>
          			<a href="#edit" data-toggle="modal" class="btn btn-primary pull-right  edit-coustom" onclick="edit()">
          				<span class="glyphicon glyphicon-edit"></span> Edit </a> 
            	</div> 		
			</div>
			<!--   googleapi -->
			<div class="col-sm-4 pl panel details2 panel-body" 
						style="display:none; background-color:white; word-wrap:break-word; border-color: #068ad6;">
				<div class=""><a href="javascript:void(0)" onclick="closebtn2()"><i class="fa fa-close pull-right"></i></a></div>
				<div class="col-sm-12">
					<div class="col-sm-12 beaconimg text-center p0" style="margin-bottom: 10px">
						<img id="imgbeacon" src="dist/img/beacon_blue.png" class="" width="100px">
					</div>
				</div>
            	<div class="col-sm-12 rowbeacon p0">
              		<div class="text-left col-sm-6 p0" style="">
             			<!--  <p class="mb14"  style="margin-bottom: 27px">Identifier :</p> -->
              			<p class="mb14"style="margin-bottom: 48px;" >Beacon Name :</p>
<!--               			<p class="mb14" style="margin-bottom: 10px">Color :</p> -->
              			<p class="mb14" style="margin-bottom: 10px">Type :</p>
              			<p class="mb14" style="margin-bottom: 10px">Status :</p>  
              			<a href="location.jsp" class="mb14 glyphicon glyphicon-map-marker" 
              				style="margin-bottom: 115px ;color: #068ad6;"> Address :</a>
              		</div>
              		<div class="text-right col-sm-6 p0" id="editelements2">
                       <p id="bn" class="mb14" style="margin-bottom:8px"></p>
		               <p id="bcolor"  class="mb14"  ></p>
		               <p id="atype" class="mb14"style="margin-bottom: 10px;"></p>
		               <p id="stats" class="mb14"></p>
		               <p id="addre" class="mb14"></p>
              		</div>
           			<a href="#edit2" data-toggle="modal" class="btn btn-primary pull-right  edit-coustom2">
           				<span class="glyphicon glyphicon-edit"></span>Edit </a>
            	</div> 	
            	<div>
           			<button onclick="deleteBeacon()" type="button" class="btn btn-primary" style="float:right;">
           				<span class="glyphicon glyphicon-trash"></span></button>
        			<a  onclick="attachment()" data-toggle="modal"  data-target="#attachments" class="btn btn-primary pull-right">
        				<span class="glyphicon glyphicon-paperclip"></span> </a>
            	</div> 		
			</div>
			<div class="col-sm-8 pr">
				<div id="map"></div>
			</div>
		</div>
		<div class="container-fluid">
							<!-- Edit Beacon Deatils -->
			<div id="edit" class="modal fade" role="dialog" tabindex='-1'>
            <div class="modal-dialog"> 
              <!-- Modal content-->
       <form role="form" method="post" action="beaconDetail">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#device" data-toggle="tab" style="cursor:pointer">Device</a></li>
                    <li class=""><a data-target="#beacon" data-toggle="tab" style="cursor:pointer">iBeacon</a></li>
                    <li class=""><a onclick="telemetry()" data-target="#telemetry" data-toggle="tab" 
		    						style="cursor:pointer">Telemetry</a></li>
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
                          <label for="name" class="col-sm-12">Geo Location:</label>
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
                          <input class="form-control" id="UUID" placeholder="Enter Proximity UUID" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Major:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="major1" placeholder="Enter Major" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Minor:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="minor1" placeholder="Enter minor" type="text">
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
                          <input class="form-control" id="interval" placeholder="Enter Interval" type="text">
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
                    <div class="tab-pane" id="telemetry">
						<div class="panel-body clearfix">
                        	<div class="form-group clearfix">
                          		<label for="name" class="col-sm-12">Telemetry :</label>
                          		<div class="col-sm-12" style="margin-bottom:10px;">
                          			<input class="form-control" name="teletemp" id="teletemp" type="text" value="">
                          		</div>
                          		<div class="col-sm-12" style="margin-bottom:10px;">
                          			<input class="form-control" name="telelight" id="telelight" type="text" value="">
                          		</div>
                          		<div class="col-sm-12" style="margin-bottom:10px;">
                          			<input class="form-control" name="teledate" id="teledate" type="text" value="">
                          		</div>
                          		<div class="" id="chartContainer">
                          			<table id="myTable" class="table table-hover">
										<tbody style="font-size: 13px; overflow-x: hidden;" id="chartContainer2"></tbody>
									</table>
                          		</div>
<!-- 			  			  		<div class="graph"></div> -->
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
        	<div id="edit2" class="modal fade" role="dialog" tabindex='-1'>
        		<div class="modal-dialog"> 
              		<form method="post" action="updateBeacon" id="updateBeacon">
              		<div class="modal-content">
                		<div class="modal-body">
                  			<ul class="nav nav-tabs" id="myTab">
                    			<li class="active"><a data-target="#device" data-toggle="tab" style="cursor:pointer">Details</a></li>
                    			<li class=""><a data-target="#properties" data-toggle="tab" style="cursor:pointer">Properties</a></li>
                    			<li class="">
                    				<input class="form-control" type="hidden" name="attachli" id="attachli" value="">
                    				<a onclick="attachment()" data-target="#attachments" data-toggle="modal" 
                    					style="cursor:pointer">Attachments</a>
                    			</li>	
                  				<button type="button" class="close" data-dismiss="modal">&times;</button>
                  			</ul>
                  			<div class="tab-content">
                    			<div class="tab-pane active" id="device">
                      				<div class="panel-body clearfix">
	<!--                       <div class="text-center">
                      	<img src="dist/img/Beacon.jpg" class="beaconimg" width="15%" >
                      	</div> -->
                      					<div class="form-group clearfix" >
                          					<label for="name" class="col-sm-12">Beacon Name :</label>
                          					<div class="col-sm-12">
                          						<input class="form-control" type="text" name="bn" id="bn1" value="" 
                          							autofocus readonly>
                          					</div>
                        				</div>
                        				<div class="form-group clearfix">
                          					<label for="name" class="col-sm-12">Advertised Id :</label>
                          					<div class="col-sm-12" style="margin-bottom:10px;">
												<input class="form-control" name="atype" id="atype1" type="text" value="" readonly>
                          					</div>
                          					<div class="col-sm-12">
                          						<input class="form-control" name="aid" id="aid" type="text" value="" readonly>
                          					</div>
                        				</div>
                        				<div class="form-group clearfix" >
                          					<label for="name" class="col-sm-12">Status :</label>
                          					<div class="col-sm-12">
                          						<input class="form-control" type="text" name="stats" id="stats1" value="" >
                          					</div>
                        				</div>
                        				<div class="form-group clearfix" >
                          					<label for="name" class="col-sm-12">Address :</label>
                          					<div class="col-sm-12">
                          						<input class="form-control" name="placid" id="placid1" type="hidden" value="" readonly>
                          						<input class="form-control" name="lati" id="lati" type="hidden" value="">
                          						<input class="form-control" name="longi"id="longi" type="hidden" value="">
                          						<input class="form-control col-sm-12" name="beaconaddress" id="beaconaddress" 
                          								type="text" value="" onFocus="geolocate()">
                          						<input class="form-control" name="placeid1" id="placeid1" type="hidden" value="" 
                          							required>
                          					</div>
                        				</div>
                         				<div class="form-group clearfix" >
                          					<label for="name" class="col-sm-12">Indoor Level :</label>
                          						<div class="col-sm-12">
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
                      					</div>
                    				</div>
                    				<div class="tab-pane" id="properties">
                      					<div class="panel-body clearfix">
                        					<div class="form-group clearfix">
                          						<label for="name" class="col-sm-12">Properties :</label>
                          						<div class="col-sm-12" style="margin-bottom:10px;">
                          							<input class="form-control" name="pos" id="pos" 
                          									placeholder="Enter Position" type="text" value="" >
                          						</div>
                          						<div class="col-sm-12" style="margin-bottom:10px;">
                          							<input class="form-control" name="pname" id="pname" 
                          									placeholder="Enter Property Name" type="text" value="" >
                          						</div>
                          						<div class="col-sm-12">
                          							<input class="form-control" name="pplace" id="pplace" 
                          									placeholder="Enter Property Value" type="text" value="" >
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
          	<div id="attachments" class="modal fade" role="dialog" tabindex='-1'>
        		<div class="modal-dialog"> 
              		<form method="post" action="" id="addAttachments">
              		<div class="modal-content">
                		<div class="modal-body">
                  			<button type="button" class="close" data-dismiss="modal">&times;</button>	
                  			<ul class="nav nav-tabs" id="myTab">
                     			<li class="active"><a data-target="#listattach" data-toggle="tab" 
                     				style="cursor:pointer">List Attachments</a></li>
                    			<li class=""><a data-target="#attach" data-toggle="tab" 
                    				style="cursor:pointer">Add Attachments</a></li>
                  			</ul>
                  			<div class="tab-content">
                    			<div class="tab-pane" id="attach">
                      				<div class="panel-body clearfix">
                        				<div id="iterateattach" class="form-group clearfix">
                          					<div class="col-sm-12">
                          						<input class="form-control" name="aname" id="aname" type="hidden" value="">
                          					</div>
                          					<div class="col-sm-12" style="margin-bottom: 10px;">
                          						<input class="form-control" name="atitle" id="atitle" type="text" 
                          								placeholder="Enter Title" value="" autofocus required>
                          					</div>
                          					<div class="col-sm-12" style="margin-bottom: 10px;">
                          						<input class="form-control" name="aurl" id="aurl" type="text" 
                          								placeholder="Enter URL" value="" required>
                          					</div>
                          					<div class="col-sm-12" style="margin-bottom: 10px;">
                          						<input class="form-control" name="sdate" id="sdate" 
                          								data-date-inline-picker="true" type="date" 
                          									placeholder="Enter Start Date" value="">
                          					</div>
                          					<div class="col-sm-12" style="margin-bottom: 10px;">
                          						<input class="form-control" name="edate" id="edate" 
                          								data-date-inline-picker="true" type="date" 
                          								placeholder="Enter End Date" value="">
                          					</div>
<!--                           <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="stime" id="stime" type="text" placeholder="Enter Start Time" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="etime" id="etime" type="text" placeholder="Enter End Time" value="" required>
                          </div> -->
                        				</div>
<!--                         <button type="button" id="addFields" class="btn btn-primary" style="float:right;">Add Fields</button> -->
                      				</div>
                    			</div>
                    			<div class="tab-pane active" id="listattach">
                      				<div class="panel-body clearfix">
                        				<div id="iterateattach1" class="form-group clearfix">
                          					<div class="" style="width:100%" >
                          						<table id="myTable" class="table table-bordered table-striped">
													<tbody style="font-size:12px;overflow-x:hidden;" id="beacondetail1"></tbody>
						  						</table>
						  					</div>
                        				</div>
                      				</div>
                    			</div>
                  			</div>
                		</div>
                		<div class="modal-footer">
                			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                			<button type="submit" class="btn btn-primary" onclick="addAttachments()">Save Changes</button> 
              			</div>
              		</div>
              	</form>
            </div>
        </div> 
		<div id="add" class="modal fade" role="dialog" tabindex='-1'>
        	<div class="modal-dialog"> 
              <!-- Modal content-->
            	<form method="post" action="addBeacon" id="addbeacon" onsubmit="return validate();">
				<div class="modal-content">
                	<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
                  		<ul class="nav nav-tabs" id="myTab">
                    		<li class="active"><a data-target="#add" data-toggle="tab" style="cursor:pointer">Add Details</a></li>
                  		</ul>
                  		<div class="tab-content">
                    		<div class="tab-pane active" id="device">
                      			<div class="panel-body clearfix">
                        			<div class="form-group clearfix">
                          				<label for="name" class="col-sm-12">Advertised Id :</label>
                          				<div class="col-sm-12" style="margin-bottom: 7px;">
											<select id="aidtype" name="aidtype" form="addbeacon" class="form-control" 
													autofocus required>
												<option value="">---Select Type---</option>
												<option value="EDDYSTONE">EDDYSTONE</option>
												<option value="iBEACON">iBEACON</option>
												<option value="ALTBEACON">ALTBEACON</option>
												<option value="EDDYSTONE-EID">EDDYSTONE-EID</option>
											</select>
                          				</div>
                          				<div class="col-sm-12" style="margin-bottom: 7px;">
                          					<input class="form-control" name="uuid" id="uuid" placeholder="Enter UUID" 
                          							type="text" required>
                          				</div>
                          				<div class="col-sm-12" style="margin-bottom: 7px;">
                          					<input class="form-control" name="major" id="major" placeholder="Enter Major" 
                          							type="number" required>
                          				</div>
                          				<div class="col-sm-12" style="margin-bottom: 7px;">
                          					<input class="form-control" name="minor" id="minor" placeholder="Enter Minor" 
                          							type="number" required>
                          				</div>
                        			</div>
                        			<div class="form-group clearfix" >
                          				<label for="name" class="col-sm-12">Address :</label>
                          				<div class="col-sm-12" id="locationField">
                          					<input class="form-control col-sm-12" type="text" name="address" id="address" 
                          							value="" placeholder="Enter beacon address" onFocus="geolocate()" 
                          							required  style="margin-bottom:7px;">
                          					<input class="form-control" name="placeid" id="placeid" type="hidden" value="" 
                          							required>
<!--                           					<input class="form-control" name="addi" id="addi" type="hidden" value="" required> -->
                          				</div>
                        			</div>
                         			<div class="form-group clearfix">
                          				<label for="name" class="col-sm-12" style="margin-bottom:7px;">Co-ordinates :</label>
                          				<div class="col-sm-12" style="margin-bottom:7px;">
                          					<input class="form-control" name="latitude" id="latitude" 
                          							placeholder="Enter Latitude" type="text" readonly required>
                          				</div>
                          				<div class="col-sm-12"  style="margin-bottom: 7px;">
                          					<input class="form-control" name="longitude"id="longitude" 
                          							placeholder="Enter Longitude" type="text" readonly required>
                          				</div>
                        			</div>
                        			<div class="form-group clearfix">
                          				<label for="name" class="col-sm-12">Description :</label>
                          				<div class="col-sm-12">
                          					<input class="form-control" name="description" id="description" 
                          							placeholder="Enter Description" type="text" required>
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
	
			<!-- Google One Beacon Deails -->
	<div class="container-fluid">
<!--             <div id="attachments" class="modal fade" role="dialog" tabindex='-1'>
        	<div class="modal-dialog"> 
              <form method="post" action="" id="addAttachments">
              <div class="modal-content">
                <div class="modal-body">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="" data-toggle="tab" style="cursor:pointer">Attachments</a></li>
                  </ul>
                  <div class="">
                    <div class="tab-pane" id="attach">
                      <div class="panel-body clearfix">
                        <div id="iterateattach" class="form-group clearfix">
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="atitle" id="atitle" type="text" placeholder="Enter Title" value="" autofocus required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="aurl" id="aurl" type="text" placeholder="Enter URL" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="sdate" id="sdate" type="date" placeholder="Enter Start Date" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="edate" id="edate" type="date" placeholder="Enter End Date" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="stime" id="stime" type="text" placeholder="Enter Start Time" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="etime" id="etime" type="text" placeholder="Enter End Time" value="" required>
                          </div>
                        </div>
                        <button type="button" id="addFields" class="btn btn-primary" style="float:right;">Add Fields</button>
                      </div>
                    </div>
                  </div>
                </div>$('#identifier').val(identifier)
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" onclick="addAttachments()">Save Changes</button>
              	</div>
              </div>
              </form>
            </div>
          </div> -->   
    <!-- /.box-footer--> 
  </div>
  <!-- /.content --> 
  <footer class="main-footer"  style="margin:0;bottom:0;padding: 7px; text-align:center;width:100%; position:relative " >
    Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
  </footer>
<!-- Control Sidebar -->
</div>
<!-- /.content-wrapper -->
<!-- ./wrapper --> 
<!-- jQuery 2.2.3 --> 
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="plugins/charts.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<%-- <script type="text/javascript">
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
</script> --%>
<script type="text/javascript">
$(document).ready(function() {
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
	$.ajax(settings).done(function(response) {
		var data = JSON.parse(response);
		var content = null;
		console.log("response in estimote = "+response);
		var img = JSON.parse("{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
		$.each(data,function(i,item) {
			var identifier = item.identifier;
			console.log("identifier in estimote = "+identifier);
			var addre = item.shadow.location.timezone;
			var latitude = item.shadow.location.latitude;
			var longitude = item.shadow.location.longitude;
			var formatted_address = item.shadow.location.formatted_address;
			if (formatted_address === undefined) {
				formatted_address = "America/Los_Angeles";
			}
			content += "<tr onclick='detail(\""+ identifier  + "\")' onmouseover=openBeaconDetail(\""+ identifier+ "\");>"	
						+ "<td><img src=" + img[item.color] + " /></td>"
						+ "<td>&nbsp;"+ item.shadow.name.bold().toUpperCase()+ ""
						+ "<br>&nbsp;"+formatted_address+ ""+ "</td>"
						+"</tr>";
			});
			$('#beacondetail').append(content);
		});
	});
</script>

<script>		
var resp = '';
function telemetry() {
	var identifier = $('#identifier').html();
 	$.post("http://localhost:8080/beacons/telemetry", {
//    $.post("http://45.114.79.187/beacons/telemetry", { 
				identifier: identifier
 				},  function(response) {
 					$('#chartContainer2').html('');
 					console.log("telemetry");
 					console.log(response);
 					var tele = JSON.parse(response);
 					console.log(tele);
 					var content = '';
 					var i = 0;
 					var dataPoints = [];
 					console.log(tele.data[i]);
 					var temp = null;
 					var date = null;
 					var light = null;
 					while (tele.data[i] !== undefined) {
 						temp = tele.data[i].Temperature;
 						date = new Date(tele.data[i].Timestamp).toUTCString().replace('GMT', '').replace(',','');
 						light = tele.data[i].Lightsensor;
 						console.log(temp);
 						console.log(light);
 						console.log(date);
 						i++;
 						content += "<tr>"	
 							+ "<td>Temp : " + temp + ""
 							+ "<br>Light : " + light + ""
 							+ "<br>Date : " + date + "</td>"
 							+"</tr>";
 							
  						dataPoints.push({label: date, y: temp});
  						
 						var chart = new CanvasJS.Chart("chartContainer",{
 							title:{ text: "Telemetry Data" },
 							axisX:{ title: "Date", gridThickness: 0 },
 							axisY: { title: "Temperture", gridThickness: 0 },
 					        data: [{
 					        	type: "scatter",
 					            dataPoints : dataPoints
 					        }]
 					    });
 					    
// 						telechart(temp, date);
 					}
 					var utcDate = new Date(tele.data[i-1].Timestamp);
 					var date1 = new Date();
 					console.log(date1.setUTCDate(utcDate.getDate()));
 					console.log(date1.setUTCMonth(utcDate.getMonth()));
 					console.log("dataPoints = "+dataPoints);
 					chart.render();
 					$('#chartContainer2').html(content);
 					console.log("i = "+i);
 					
 					if (null === temp) {
 						$("#teletemp").val(0);
 					} else {
 	 					$("#teletemp").val(temp); 						
 					}

 					if (null === light) {
 						$("#telelight").val(0);
 					} else {
 						$("#telelight").val(light);
 					}
 	 				$("#teledate").val(date);
// 	 				teleChart(response);

 				});
 				teledata();
 	}
 var dataPoints = [];
function teleChart(data) {  
	console.log("teleChart");
    $.each(data, function(key, value){
        dataPoints.push({x: value, y: value});
    });
    var chart = new CanvasJS.Chart("chartContainer",{
        title:{
            text:"Chart with dataPoints"
        },
        data: [{
        type: "scatter",
            dataPoints : dataPoints,
        }]
    });
    chart.render();
} 	

/*
$.ajax(settings).done(function (response) {
  console.log("This is beacon telemetry data");
  console.log(response);
	resp = response;
  console.log(response.data.length);
  var len = response.data.length-1;
  console.log(response.data[len]);
  console.log(response.data[len].temperature);
  console.log(response.data[len].ambient_light_level);
  console.log(response.data[len].date);
	var subString1 = '';
	var teletemp = response.data[len].temperature;
	var telelight = response.data[len].ambient_light_level;
	var base64 = response.data[len].date+' '+teletemp+' '+telelight;
	console.log(btoa(base64));
	if(teletemp === null) {
		teletemp = '0';
	}
	if(telelight === null) {
		telelight = '0';
	}
	$("#teletemp").val(teletemp);
	$("#telelight").val(telelight );
	$("#teledate").val(response.data[len].date);
	len = 0;

	while(len<=response.data.length-1) {
		console.log(response.data[len]);
		console.log(response.data[len].temperature);
		console.log(response.data[len].ambient_light_level);
		console.log(response.data[len].date);
		var date = response.data[len].date;
		var subString= date.substring(0, date.indexOf("T"));
		var time = date.indexOf("T");
		console.log("time() = "+date[++time]+date[++time]);
		subString = subString.replace("-", ",").replace("-", ",");
		console.log("subString = "+subString);
//		if(subString !== subString1) {
//			subString1 = subString;
//			teledata(response.data[len].temperature, subString);
//		} else {return false;}
		len++;
		console.log(len);
	}
	teledata();
});
} */
function teledata(){
		var limit = 60 * 1,
       	duration = 1000,
       	now = new Date(Date.now() - duration);
		console.log("limit  = "+limit);
		console.log("now = "+now);
	var width = 500, padding = 50, height = 200;

	var groups = {
			current: {
                value: 0,
                color: 'orange',
                data: d3.range(limit).map(function() {
                    return 0
                })
            },
			target: {
                value: 0,
                color: 'green',
                data: d3.range(limit).map(function() {
                    return 0
                })
            }
        }

		var x = d3.time.scale().domain([now - (limit - 2), now - duration]).range([0, width]);
		console.log("x = "+x);
		var y = d3.scale.linear().domain([0, 100]).range([height, 0]);
		console.log("y = "+y);
		var line = d3.svg.line().interpolate('basis').x(function(d, i) {
			return x(now - (limit - 1 - i) * duration)
        }).y(function(d) {
			return y(d)
        });
		console.log("line = "+line);
		var svg = d3.select('.graph').append('svg').attr('class', 'chart').attr('width', width).attr('height', height + 50);

		var axis = svg.append('g').attr('class', 'x axis').attr('transform', 'translate(0,' + height + ')')
		.call(x.axis = d3.svg.axis().scale(x).orient('bottom'));

		var paths = svg.append('g');

		for (var name in groups) {
			var group = groups[name];
        	group.path = paths.append('path').data([group.data]).attr('class', name + ' group').style('stroke', group.color);
     	}

		function tick() {
			now = new Date();

        // Add new values
        	for (var name in groups) {
                var group = groups[name];
                //group.data.push(group.value) // Real values arrive at irregular intervals
                group.data.push(20 + Math.random() * 100);
                group.path.attr('d', line);
        	}

        // Shift domain
        	x.domain([now - (limit - 2) * duration, now - duration]);

        // Slide x-axis left
        	axis.transition().duration(duration).ease('linear').call(x.axis);

        // Slide paths left
        	paths.attr('transform', null).transition().duration(duration).ease('linear')
        		.attr('transform', 'translate(' + x(now - (limit - 1) * duration) + ')').each('end', tick);

        // Remove oldest data point from each group
        	for (var name in groups) {
                var group = groups[name];
                group.data.shift();
        	}
		}
		tick();
} 
/*  //d3 chart
var svg = d3.select("chartContainer"),
    margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = +svg.attr("width") - margin.left - margin.right,
    height = +svg.attr("height") - margin.top - margin.bottom,
    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var parseTime = d3.timeParse("%d-%b-%y");

var x = d3.scaleTime()
    .rangeRound([0, width]);

var y = d3.scaleLinear()
    .rangeRound([height, 0]);

var line = d3.line()
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.temparature); });

d3.tsv("resp", function(d) {
  d.date = parseTime(d.date);
  d.temparature= +d.temparature;
  return d;
}, function(error, data) {
  if (error) throw error;

  x.domain(d3.extent(data, function(d) { return d.date; }));
  y.domain(d3.extent(data, function(d) { return d.temparature; }));

  g.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x))
    .select(".domain")
      .remove();

  g.append("g")
      .call(d3.axisLeft(y))
    .append("text")
      .attr("fill", "#000")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", "0.71em")
      .attr("text-anchor", "end")
      .text("Temparature(celsius)");

  g.append("path")
      .datum(data)
      .attr("fill", "none")
      .attr("stroke", "steelblue")
      .attr("stroke-linejoin", "round")
      .attr("stroke-linecap", "round")
      .attr("stroke-width", 1.5)
      .attr("d", line);
}); */
/* function teledata(temp, subString) {
console.log("temp1 = "+temp);
console.log("subString1 = "+subString);
var temp1 = '';
var subString1 = '';
if(subString !== subString1) {
	subString1 = subString;
	temp1 = temp;
}

	var chart = new CanvasJS.Chart("chartContainer", {
		title:{ text: "Telemetry Data" },
		axisX:{ title: "Date", gridThickness: 0 },
		axisY: { title: "Temperture", gridThickness: 0 },
		data: [ {        
			type: "scatter",
			dataPoints: [//array
			{ x: new Date(2017,02,29), y: 25},
			{ x: new Date(2017,02,30), y: 38},
			{ x: new Date(2017,02,31), y: 43},
			{ x: new Date(2017,03,01), y: 29},
			{ x: new Date(2017,03,02), y: 41},
			{ x: new Date(2017,03,03), y: 35},
			{ x: new Date(2017,03,04), y: 38},
			{ x: new Date(2017,03,05), y: 40}
			]}
		]
});	chart.render();
} */

$('#attachments').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
});
$('#add').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
});
$('#device').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
});

var myObj="";
	function closebtn(){
		$(".details").hide();
		//$(".details").fadeIn(500);
		$("#hidecol").show();
		//location.reload();
		//window.close();
		//document.location.load();
	}
	function detail(identifier){
          openBeaconDetail(identifier); 
	 	    $.post("http://localhost:8080/beacons/beaconDetail", {
//			$.post("http://45.114.79.187/beacons/beaconDetail", { 
		identifier : identifier
		},  function(data, status) {
		            	 myObj = JSON.parse(data);
		            	 var lat=myObj.shadow.location.latitude;
		            	 // alert(myObj.settings.advertisers.ibeacon.uuid);
		            	var img = JSON.parse(
		        		"{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
		             //  $('#imgbeacon').html(data[item.color]);
		            	$('#identifier').html(myObj.identifier.toUpperCase());
//		            	var id = $('#identifier').html(myObj.identifier.toUpperCase());
		            	console.log("identifier in estimote = "+identifier);
		        		$('#name').html(myObj.shadow.name.toUpperCase());
		        		$('#color').html(myObj.color.toUpperCase());
		        		if(myObj.shadow.location.formatted_address===undefined ){ 
		        			$('#geol').html(myObj.shadow.location.timezone);
		        		} else {
		        			$('#geol').html(myObj.shadow.location.formatted_address);		
		        		}
		        		$('#inlocation').html(myObj.shadow.location.timezone);
		        		/* $('#prouuid').html(myObj.settings.advertisers.ibeacon[0].uuid); */
		        		$('#major').html(myObj.settings.advertisers.ibeacon[0].major);
		        		$('#minor').html(myObj.settings.advertisers.ibeacon[0].minor);
		        		$('#FirmwareVer').html(myObj.status_report.firmware_version);
		        		$('#beaconname').val(myObj.color.toUpperCase());
		        		if(myObj.shadow.location.formatted_address===undefined ){ 
		        			$('#geolocation1').val(myObj.shadow.location.timezone);
		        		} else {
		        			$('#geolocation1').val(myObj.shadow.location.formatted_address);		
		        		}
		        		$('#UUID').val(myObj.settings.advertisers.ibeacon[0].uuid);
		        		$('#major1').val(myObj.settings.advertisers.ibeacon[0].major);
		        		$('#minor1').val(myObj.settings.advertisers.ibeacon[0].minor);
		        		$('#interval').val(myObj.settings.advertisers.ibeacon[0].interval);  
		        		$('#BroadcastingPower').val(myObj.settings.advertisers.ibeacon[0].power); 
		            });		
		$(".details").show();
		//$(".details").fadeIn(500);
		$("#hidecol").hide();
		//$("#hidecol").fadeOut();
		$("#editelements p").show();
	//	$("#editelements p").css('display','block');
		$(".inputid").css('display','none');
	/* $(".edit").click(function(){
		//$("#inputid").show();
		$("#editelements p").remove();
		$(".inputid").css('display','block');
		
	}); */
	// append detail script
	 	    }
	function edit(){
		
		/* $('#beaconname').val(myObj.color); */
	//	$('#geolocation1').val(myObj.identifier);
//	alert(myObj.shadow.location.formatted_address);
	//	$('#geolocation1').val(lat);
		
	}	
	// search script
function myFunction() {
  // Declare variables 
  var input, filter, table, table2, tr, tr2, td, i;
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
  
  table2 = document.getElementById("myTable2");
  tr2 = table2.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't match the search query
	for (i = 0; i < tr.length; i++) {
		td = tr2[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr2[i].style.display = "";
	    	} else {
	        	tr2[i].style.display = "none";
	    	}
		}
	}
}
</script>
<!-- <script type="text/javascript">
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
 -->
<script type="text/javascript">
		function openBeaconDetail(identifier) {
		    $.post("http://localhost:8080/beacons/beaconDetail", { 
//	    	 $.post("http://45.114.79.187/beacons/beaconDetail", { 
				identifier : identifier
			}, function(data, status) {

				var myObj = JSON.parse(data);
			    var beaconname=myObj.shadow.name;
			    console.log(myObj);
			    console.log("beaconname in initMap = "+beaconname);
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
			});
		}
            /*  google map  */
	        function initMap(lat,lng,address,beaconname) {
	    	  console.log(lat+","+lng);
	    	var myCenter = new google.maps.LatLng(lat, lng);
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myCenter,
	          zoom: 12
	        });

	        var infowindow = new google.maps.InfoWindow()
	        var marker = new google.maps.Marker({
	              map: map,
	              position: myCenter
	            });
	            google.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.setContent('<div><strong>'+ beaconname.toUpperCase() + '</strong><br>' 
        		 + address.fontcolor("#068ad6")+ '<br>' +'</div>');
			              infowindow.open(map, this);
	            });  
	      }      
</script>
<script type="text/javascript">
 $("#myTable2").hide();
 $(document).ready(function() {
	    $('input:radio[name=x]').change(function() {
	        if (this.value == 'y') {
	        	 $("#myTable2").hide();
	            $("#myTable").show();    
	        }
	        else if (this.value == 'z') {
	            $("#myTable").hide();
	            $("#myTable2").show();
	        }
	    });
	});
</script>
    <!-- GoogleAPI LIST -->
 <script type="text/javascript">
 var addy="";
   $(document).ready(function() {
	var error = "<%=(String)request.getParameter("error")%>";
	console.log(error);
	if (error != "null") {
	    alert(error);
	    error = "null";
	    if (window.parent.location.href.match(/error=/)){
	        if (typeof (history.pushState) != "undefined") {
	            var obj = { Title: document.title, Url: window.parent.location.pathname };
	            history.pushState(obj, obj.Title, obj.Url);
	        } else {
	            window.parent.location = window.parent.location.pathname;
	        }
	    }
	}

	var settings = {
		  "async": true,
	  "crossDomain": true,
//   	  "url": "http://45.114.79.187/beacons/googleapilist",
     "url": "http://localhost:8080/beacons/googleapilist", 
 		  "cache": false,
		  "method": "GET",
		  "headers": {
		    "cache-control": "no-cache",
		    "postman-token": "66a52edd-cc27-5ee9-b97d-d0c5b0e1f599"
		  }
		}
		$.ajax(settings).done(function (response) {
			console.log("1 "+response);
			$('#beacondetail2').html('');
		   var content = "";
		   var p="";
			var x=0;
			var bc = JSON.parse(response.toString());
			console.log("GOOGLE API RESPONSE=");
			console.log(bc);
		 	$.each(bc.beacons[x], function(i, item) {
		 	   if(x==bc.totalCount) {return false;}
		 	  console.log(x);
		 	  console.log(bc.beacons[x]);
		 	  var img = JSON.parse("{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
		 	  console.log(img);
		 	  var bn = bc.beacons[x].beaconName;
			  var at = bc.beacons[x].advertisedId.type;
			  var ai = bc.beacons[x].advertisedId.id;
			  var s = bc.beacons[x].status;
			  var lat = bc.beacons[x].latLng.latitude;	
			  var lng = bc.beacons[x].latLng.longitude;
			    
			  var settings1 = {
	 					"async": false,
	 					"crossDomain": true,
	 					"url": "https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+"%2C"+lng+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8",
	 					"method": "GET",
	 					"cache":false,
	 					"headers": { }
					}
					$.ajax(settings1).done(function (response) {
						
	 				//	alert(x);
	 					addy=response.results[0].formatted_address;
	 					p=response.results[0].place_id;
	 					console.log(addy);
	 					console.log(p);
	 				//	$('#addre').html(response.results[0].formatted_address);
					});
				var iln = bc.beacons[x].indoorLevel.name;
				var ex = bc.beacons[x].expectedStability;
				var des = bc.beacons[x].description;
				console.log("des = "+des);
				var image = '';
				if (x%2 == 0) {
					image = img.candy;
				} else if (x%3 == 0) {
					image = img.lemon;
				} else {
					image = img.beetroot;
				}
            //	p = bc.beacons[x].placeId;
			//	var pn = bc.beacons[x].properties.Name;
			//	var pp = bc.beacons[x].properties.Place;
				x++;
				console.log(bc.beacons[x]);
				console.log("bn === "+bn);
			
				/*onclick='bd(\""+bn+"\")' */
				content += "<tr  onclick='detail2(\""+ bn  + "\",\""+ addy  + "\");'   onmouseover='myMap1(\"" + lat + "\",\"" + lng+ "\",\"" + p+ "\",\""+ des + "\");''>"
				+"<td style='text-align: center;vertical-align: middle;'><img src="+image+"></td>" 	 						
				+"<td style='word-wrap:break-word;overflow:hiden;text-overflow:ellipsis;max-width:200px'>" + des.toUpperCase().bold() + ""
				 	 						+"<br>" + addy + "</td>"
						         			
										+"</tr>";
						   });
		 
			$('#beacondetail2').html(content);
			
	 	 });  
   });
</script>
<script type="text/javascript">
function closebtn2(){
	$(".details2").hide();
	//$(".details").fadeIn(500);
	$("#hidecol").show();
	//location.reload();
	//window.close();
	//document.location.load();
}

var gbn = '';
var advertid='';
var advertype='';
function detail2(bn,addy){

     $.post("http://localhost:8080/beacons/oneBeacon", {
//   $.post("http://45.114.79.187/beacons/oneBeacon", { 
			bn : bn
	},  function(response) {
		  console.log(response);
		  var bd = JSON.parse(response.toString());
		  console.log("responseGOOGLEAPI=====");
		  console.log(bd);
		
		         gbn = bd.beaconName;
		  	     advertid=bd.advertisedId.id;
		 	     advertype=bd.advertisedId.type;
		  			
		         $('#bn').html(bd.beaconName.toUpperCase());
		  	     gbn = bd.beaconName;
//		 		 $('#bcolor').html(bd.description.slice(0,6));
				 $('#atype').html(bd.advertisedId.type);
	             $('#stats').html(bd.status)
	             $('#addre').html(addy);
	             $('#beaconaddress').val(addy);
	            $('#beaconName1').html(bd.beaconName.toUpperCase()); 		   
	            $('#bn1').val(bd.beaconName);
			  	$('#attachli').val(bd.beaconName);
				$('#atype1').val(bd.advertisedId.type);
				$('#aid').val(bd.advertisedId.id);
				$('#stats1').val(bd.status);
				$('#placid1').val(bd.placeId);
				$('#lati').val(bd.latLng.latitude);
				$('#longi').val(bd.latLng.longitude);
				$('#ilname').val(bd.indoorLevel.name);
				$('#stabily').val(bd.expectedStability);
				$('#descrip').val(bd.description);
				$('#pname').val(bd.properties.Name);
				$('#pplace').val(bd.properties.Place);
				$('#pos').val(bd.properties.position);
		});	
		$(".details2").show();
		$("#hidecol").hide();
	
	$("#editelements2 p").show();

	$(".inputid").css('display','none');
}
console.log("gbn 0 = "+gbn);
function addAttachments() {

	$.post("http://localhost:8080/beacons/addAttachments", { 
//	$.post("http://45.114.79.187/beacons/addAttachments", {
					gbn : gbn,
					atitle : $('#atitle').val(),
					aurl : $('#aurl').val(),
					sdate : $('#sdate').val(),
					edate : $('#edate').val()
//					stime : $('#stime').val(),
//					etime : $('#etime').val()
			},  function(response) {
				console.log("gbn 1 = "+gbn);  
				console.log(response);
			});
 	}
//delete beacon
function deleteBeacon() {
	var result = confirm("Want to delete?");
	if (result) {
	    //Logic to delete the item
	
 	$.get("http://localhost:8080/beacons/deleteBeacon", { 
//	$.get("http://45.114.79.187/beacons/deleteBeacon", {
					gbn : gbn
			},  function(response) {
				console.log("gbn deleteBeacon = "+gbn);  
				console.log(response);
				alert("Beacon Deleted Successfully");
				location.reload();
			});
 	}
}

//get Attachment List
function getforobserved() {
	
	$.post("http://localhost:8080/beacons/getforobserved", {
//	$.post("http://45.114.79.187/beacons/getforobserved", { 
					advertid : advertid,
					advertype : advertype
			},  function(response) {
				  console.log(response);
				  
				 var obsjson = JSON.parse(response.toString());
			//	 var aa=obsjson.beacons.advertisedId.id;
			//	 alert(aa);
				  console.log("GetForObserved ===== ");
				  console.log(obsjson);
				});
	}
function attachment() {
	$('#beacondetail1').html(''); 
	$.get("http://localhost:8080/beacons/addAttachments", { 
//		$.get("http://45.114.79.187/beacons/addAttachments", {
					gbn : gbn
			},  function(response) {
				  console.log(response);
				  var bd = JSON.parse(response.toString());
				  console.log(bd);
				  console.log("gbn attachment = "+gbn);
				  var content = '';
				  var x=0;
			
			if(response!=="{}"){
				$.each(bd.attachments[x], function(i, item) {
					if(x === 'NaN') {
				 		return false;
				 	}
				 	console.log("SK-----------=");
				 	console.log(bd.attachments[x]);
				 	
				 	 if(bd.attachments[x] === undefined) {
				 	//	  alert("false");
				 		  return false;
				 		  }
				 	 
				 	  console.log(x);
				 	  console.log("i = "+i);
				 	  console.log(bd.attachments[x]);
					  console.log(bd.attachments[x].namespacedType);
					  console.log(bd.attachments[x].data);
					  var decodedString = atob(bd.attachments[x].data);
					  console.log("decodedString=="+decodedString);
					  console.log("json = "+decodedString.title);
					var len = 0;
					var startdate = '';
					var enddate = '';
					  if (decodedString.charAt(0) === '{') { 
						  json = JSON.parse(decodedString); 
						  console.log("title = "+json.title);
						  console.log("url = "+json.url);
						  if (json.targeting !== undefined) {
							  var target = json.targeting;
						  		console.log("targeting = "+JSON.stringify(target));
						  		console.log("startdate:"+target[0].startdate);
						  		console.log("enddate:"+target[0].enddate);
						  		startdate = target[0].startdate;
						  		enddate = target[0].enddate;
					  		}
//						  console.log("targeting = "+json.targeting[0]);
						  content += "<tr>"
								+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + bd.attachments[x].namespacedType.bold() + ""
								+"<br>" + json.title + ""
								+"<br>" + json.url + ""
								+"<br>" + startdate + ""
								+"<br>" + enddate + "</td>"
								+"<td><button onclick='deleteAttachment(\""+ bd.attachments[x].attachmentName  + "\")' type='button' class='btn btn-primary' style='float:right;'>"
								+"<span class='glyphicon glyphicon-trash'></span></button></td>"
							+"</tr>";
						}
					  else {
						  content += "<tr>"
								+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + bd.attachments[x].namespacedType.bold() + ""
								+"<br>"+decodedString+"</td>"
							+"</tr>";
				 		  }
					  x++;		
	   });
			}
			else{
		     	var errormsg="No Attachments Found For This Beacon" 
				content += "<tr>"
					+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + errormsg.fontsize(5).fontcolor("red").bold() + "</td>"
				+"</tr>"; 
			}
		$('#beacondetail1').html(content);
			});
}

// deleteAttachment from Google
function deleteAttachment(attachmentName) {
	
	$.post("http://localhost:8080/beacons/deleteAttachment", {
//	$.post("http://45.114.79.187/beacons/deleteAttachment", { 
					attachmentName : attachmentName
			},  function(response) {
				  console.log(response);
				  alert("Attachment Deleted Successfully");
				  location.reload();
				});
	}

$('#addFields').click(function () {
    var zzz = "<br><br><div class='col-sm-12'> <input class='form-control' name='aname' id='aname' type='hidden' value='' readonly> </div> <div class='col-sm-12'> <input class='form-control' name='adata' id='adata' type='text' placeholder='Enter Data' value='' required> </div>";
    $('#iterateattach').append(zzz);
});

</script>
<script type="text/javascript">
var map;
	function myMap1(lat, lng, p, des) {
//	var splits = lat.split(",");
	console.log("des = "+des);
	var lat = lat;
	var lng = lng;
	var pid = p;
	console.log("place id in myMap function = "+p);
	var bn= des;
	
	var myCenter = new google.maps.LatLng(lat,lng);
	var map = new google.maps.Map(document.getElementById('map'), {
		center: myCenter,
		zoom: 12
	});
	var infowindow = new google.maps.InfoWindow();
	var service = new google.maps.places.PlacesService(map);
	service.getDetails({
		placeId: pid
	}, function(place, status) {
	
			if (status === google.maps.places.PlacesServiceStatus.OK) {
		    	var marker = new google.maps.Marker({
		    		map: map,
		        	position: place.geometry.location
		    	});
		    	google.maps.event.addListener(marker, 'mouseover', function() {
		    		infowindow.setContent('<div><strong>' + bn + '</strong><br>' +
		    		place.formatted_address + '</div>');
		    		
		    		infowindow.open(map, this);

				});
		    	}
		});
	}
</script>
	<!-- <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&callback=initMap"
		async defer></script> -->
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

<script type="text/javascript">
 function myMap() {
	  var myCenter = new google.maps.LatLng(34.1017,-118.3382);
	  var mapCanvas = document.getElementById("map");
	  var mapOptions = {center: myCenter, zoom: 12};
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
//      map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
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
var lat, lng;

function initAutocomplete() {
	var myCenter = new google.maps.LatLng(34.1017,-118.3382);
	  var mapCanvas = document.getElementById("map");
	  var mapOptions = {center: myCenter, zoom: 8};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	  google.maps.event.addListener(marker,'click',function() {
	    map.setZoom(5);
	    map.setCenter(marker.getPosition());
	  });
	var input = document.getElementById('address');
	var input1 = document.getElementById('beaconaddress');
	autocomplete = new google.maps.places.Autocomplete( (input), {types: ['geocode']});
	console.log(autocomplete);
	console.log("input1 = "+input1);
	autocomplete.bindTo('bounds', map);
    autocomplete.addListener('place_changed', fillInAddress);
    
    autocomplete1 = new google.maps.places.Autocomplete( (input1), {types: ['geocode']});
	console.log(autocomplete1);
	autocomplete1.bindTo('bounds', map);
    autocomplete1.addListener('place_changed', fillInAddress1);
  }
  function fillInAddress() {
    var place = autocomplete.getPlace();
    var x = place.place_id;
    var y = place.formatted_address;
    console.log("x="+x);
    console.log("Y="+y);
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
  function fillInAddress1() {
	    var place = autocomplete.getPlace();
	    var x = place.place_id;
	    var y = place.formatted_address;
	    console.log("x = "+x);
	    console.log("y = "+y);
		document.getElementById("placeid1").value = x;
		document.getElementById("beaconaddress").value = y;
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
	  			document.getElementById("lati").value = de.lat;
	  			document.getElementById("longi").value = de.lng;
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
</body>
</html>