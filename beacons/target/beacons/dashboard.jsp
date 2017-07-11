<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Dashboard | Ciweb</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" type="text/css" href="plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" type="text/css" href="plugins/select2/select2.min.css">
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
.col-sm-offset-3{margin-left:5%;}
.col-sm-6{width:50%}
.collapse.in{padding-left: 2%;}
button{width: 100%;}
.glyphicon-chevron-right{float:right;}
.justify{text-align: justify;}
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
		<!-- Main content -->
		<section class="content">
			<h3 class="text-center text-uppercase mb20"></h3>
			
			<div class="row">
				<div class="col-sm-offset-3 col-sm-6">
					<!-- general form elements -->
					<div class = "panel-group" id = "accordion">
   						<div class = "panel panel-default">
							<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
            						data-target="#configure" aria-expanded="false" aria-controls="collapseExample"> 
            						Configure Beacon to Add into Ciweb Cloud<span class="glyphicon glyphicon-chevron-right"></span>
  							</button>
      						<div id = "configure" class = "panel-collapse collapse in">
         						<div class = "panel-body">
  									<div class="card card-block">
  										<ol>
  											<li>Open Estimote App</li>
  											<li>View beacons in List View</li>
  											<li>Click on beacon to configure</li>
  											<li>Enable iBeacon, Eddystone-UID, Eddystone-TLM</li>
  										</ol>
  									</div>
         					</div>
      					</div>
					</div>
					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#addBeacon" aria-expanded="false" aria-controls="collapseExample"> Add Beacon into Ciweb Cloud
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "addBeacon" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Go to Locations page</li>
  										<li>Click on 'GOOGLE API LIST'</li>
  										<li>Click <button type="button" class="btn btn-default btn-sm  addbutton btn-custom"
  													style="background-color:#068ad6;color:white;width:15%">
													<span class="glyphicon glyphicon-plus-sign"></span> Add </button></li>
  										<li>Select iBEACON</li>
  										<li>Enter UUID, Major, Minor</li>
  										<li>Enter Address of Beacon</li>
  										<li>Enter Unique Description for Beacon</li>
  										<li>Click on Save</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#addAttachment" aria-expanded="false" aria-controls="collapseExample"> Add Attachment for Beacon
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "addAttachment" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Go to Locations page</li>
  										<li>Click on 'GOOGLE API LIST'</li>
  										<li>Click on Beacon to add Attachment for</li>
  										<li>Click  <button type="button" class="btn btn-primary" style="width:10%;">
  													<span class="glyphicon glyphicon-paperclip"></span></button></li>
  										<li>Click on 'Add Attachments'</li>
  										<li>Enter Title of Attachment</li>
  										<li>Enter URL of https:// format</li>
  										<li>Select start date of notification</li>
  										<li>Select end date of notification</li>
  										<li>Click on Save Changes</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#prerequisites" aria-expanded="false" aria-controls="collapseExample"> 
								Prerequisites to Receive Notification 
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "prerequisites" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Android phone should have v5.1 and above</li>
  										<li>Bluetooth should be enabled</li>
  										<li>Location should be enabled</li>
  										<li>Phone should be connected to Internet to go to the link provided in the Notification</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#details" aria-expanded="false" aria-controls="collapseExample"> Beacon Details 
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "details" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Go to Locations page</li>
  										<li>Click on 'GOOGLE API LIST'</li>
  										<li>Click on Beacon</li>
  										<li>Click on <button type="button" class="btn btn-primary" style="width:15%;">
  													<span class="glyphicon glyphicon-edit"></span> Edit </button></li>
  										<li>View Details of Beacon</li>
  										<li>Click 'Properties' to View Properties of Beacon</li>
  										<li>Edit any field and Click 'Save Changes'</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#deleteAttachment" aria-expanded="false" aria-controls="collapseExample"> View & Delete Attachment for Beacon
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "deleteAttachment" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Go to Locations page</li>
  										<li>Click on 'GOOGLE API LIST'</li>
  										<li>Click on Beacon</li>
  										<li>Click  <button type="button" class="btn btn-primary" style="width:10%;">
  													<span class="glyphicon glyphicon-paperclip"></span></button></li>
  										<li>Click on 'List Attachments'</li>
  										<li>View Attachments of Beacon</li>
  										<li>Click <button type="button" class="btn btn-primary"  style="width:10%;">
           									<span class="glyphicon glyphicon-trash"></span></button>to delete particular Attachment</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#deleteBeacon" aria-expanded="false" aria-controls="collapseExample">Delete Beacon from Ciweb Cloud
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "deleteBeacon" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol>
  										<li>Go to Locations page</li>
  										<li>Click on 'GOOGLE API LIST'</li>
  										<li>Click on Beacon</li>
  										<li>Click <button type="button" class="btn btn-primary"  style="width:10%;">
           									<span class="glyphicon glyphicon-trash"></span></button>to delete particular beacon</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>
   					<div class = "panel panel-default">
						<button class="btn btn-primary" type="button" data-toggle="collapse" data-parent = "#accordion" 
								data-target="#faqs" aria-expanded="false" aria-controls="collapseExample"> FAQs
							<span class="glyphicon glyphicon-chevron-right"></span>
  						</button>
						<div id = "faqs" class = "panel-collapse collapse">
         					<div class = "panel-body">
            					<div class="card card-block">
  									<ol class="justify">
  										<li>Invalid UUID, Major, Minor during registration
  											<ul class="justify">
  												<li>The entered UUID, Major and Minor does not match with the Ciweb Cloud protocols</li>
  												<li>The UUID should be a HEX code</li>
  												<li>The Major and Minor should not be greater than five-digits and should be in decimal format (base 10)</li> 
  											</ul>
  										</li>
  										<li>Beacon Already Registered
  											<ul class="justify">
  												<li>The entered UUID with same Major and Minor has already been registered with the Ciweb Cloud by someone else</li>
  												<li>Connect to beacon with the manufacturer's App and change the Major or Minor or both for that particular beacon</li>
  												<li>Try registering the beacon with new Major, Minor with the Ciweb Cloud</li> 
  											</ul>
  										</li>
  										<li>Bad Request while registering beacon
  											<ul class="justify">
  												<li>The beacon you are trying to the Google Account has not authorized you</li>
  											</ul>
  										</li>
  										<li>Invalid Request
  											<ul class="justify">
  												<li>The beacon you are trying to the Ciweb Cloud has not responded well</li>
  												<li>The Internet connection you are using might be slow</li>
  												<li>The request to the Google Cloud to register the beacon timed out</li>
  											</ul>
  										</li>
  										<li>Should the 'Description' provided at the time of registering beacon be unique
  											<ul class="justify">
  												<li>Registering beacon with unique description helps you identify in the list later</li>
  												<li>You can change the description for the beacon any time</li>
  											</ul>
  										</li>
  										<li>Password not visible in Profile page
  											<ul class="justify">
  												<li>The password is not shown for security reasons</li>
  											</ul>
  										</li>
  										<li>Change Password
  											<ul class="justify">
  												<li>Go to Profile page and Enter Password</li>
  												<li>Re-enter Password in Confirm Password</li>
  												<li>Click 'Submit' to make password change effective</li>
  												<li>OR</li>
  												<li>Click on your name in the tp-right corner of the page</li>
  												<li>Click 'Change Password'</li>
  												<li>Enter Password</li>
  												<li>Re-enter Password in Confirm Password</li>
  												<li>Click 'Submit' to make password change effective</li>
  												<li>Next time you login, make use of the new password</li>
  											</ul>
  										</li>
  										<li>Locate Beacon on Map
  											<ul class="justify">
  												<li>Go to Locations page</li>
  												<li>Click on 'GOOGLE API LIST'</li>
  												<li>Move mouse over Beacon</li>
  												<li>Now the marker in the Map has moved to the registered location of Beacon</li>
  												<li>Map has zoomed</li>
  												<li>Move mouse over marker on Map</li>
  												<li>Beacon Description with Registered address will pop-up</li>
  											</ul>
  										</li>
  									</ol>
  								</div>
         					</div>
      					</div>
   					</div>

					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
</div>
	<footer class="main-footer" style="margin:0;bottom:0;padding: 7px; text-align:center;width:100%; position:relative">
		Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
	</footer>
</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="https://www.tutorialspoint.com/scripts/jquery.min.js"></script>
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
<script type="text/javascript" src="plugins/select2/select2.full.min.js"></script>
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
<!-- <script>
$(document).ready(function(){
    $(".btn-primary").click(function(){
        $(".collapse").collapse('show');
    });
    $(".btn-primary").click(function(){
        $(".collapse").collapse('hide');
    });
});
</script> -->
<script>
	$(function() {
		$(".select2").select2();
		$("#othername").hide();
		$("#othercheckbox").hide();
	});
	$(function() {
		$("input[type=radio]").on('click', function(){
			if ($('#other').is(':checked')){
				$("#othername").slideDown("slow");
			} else { 
				$("#othername").slideUp("slow");
			}
		});
	});
	$(function() {
		$("input[type=checkbox]").on('click', function(){
			if ($('#othercheck').is(':checked')){
				$("#othercheckbox").slideDown("slow");
			} else { 
				$("#othercheckbox").slideUp("slow");
			}
		});
	});
</script>
</body>
</html>