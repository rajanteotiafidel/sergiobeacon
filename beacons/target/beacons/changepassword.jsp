<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Profile | Ciweb</title>
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
			<p>${msg}</p>
			<div class="row">
				<div class="col-sm-offset-3 col-sm-6">
					<!-- general form elements -->
					<div class="box box-primary panel-body">
						<!-- /.box-header -->
						<!-- form start -->
						<form role="form" method="post" action="changepassword">
							<h4 style="text-align: center;color: #068ad6;">Change Password</h4>
							<div class="box-body">
							<p>${msg}</p>
								
							<%-- 	<div class="form-group clearfix">
									<label for="password">Change Password:</label> 
									<input class="form-control" id="password" name="password" value="${password}" 
											placeholder="Password" type="password">
								</div> --%>
								<div class="form-group  has-feedback clearfix">
									<label   for="inputPassword">Password:</label>
									<input  class="form-control" type="password" name="password" id="password1"
										placeholder="Enter Password"   required/>
									<span class="glyphicon glyphicon-lock form-control-feedback " style="color: #068ad6;"></span>
											
								</div>
					        	<div class="form-group  has-feedback clearfix">
									<label  for="inputPassword">Confirm Password:</label>
									<input  class="form-control"type="password" name="password" id="password2"
										placeholder="Re-enter Password"  required />
									<span class="glyphicon glyphicon-log-in form-control-feedback" style="color: #068ad6"></span>
									<span id="message"></span>
								</div>
								
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" class="btn btn-primary" style="float:right;" name="submit" id="submit">Submit</button>
							</div>
						</form>
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
<!-- <script>
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
</script> -->
<script type="text/javascript">	
		$('#password1, #password2').on('keyup', function () {
		    if ($('#password1').val() == $('#password2').val()) {
		        $('#message').html('Matching').css('color', 'green');
		        $("#submit").prop('disabled',false);
		    } else {
		        $('#message').html('Not Matching').css('color', 'red');
		    	$("#submit").prop('disabled', true);
		}
		});
</script>
</body>
</html>