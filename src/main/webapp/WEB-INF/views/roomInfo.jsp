<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/taglibs/image.tld" prefix="ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Room Information</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <!-- bedpop link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <style>
#imgZoom {
    height: 100;
}
img#imgZoom:hover {
    position: relative;
    -webkit-transform: scale(4.0);
    -ms-transform: scale(4.0);
    -o-transform: scale(4.0);
    transform: scale(4.0);
    z-index: 1000;
}
* {
    -webkit-transition: all 1.0s ease-in-out;
    -moz-transition: all 1.0s ease-in-out;
    -ms-transition: all 1.0s ease-in-out;
    -o-transition: all 1.0s ease-in-out;
    transition: all 1.0s ease-in-out;
}

#overlay {
    visibility: hidden;
    position: absolute;
    left: 0px;
    top: 0px;
    width:10%;
    height:10%;
    padding-top:30%;
    border: 5px solid gray;
    background-color: white;
    opacity:0.4;
    text-align:center;
    z-index: 1000;
}


</style>
  
 
</head>
<body style="background-color: rgb(243,210,230);">
<!--Header-->
<nav class="navbar navbar-default navbar-inverse" role="navigation" style="background-color: rgb(243,210,230);">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="showHome">DivaStays</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="showHelp">Help</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!--End of Header-->
<!--Room details Start-->

<div class="container">    
 <div class="row">
 <!--Room 1 Section-->
    <div class="col-sm-5">
      
      <div class="tab-content">
      
       <h3>Details of Room</h3>
          <div class="w3-container">
         <table class="table">
           <thead>
              <tr class="w3-light-grey w3-hover-red">
                 <th>Things</th>
                 <th>Details</th>
             </tr>
           </thead>
             <tr class="w3-hover-green">
                <td>Type of Room</td>
                <td>${room.roomtype}</td>
             </tr>
             <tr class="w3-hover-green">
                <td>FoodAvailability</td>
                <td>${room.foodAvailability}</td>
             </tr>
             <tr class="w3-hover-green">
                <td>Facilities</td>
                <td>      AC          : ${room.ac}
                <br>
                         Wifi         : ${room.wifi}
                <br>     Bathroom     : ${room.bathroom}
                <br>     Geyser       : ${room.geyser}
                
                <br>     Gym          : ${room.gym}
                <br>     SwimmingPool : ${room.swimmingPool} </td>
            </tr>
             <tr class="w3-hover-green">
                <td>Total Bed</td>
                <td>
                    <ul>
                      <li><a data-toggle="collapse" data-target="#bed1">${room.numberOfBed} </a></li>
                       <div id="bed1" class="collapse">
                         
                       </div>    
         
                    <!--  <li><a data-toggle="collapse" data-target="#bed2">Bed 2</a></li>
                        <div id="bed2" class="collapse">
                           <ol>
                             
                           </ol>    -->
                            
                        </div>
                     </ul> 
                </td>
                
              </tr>
         </table>
 </div>
</div> 
<!--End Room 1 Section-->
   
  </div>
  
  
      <div class="container">    
 <div class="row">
 

    <!--Room 1 Section-->
    <div class="col-sm-5">
      <div class="tab-content">
   		
     
              <div class="w3-container">
         <table class="table">
           <thead>
              <tr class="w3-light-grey w3-hover-red">
                 
                 <th></th>
             </tr>
           </thead>
<c:forEach items="${room.beds}" var="beds" varStatus="itr"> 
<tr class="w3-hover-green">
                <td> <form id="login-form" action="showPaymentPage" method="post" role="form" style="display: block;">
          <!--  <p>
             To Book, you need to pay a token amount and the remaining before move-in.</p> -->
            <br>
            <br>
            <div class="form-group">
	         <div class="row">
	          <div class="col-sm-6 col-sm-offset-3">
		        <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Book Now" style="color:#FF0000">
	          <!--  <form role="form" class="form-vertical">
                               
                                  <p  style="text-align:center" display="inline-block">
     <a class = "btn navbar-btn btn-default" href = "showPaymentPage" style="width:100%" >Self</a>
     <a class = "btn navbar-btn btn-default" href = "showUserReg" style="width:100%" >Other</a>
                                 </p>
                              
                                </form>
	          -->
	         
	          </div>
	        </div> 
	      </div>
         </form></td>
                <td><a class="btn" data-toggle="popover" title="Foodpreference : ${beds.user.foodPreference}   Profession : ${beds.user.profession}  MotherTounge : ${beds.user.motherTongue}"><i class="fa fa-bed fa-5x"></i></a> </td>
             </tr>
             

 </c:forEach>
 </table>
 </div>
 </div>
 </div>
 </div>
