<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Log in</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" type="text/css" href="plugins/iCheck/square/blue.css">
   <style>
  	td img { width: 45%; }
  </style>
    
  <!--  <link rel="shortcut icon" href="dist/ico/minus.png"><img src="dist/img/user2-160x160.jpg" -->
  <link rel="icon" href="dist/img/minus.png" type="image" sizes="16x16">
</head>
<body class="hold-transition login-page">
<header class="main-header" style="background-color:rgb(60, 141, 188)">
    <div class="login-logo" style="padding:10px 0;"> 
  	
  	 <a href="login.jsp"><img src="dist/img/ciweb-brand.png" /> </a> </div> 
  </header>
<div class="login-box">
  <!-- <div class="login-logo"> <a href="login.jsp">Ciweb Tech LLC</a> </div> -->
  <!-- /.login-logo -->
  <div class="login-box-body" style="color:#F3340E"  >
    <p>${msg}</p>
	<p>${logmsg}</p>
    <form action="login" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" name="email" id="email" 
				autofocus required>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat" id="submit" >Sign In</button>
        </div>
    <!--    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="https://www.facebook.com/" class="btn btn-block btn-facebook btn-flat">Sign in using Facebook</a>
      <a href="https://accounts.google.com/ServiceLogin?service=mail&passive=true&rm=false&continue=https://mail.google.com/mail/?tab%3Dwm&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1" 
      		class="btn btn-block btn-google btn-flat"> Sign in using Google+</a> <br>
      
    </div>
 -->      </div>
 
 
    </form>
    <div class="social-auth-links text-center">
      <a href="register.jsp" class="text-center">Register a new membership</a>
    </div>
    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
</div>
</div>
	<footer class="main-footer" style="margin:0;bottom:0;padding: 7px; text-align:center;width:100%; position: absolute">
		Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
	</footer>
</div>
 	
<!-- /.login-box -->
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script type="text/javascript" src="plugins/iCheck/icheck.min.js"></script>
<script>
var email = $("#email").val();
var password = $("#password").val();
$(document).ready(function () {
   $("#email,#password").blur(function () {
   var text = $(this).val();
    if(text == ""){
        $(this).addClass('successcustomred');
    }else{
    	 $(this).removeClass('successcustomred');
    $(this).addClass('successcustomgreen');
    };
  });
});
</script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
