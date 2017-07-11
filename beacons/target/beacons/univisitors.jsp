<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Unique Visitors | Ciweb</title>
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
  <link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
  <style>
  	td img { width: 45%; }
.days-hours-heatmap{padding: 20px 0 20px 0;width: 500px;margin: 0 auto;}
.days-hours-heatmap .calibration{margin-bottom: 15px;width:400px;}
.days-hours-heatmap .calibration .group{display: inline-block;}
.days-hours-heatmap .calibration .description{width:108px;}
.days-hours-heatmap .calibration .description>label:last-child{float:right;}
.days-hours-heatmap .calibration>.display-control{float:right;}
.days-hours-heatmap .calibration>.display-control label{vertical-align: top;}
.days-hours-heatmap .calibration>.display-control input[type='radio']{cursor: pointer;}
.days-hours-heatmap .heatmap .axis path{display: none;}
.days-hours-heatmap .heatmap .axis line{fill: none;stroke: #000;shape-rendering: crispEdges;}
.days-hours-heatmap .heatmap .axis text{font-size: 12px;}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="index" class="logo">
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
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs">${name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
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
          </li>
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
        	<p>${name}</p>
        </div> <!--           <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
        <div class="pull-left info">
          <p>${name}</p> <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
       <li class="treeview"> <a href="index"> <i class="fa fa-dashboard"></i> <span>Dashboard</span> </a> </li>
       <li class="treeview"> <a href="BeaconSuccess.jsp"> <i class="fa fa-signal"></i> <span>Beacons</span> </a> </li>
       <li class="treeview"> <a href="nearable.jsp"> <i class="fa fa-road"></i> <span>Nearables</span> </a> </li>
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
        </li>
        <li class="treeview"> <a href="profile"> <i class="fa fa-signal"></i> <span>Profile</span> </a> </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-television"></i> <span>Channels</span>
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
    <section class="content-header">
      <h1> Unique Visitors </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-connectdevelop"></i>Analytics</li>
        <li class="active">Unique Visitors</li>
      </ol>
    </section>
      <!-- Main content -->
 <section class="content">
     <div class="row">
       <div class="col-sm-12">
         <div class="form-group col-sm-2 pl">
                  <select class="form-control">
                    <option>Last 24 hours</option>
                    <option>Last 7 days</option>
                    <option>Last 4 weeks</option>
                    <option>Last 3 months</option>
                    <option>Last 6 months</option>
                  </select>
                </div>
               <div class="form-group col-sm-3 pl"> 
                <div class="nav-tabs-custom clearfix">
                 <ul class="nav nav-tabs customtabs">
	              <li class="active"><a href="#trend" data-toggle="tab" aria-expanded="false">Trend</a></li>
	              <li class=""><a href="#distribution" data-toggle="tab" aria-expanded="true">Distribution</a></li>
	            </ul>
	            </div>
                </div>
       </div>
     </div>
     <div class="row">
    <div class="col-sm-12">
      <div class="box box-primary panel-body">
         <div class="box-body text-center">
          <div class="tab-content">
              <div class="tab-pane active" id="trend">
              <div class="days-hours-heatmap">
      <!-- calibration and render type controller -->
			      <div class="calibration" role="calibration">
			        <div class="group" role="example">
			          <svg width="120" height="17">
			          </svg>
			          <div role="description" class="description">
			            <label>Less</label>
			            <label>More</label>
			          </div>        
			        </div>
			        <div role="toggleDisplay" class="display-control">
			          <div>
			            <input type="radio" name="displayType" checked/>
			            <label>count</label>
			          </div>
			          <div>
			            <input type="radio" name="displayType"/>
			            <label>daily</label> 
			          </div>
			        </div>
			      </div>
			      <!-- heatmap -->
			      <svg role="heatmap" class="heatmap"></svg>
			    </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="distribution">
              pronunciation and more common
                words. If several languages coalesce, the grammar of the resulting language is more simple
                and regular than that of the individual languages.
              </div>
              <!-- /.tab-pane -->
              <!-- /.tab-pane -->
            </div>
           </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div>
  </div>
      <!-- /.row -->
       <div class="row">
    <div class="col-sm-12">
      <div class="box box-primary panel-body">
       <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
	              <li class="active"><a href="#Location" data-toggle="tab" aria-expanded="false">By Location</a></li>
	              <li><a href="#Tag" data-toggle="tab" aria-expanded="true">By Tag</a></li>
	              <li><a href="#App" data-toggle="tab">By App</a></li>
	            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="Location">
               <table class="table table-striped table-responsive">
               <thead>
               <th>Location</th>
               <th class="text-right">Visits</th>
               </thead>
               <tbody>
               <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
               <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
                <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
               <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
                <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
               <tr>
               <td>5322 Otter Lane Middleberge FL 32068</td>
                <td class="text-right">1225</td>
               </tr>
               </tbody>
               </table>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="Tag">
               , pronunciation and more common
                words. If several languages coalesce, the grammar of the resulting language is more simple
                and regular than that of the individual languages.
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="App">
              th desktop publishing software
                like Aldus PageMaker including versions of Lorem Ipsum.
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
      </div><!-- /.box -->
    </div>
  </div>
  <!-- row /-->    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    Copyright &copy; 2017 <a href="http://www.ciweb.co/index.php/64-2/"> Ciweb Tech LLC</a>. All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->
<script type="text/javascript" src="http://d3js.org/d3.v3.js"></script>
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
<script>
(function(){
	  //UI configuration
	  var itemSize = 18,
	    cellSize = itemSize-1,
	   width = 1000,
	  height = 400,
	    margin = {top:20,right:20,bottom:20,left:25};
	  //formats
	  var hourFormat = d3.time.format('%H'),
	    dayFormat = d3.time.format('%j'),
	    timeFormat = d3.time.format('%Y-%m-%dT%X'),
	    monthDayFormat = d3.time.format('%m.%d');
	  //data vars for rendering
	  var dateExtent = null,
	    data = null,
	    dayOffset = 0,
	    colorCalibration = ['#f6faaa','#FEE08B','#FDAE61','#F46D43','#D53E4F','#9E0142'],
	    dailyValueExtent = {};
	  //axises and scales
	  var axisWidth = 0 ,
	    axisHeight = itemSize*24,
	    xAxisScale = d3.time.scale(),
	    xAxis = d3.svg.axis()
	      .orient('top')
	      .ticks(d3.time.days,3)
	      .tickFormat(monthDayFormat),
	    yAxisScale = d3.scale.linear()
	      .range([0,axisHeight])
	      .domain([0,24]),
	    yAxis = d3.svg.axis()
	      .orient('left')
	      .ticks(5)
	      .tickFormat(d3.format('02d'))
	      .scale(yAxisScale);
	  initCalibration();
	  var svg = d3.select('[role="heatmap"]');
	  var heatmap = svg
	    .attr('width',width)
	    .attr('height',height)
	    .append('g')
	    .attr('width',width-margin.left-margin.right)
	    .attr('height',height-margin.top-margin.bottom)
	    .attr('transform','translate('+margin.left+','+margin.top+')');
	  var rect = null;
	  d3.json('heat.json',function(err,data){
	    data = data.data;
	    data.forEach(function(valueObj){
	      valueObj['date'] = timeFormat.parse(valueObj['timestamp']);
	      var day = valueObj['day'] = monthDayFormat(valueObj['date']);
	      var dayData = dailyValueExtent[day] = (dailyValueExtent[day] || [1000,-1]);
	      var pmValue = valueObj['value']['PM2.5'];
	      dayData[0] = d3.min([dayData[0],pmValue]);
	      dayData[1] = d3.max([dayData[1],pmValue]);
	    });
	    dateExtent = d3.extent(data,function(d){
	      return d.date;
	    });
	    axisWidth = itemSize*(dayFormat(dateExtent[1])-dayFormat(dateExtent[0])+1);
	    //render axises
	    xAxis.scale(xAxisScale.range([0,axisWidth]).domain([dateExtent[0],dateExtent[1]]));  
	    svg.append('g')
	      .attr('transform','translate('+margin.left+','+margin.top+')')
	      .attr('class','x axis')
	      .call(xAxis)
	 	  .append('text')
	      .text('date')
	      .attr('transform','translate('+axisWidth+',-10)');
	    svg.append('g')
	      .attr('transform','translate('+margin.left+','+margin.top+')')
	      .attr('class','y axis')
	      .call(yAxis)
	    .append('text')
	      .text('time')
	      .attr('transform','translate(-10,'+axisHeight+') rotate(-90)');
	    //render heatmap rects
	    dayOffset = dayFormat(dateExtent[0]);
	    rect = heatmap.selectAll('rect')
	      .data(data)
	    .enter().append('rect')
	      .attr('width',cellSize)
	      .attr('height',cellSize)
	      .attr('x',function(d){
	        return itemSize*(dayFormat(d.date)-dayOffset);
	      })
	      .attr('y',function(d){            
	        return hourFormat(d.date)*itemSize;
	      })
	      .attr('fill','#ffffff');
	    rect.filter(function(d){ return d.value['PM2.5']>0;})
	      .append('title')
	      .text(function(d){
	        return monthDayFormat(d.date)+' '+d.value['PM2.5'];
	      });
	    renderColor();
	  });
	  function initCalibration(){
	    d3.select('[role="calibration"] [role="example"]').select('svg')
	      .selectAll('rect').data(colorCalibration).enter()
	    .append('rect')
	      .attr('width',cellSize)
	      .attr('height',cellSize)
	      .attr('x',function(d,i){
	        return i*itemSize;
	      })
	      .attr('fill',function(d){
	        return d;
	      });
	    d3.selectAll('[role="calibration"] [name="displayType"]').on('click',function(){
	      renderColor();
	    });
	  }
	  function renderColor(){
	    var renderByCount = document.getElementsByName('displayType')[0].checked;
	    rect
	      .filter(function(d){
	        return (d.value['PM2.5']>=0);
	      })
	      .transition()
	      .delay(function(d){      
	        return (dayFormat(d.date)-dayOffset)*15;
	      })
	      .duration(500)
	      .attrTween('fill',function(d,i,a){
	        var colorIndex = d3.scale.quantize()
	          .range([0,1,2,3,4,5])
	          .domain((renderByCount?[0,500]:dailyValueExtent[d.day]));

	        return d3.interpolate(a,colorCalibration[colorIndex(d.value['PM2.5'])]);
	      });
	  }
	  d3.select(self.frameElement).style("height", "600px");  
	})();
</script>
</body>
</html>
