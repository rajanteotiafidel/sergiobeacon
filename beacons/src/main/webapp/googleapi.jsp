<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Google API | Ciweb</title>
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
    <!-- <section class="content-header">
      <h1> Google API </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Google API</li>
      </ol>
    </section> -->
    <!-- Main content -->
    <section class="content">
    <!-- Default box -->
    <div class="login-box">
    <div class="text-center">
   		 <img src="dist/img/google.png" width="100px" />
    </div>
  <h3 class="text-center text-uppercase mb20 mt0">Google Account</h3>
  <!-- /.login-logo -->
 <!--  <div class="login-box-body">
     <form action="" method="post" class="panel-body">
      <div class="row">
        /.col
        <div class="col-xs-12">
          <a type="submit" href="index" class="btn btn-primary btn-block btn-flat">Associate</a>
        </div>
        /.col
      </div>
    </form>
   </div> -->
   <!--  <div class="login-box-body"> -->
  <!--   <form action="googleapi" method="post" class="panel-body"> -->
      <div class="form-group has-feedback">
        <!-- <input type="text" name="project_Id" class="form-control" placeholder="PROJECT ID" id="project_Id"  autofocus required>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span> -->
       <!--  <input class="form-control" id="projectid" name="projectid"  autofocus
											placeholder="Enter Project Id" type="text" required> -->
      </div>
      <div class="form-group has-feedback">
      <!--   <input type="password" name="password" class="form-control" placeholder="Password" id="password" required> -->
    <!--   <input type="text" name="api_key" class="form-control" placeholder="API KEY" id="api_key"  autofocus required> -->
   <!--  <input class="form-control" id="apikey" name="apikey" 
											placeholder="Enter Api Key" type="text" required> -->
        <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span> -->
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-12">
          <button   onclick="location.href='https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/userlocation.beacon.registry&amp;access_type=offline&amp;include_granted_scopes=true&amp;state=state_parameter_passthrough_value&amp;redirect_uri=https://0c84476a.ngrok.io/beacons/callback&amp;response_type=code&amp;client_id=337655747815-2l4ghd53davhqfvtehhdpo6dmj46eop9.apps.googleusercontent.com'" type="submit" id="submit" class="btn btn-primary btn-block btn-flat">Associate</button>
        </div>
        <!-- /.col -->
      </div>
  <!--   </form> -->
  <!--  </div> -->
  <!-- /.login-box-body -->
</div>
    <!-- /.box-body --> 
	</section>    
    <!-- /.box-footer--> 
  </div>
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