</div>
 
 
 <style>
 .data-toggle{
 width:400px;
 height:300px;
 font-weight:900;
}
 </style>
 
 
 
<!-- script for bed popup-->
 <script>
$(document).ready(function() {
	
	
   $('[data-toggle="popover"]').popover({
	   
      placement: 'right',
      trigger: 'hover',
      
    	 
  		
   });
});
	
</script>

 
 <div class="container">
  <div class="row">
   <div class="col-md-4">
  </div>
  <div class="col-md-4">
	<div class="panel panel-login" style="background-color: rgb(243,210,230);">
      <div class="panel-heading row">
	    <div class="row">
		   <div class="col-xs-6 text-center">
			<!-- <a href="#" class="active" id="book">Book</a> --></div>
			<table style="margin-top: 0px;">
			<tr><td>
			<img  id="imgZoom" width="100px" height="80px" onmousemove="zoomIn(event)" onmouseout="zoomOut()"  src="<ui:image img='${room.img1}'></ui:image>" alt="Image"></td>
		  <div id="overlay" onmousemove="zoomIn(event)"></div>
		<td><ul style="list-style-type:circle"></td>
		 <td>
		 <!-- <a href="#" id="visit">Visit</a> -->
		 	<img  id="imgZoom" width="100px" height="80px" onmousemove="zoomIn(event)" onmouseout="zoomOut()"  src="<ui:image img='${room.img2}'></ui:image>" alt="Image">
			</td>
		  
		  		<td><ul style="list-style-type:circle"></td>  
		  		 <td>
		  		    	<img  id="imgZoom" width="100px" height="80px" onmousemove="zoomIn(event)" onmouseout="zoomOut()"  src="<ui:image img='${room.img3}'></ui:image>" alt="Image">
		  		</td></tr> </table>
  </div>
  </div>
  </div>
 
	    </div>
			<hr>
	   </div>
        
        
        
	<div class="panel-body">
	  <div class="row">
		<div class="col-lg-12">
		 <!--  <form id="login-form" action="showPaymentPage" method="post" role="form" style="display: block;">
           <p>
             To Book, you need to pay a token amount and the remaining before move-in.</p>
            <br>
            <br>
            <div class="form-group">
	         <div class="row">
	          <div class="col-sm-6 col-sm-offset-3">
		        <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Book Now" style="color:#FF0000">
	          </div>
	        </div> 
	      </div>
         </form> -->
  
  <form id="register-form" action="" method="post" role="form" style="display: none;">
   <div class="form-group">
	<input type="text" name="name" id="name" tabindex="1" class="form-control" placeholder="Name" value="" onBlur="CheckName(); return false;" required>
      <span id="checkName" class="checkName"></span>
   </div>
   <div class="form-group">
    <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="" onBlur="CheckEmail(); return false;" required> 
      <span id="checkEmail" class="checkEmail"></span>
   </div>
   <div class="form-group">
	<input type="text" name="phone" id="phone" tabindex="2" class="form-control" placeholder="Phone" onBlur="CheckPhone();                  return false;" required>
       <span id="checkPhone" class="checkPhone"></span>
  </div>
								
    <div class="form-group">
	  <div class="row">
	    <div class="col-sm-6 col-sm-offset-3">
	      <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register"                 value="Visit Now" style="color:#FF0000" onClick="Submit();">
		</div>
	  </div>
   </div>
   </form>
			        </div>
			     </div>
		      </div>             
	      </div>
        </div>      
     </div>
    <hr>
</div>
     
     
        	
      
 <!--Script for book and view Code-->
<script>
$(function() {

    $('#book').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#visit').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
</script>

 <script src="js/validate.js" type="text/javascript"></script>
 <script>
// When the user clicks on bed, open the popup
   function bed3() {
    var popup3 = document.getElementById("mypopup3");
	popup3.classList.toggle("show");
	
	}
</script>	
<script>	
	function bed2() {
  
	 var popup2 = document.getElementById("mypopup2");
	
	popup2.classList.toggle("show");
	}
</script>	
<script>	
	function bed1() {
  
	 var popup1 = document.getElementById("mypopup1");
	
	popup1.classList.toggle("show");
	}	
</script>
<script type="text/javascript">
function zoomIn(event) {
  var element = document.getElementById("overlay");
  element.style.display = "inline-block";
  var img = document.getElementById("imgZoom");
  var posX = event.offsetX ? (event.offsetX) : event.pageX - img.offsetLeft;
  var posY = event.offsetY ? (event.offsetY) : event.pageY - img.offsetTop;
  element.style.backgroundPosition = (-posX * 4) + "px " + (-posY * 4) + "px";

}

function zoomOut() {
  var element = document.getElementById("overlay");
  element.style.display = "none";
}
</script>


</body>
</html>