<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Registration | Ciweb</title>
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
  	.glyphiconcolor{ style="color: #068ad6"}
  </style>
  <!--  <link rel="shortcut icon" href="dist/ico/minus.png"><img src="dist/img/user2-160x160.jpg" -->
  <link rel="icon" href="dist/img/minus.png" type="image" sizes="16x16">
</head>
<body class="hold-transition register-page">
<header class="main-header" style="background-color:rgb(60, 141, 188)">
    <div class="login-logo" style="padding:10px 0; background-color: #068ad6;"> 
  	 <a href="login.jsp"><img src="dist/img/ciweb-brand.png" /> </a> </div> 
  </header>
<div class="register-box">
 <!--  <div class="register-logo">
    <a href="login.jsp">Ciweb Tech LLC</a>
  </div> -->
  <div class="register-box-body">
	<p>${msg}</p>
    <form action="userRegister" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Full name" name="full_name" id="full_name" autofocus required>
        <span class="glyphicon glyphicon-user form-control-feedback glyphiconcolor" style="color: #068ad6"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" name="email" id="email" required>
        <span class="glyphicon glyphicon-envelope form-control-feedback glyphiconcolor"style="color: #068ad6"></span>
      </div>
      <div class="form-group has-feedback clearfix">
        <input type="password" class="form-control" placeholder="Password" name="password" id="password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback glyphiconcolor"style="color: #068ad6"></span>
      </div>
      <div class="form-group has-feedback clearfix">
        <input type="password" class="form-control" placeholder="Retype password" name="cpwd" id="cpwd" required>
        <span class="glyphicon glyphicon-log-in form-control-feedback " style="color: #068ad6"></span>
        <span id="message"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" onclick="myFunction()" class="btn btn-primary btn-block btn-flat" id="submit" >Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <div class="social-auth-links text-center">
       <a href="login.jsp" class="text-center">I already have a membership</a>
    </div>
  </div>
  <!-- /.form-box -->
</div>
<footer class="main-footer" style="margin:0;bottom:0;padding: 7px; text-align:center;width:100%; position: absolute">
		Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
	</footer>
<!-- /.register-box -->
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script type="text/javascript" src="plugins/iCheck/icheck.min.js"></script>
<script>
var email = $("#email").val();
var password = $("#password").val();
var name = $("#name").val();
var password = $("#cpwd").val();
$(document).ready(function () {
   $("#email, #full_name, #cpwd, #password").blur(function () {
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
<script>
   function myFunction() {
        var pass1 = document.getElementById("password").value;
        var pass2 = document.getElementById("cpwd").value;
        if (pass1 != pass2) {
            alert("Passwords Do not match");
		}
    }
</script>
<script type="text/javascript">	
		$('#password, #cpwd').on('keyup', function () {
		    if ($('#password').val() == $('#cpwd').val()) {
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
