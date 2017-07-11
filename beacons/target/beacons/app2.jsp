<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<meta charset="utf-8">
<style>

body { font: 12px Arial;}

path { 
    stroke: steelblue;
    stroke-width: 2;
    fill: none;
}

.axis path,
.axis line {
    fill: none;
    stroke: grey;
    stroke-width: 1;
    shape-rendering: crispEdges;
}

</style>
<body>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
window.onload = function() {
	console.log("hi");
 	$.post("http://localhost:8080/beacons/telemetry", {
//  $.post("http://45.114.79.187/beacons/telemetry", { 

 				},  function(response) {
 					console.log("telemetry");
 					console.log(response);
 					var tele = JSON.parse(response);
 					var i = 0;
 					console.log(tele);
 					console.log(tele.data[i]);
var margin = {top: 30, right: 40, bottom: 30, left: 50},
    width = 600 - margin.left - margin.right,
    height = 270 - margin.top - margin.bottom;

var parseDate = d3.time.format("%d-%b-%y").parse;

var x = d3.time.scale().range([0, width]);
var y0 = d3.scale.linear().range([height, 0]);
var y1 = d3.scale.linear().range([height, 0]);

var xAxis = d3.svg.axis().scale(x)
    .orient("bottom").ticks(5);

var yAxisLeft = d3.svg.axis().scale(y0)
    .orient("left").ticks(5);

var yAxisRight = d3.svg.axis().scale(y1)
    .orient("right").ticks(5); 
var data = new Date(tele.data[i].Timestamp).toUTCString().replace('GMT', '').replace(',','');
console.log("data = "+data);
var temp = tele.data[i].Temperature;
var valueline = d3.svg.line()
    .x(function(tele) { return x(data)})
    .y(function(tele) { return y0(temp) });
    
var valueline2 = d3.svg.line()
    .x(function(response) { return x(d.date); })
    .y(function(response) { return y1(d.open); });
  
var svg = d3.select("body")
    .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
    .append("g")
        .attr("transform", 
              "translate(" + margin.left + "," + margin.top + ")");

// Get the data
d3.csv(response, function(error, data) {
    console.log("tele = "+JSON.stringify(tele));
//     tele.data[i-1].Temperature.forEach(function(tele) {
        console.log("response = "+response);
/*    	d.date = parseDate(d.date);
    	tele.data[i].Temperature = +tele.data[i].Temperature;
    	tele.data[i].Lightsensor = +tele.data[i].Lightsensor;
    	i++
    }); */

    // Scale the range of the data
    x.domain(d3.extent(response, function(d) { return tele.data[i].Timestamp; }));
    y0.domain([0, d3.max(response, function(d) {
		return Math.max(tele.data[i].Temperature); })]); 
    y1.domain([0, d3.max(response, function(d) { 
		return Math.max(tele.data[i].Lightsensor); })]);

    svg.append("path")        // Add the valueline path.
        .attr("d", valueline(tele));

    svg.append("path")        // Add the valueline2 path.
        .style("stroke", "red")
        .attr("d", valueline2(tele));

    svg.append("g")            // Add the X Axis
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .style("fill", "steelblue")
        .call(yAxisLeft);	

    svg.append("g")				
        .attr("class", "y axis")	
        .attr("transform", "translate(" + width + " ,0)")	
        .style("fill", "red")		
        .call(yAxisRight);

});
});
}
</script>