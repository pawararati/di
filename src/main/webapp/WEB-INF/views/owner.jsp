 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Owner Page</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <script src="js/modernizr.custom.js"></script>
    
 <style>
body {
  background-color: rgb(243,210,230);
}
.iconcontainer {
  margin-top: 20px;
  margin-bottom: 20px;
}
.iconbox {
  background: #ffffff;
  background-color: #ffffff;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  padding: 20px 25px;
  text-align: right;
  display: block;
  margin-top: 60px;
  margin-bottom: 15px;
  }
.iconbox-icon {
  background-color: ;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  border-radius: 50%;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  margin: 0 auto;
  width: 100px;
  height: 100px;
  margin-top: -70px;
}
.iconbox-icon span {
  color: #fff;
  font-size: 42px;
  display: block;
  margin-left: auto;
  margin-right: auto;
  padding-top: 29px;
  text-align: center;
  vertical-align: middle;
}
.featureinfo h4 {
  font-size: 26px;
  letter-spacing: 1px;
  text-transform: uppercase;
}
.featureinfo > p {
  color: white;
  font-size: 16px;
  padding-top: 4px;
  text-align: left;
}
.btn-default {
  text-shadow: 0px 1px 0px #FFF;
  background-image: linear-gradient(to bottom, #FFF 0px, #E0E0E0 100%);
  background-repeat: repeat-x;
  border-color: #CCC;
  box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.15) inset, 0px 1px 1px rgba(0, 0, 0, 0.075);
}
.btn-default:hover,
.btn-default:focus {
  background-color: #e0e0e0;
  background-position: 0 -15px
}
 </style> 		
</head>
<body>
 <nav class="navbar navbar-default navbar-inverse" role="navigation" style="background-color:rgb(243,210,230)">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="showHome"><font color=#000000"><b>DivaStays</b></font></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="showOwnerReg"><font color=#000000">Sign Up</font></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font color=#000000">Login</font><span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
								Login via
					            <form class="form" role="form" method="post" action="loginOwner" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">Email address</label>
											 <input type="email" name="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" autocomplete="off" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="Password" autocomplete="off" required>
                                             <div class="help-block text-right"><a href="">Forget the password ?</a></div>
										</div>
										<div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Sign in</button>
										</div>
										<div class="checkbox">
											 <label>
											 <input type="checkbox"> keep me logged-in
											 </label>
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="showOwnerReg"><b>Join Us</b></a>
							</div>
					 </div>
				</li>
			</ul>
        </li>
        <li><a href="showHelp"><font color=#000000">Help</font></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->

<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
   </div>
 </div>
</nav>
  <img src="images/banner_img.png">         
 <div class="heading">
   <div class="header-section text-center">
     <div class="row section featured topspace">
        <h4><strong>FEATURES</strong></h4>
        <hr class="primary">
	</div>
  </div>
</div>
 <div class="container">
  <div class="iconcontainer">
  
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="iconbox">
            <div class="iconbox-icon">
              <span class="glyphicon glyphicon-user"></span>
             </div>
            <div class="featureinfo">
              <h5 class="text-center"><b>Screened & Verified Tenants</b></h4>
              <h5 class="text-center">
               We verify all of our tenants diligently, checking for their identification and income proofs.</h5>
              <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
            </div>
        </div>
      </div>
      
     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
      <div class="iconbox">
        <div class="iconbox-icon">
          <span class="glyphicon glyphicon-user"></span>
        </div>
        <div class="featureinfo">
          <h5 class="text-center"><b>Renatl default Gurantee</b></h4>
          <h5 class="text-center">
          Irrespective of whether or not the rent has been paid by the tenants, you will receive your rent before the 5th of every month</h5>
          <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
        </div>
      </div>
     </div>
      
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="iconbox">
          <div class="iconbox-icon">
            <span class="glyphicon glyphicon-user"></span>
          </div>
          <div class="featureinfo">
            <h5 class="text-center"><b>Move-In & Move-out Management</b></h4>
            <h5 class="text-center">
            From carpentry to plumbing — enjoy all service and maintance services at pre-negotiated rates.</h5>
            <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
          </div>
        </div>
      </div>
      
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="iconbox">
          <div class="iconbox-icon">
            <span class="glyphicon glyphicon-user"></span>
          </div>
          <div class="featureinfo">
            <h5 class="text-center"><b>Professional maintenance</b></h4>
            <h5 class="text-center">
            From carpentry to plumbing — enjoy all service and maintance services at pre-negotiated rates.</h5>
            <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
          </div>
        </div>
      </div>
      
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="iconbox">
          <div class="iconbox-icon">
            <span class="glyphicon glyphicon-user"></span>
          </div>
          <div class="featureinfo">
            <h5 class="text-center"><b>Agreement & Documentation</b></h4>
            <h5 class="text-center">We draft a professional, legally-vetted rental agreement that covers all the terms and conditions of the nature of the contract.
            </h5>
            <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
          </div>
        </div>
      </div>
      
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="iconbox">
          <div class="iconbox-icon">
            <span class="glyphicon glyphicon-user"></span>
          </div>
          <div class="featureinfo">
            <h5 class="text-center"><b>On Demand Property showcasing</b></h4>
            <h5 class="text-center">दिवा Stay arranges one of our trusted Area Managers to safely and easily show your property any time to interested prospects.
            </h5>
            <a class="btn btn-default btn-sm" href=""about.php#bottom"" role="button">More »</a>
          </div>
        </div>
      </div>
      
    </div>
  </div>

<section id="contact" class="section">
<div class="container">
<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="heading">
            <div class="header-section text-center">
				<h4><strong>HOW IT WORKS</strong></h4>
				 <hr class="primary">
			</div>
		</div>
	</div>
</div>
</div>
<br>
<br>
<div id="feature">
   <div class="container">
      <div class="text-center">
		 <div class="col-md-4">
			<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" >
				<i class="fa fa-book"></i>	
				<h4>You Sign Up For Call</h4>
				<p>We call you up and collect all the details of the property</p>
			</div>
		</div>				
			<div class="col-md-4">
			  <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" >
			 	<i class="fa fa-heart-o"></i>	
				<h4>We Access Your property</h4>
				<p>Our executives take a look at the house and give the green signal</p>
			  </div>
			</div>
			<div class="col-md-4">
			   <div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" >
				 <i class="fa fa-cloud"></i>	
				   <h4>We Settle On An Aggrements</h4>
					<p>Once both the parties are happy we’re in business.</p>
			   </div>
			</div>
		</div>
	  </div>
	</div>
<br>
<br>
<section id="about" class="section">
  <div class="container">
	<div class="row">
		<div class="col-md-7 col-md-offset-2">
		  <div class="heading">
		    <div class="header-section text-center">
              <h4><strong>WORRIED ABOUT PROPERTY DAMAGES? WE'VE GOT YOUR BACK!</strong></h4>
                <hr class="primary">
                <br>
			</div>
		</div>
	   </div>
	</div>
	<div class="row">
		<div class="col-md-6">
		    <div class="team-box">
	          <div class="roles">
				<h4><strong>
				दिवा Stay Rental default gaurantee
				</strong></h4>
				<p>Our rental default program is designed to protect you from a liability in case the tenant fails to pay the rent. Our program ensures that you continue to get your rent on time, without fail, like clockwork.</p>
			 </div>
			</div>
		</div>
		<div class="col-md-6">
		  <div class="team-box">
			<div class="roles">
				<h4><strong>Structure & Content default issurance</strong></h4>
				<p>Our insurance program, provided by TATA AIG, for NO additional charge, is a comprehensive package that protects your home and stuff from accidental damage.</p>
		   </div>
		 </div>
		</div>
	</div>
		</div>
</section><br><br>
<section id="about" class="section">
<div class="container">
	<div class="row">
		<div class="col-md-7 col-md-offset-2">
			<div class="heading">
           	   <div class="header-section text-center">
                  <h4><strong>FAQ's FOR HOUSE OWNERS</strong></h4>
                  <hr class="primary">
			  </div>
			</div>
	   </div>
    <div class="container">
	  <div class="row">
		<div class="col-md-12">
           <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
           
            <!-- first Panel start Here -->
             <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                  <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed" >
                    Q1. How long does it take to list a property on दिवा Stay? <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true" ></span>
                  </a>
                </h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
                <div class="panel-body">
                  <p><b><li>It typically takes 12-16 working days for a property to be listed on the दिवा Stay website</li></b></p>
                </div>
              </div>
            </div>         <!-- first Panel End Here -->

            <!-- second Panel start Here -->
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                  <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  Q2.Does दिवा Stay guarantee a fixed monthly rental?  <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div>
              <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
              <div class="panel-body">
               <ul>
                <p><li><b>दिवा Stay is a home-rental marketplace which matches landlords with verified and committed tenants. The rental income a house can earn would depend on a number of factors, including the location, quality of construction, etc.</li> 
                <li>While we work hard to try and ensure that every listed property gets enough number of house-showings, Pg does NOT guarantee a fixed rental income.</li>
                <li>That said, since PG works on a rental commission model, our success relies on ensuring that your property remains occupied through out the tenure. </b></li></p>
               </ul>
             </div>
              </div>
            </div> <!-- second Panel End Here -->

            <!-- third  Panel start Here -->
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                  <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                  Q3.How does दिवा Stay process monthly rental payments?
<span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div>
              <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree" aria-expanded="true" style="">
                <div class="panel-body">
                <ul>
                  <p><b><li>दिवा Stay's payment system is designed to make transferring money between tenants and house owners as simple and reliable as possible. Here’s how it works:</li>
                   <li>1. For or any given month, दिवा Stay deposits the monthly rent collected from the tenant in Owner’s bank account before (5th) fifth of the immediately succeeding month after deducting applicable the commission and charges.</li>
                   <li>2. This happens irrespective of the fact whether the rent has been collected from the tenant or not.</li></b>
                  </p>
                </ul>
                </div>
              </div>
            </div> <!-- third Panel End Here -->
          <!-- fouth Panel start Here -->
           <div class="panel panel-default">
             <div class="panel-heading" role="tab" id="headingfour">
               <h4 class="panel-title">
                 <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="true" aria-controls="collapsefour">
                   Q4.What are the service fees? <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                 </a>
               </h4>
             </div>
             <div id="collapsefour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingfour" aria-expanded="true" style="">
               <div class="panel-body">
               <ul>
                <p><li>दिवा Stay charges a commission of 12.5% of your monthly rental income. However, please note that this does not include the charges for furnishing, maintenance or any additional charges that may be applicable.</li></p>
               </ul>
              </div>
              </div>
           </div> <!-- fouth Panel End Here -->
           <!-- Fifth Panel start Here -->
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingfive">
                <h4 class="panel-title">
                  <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefive" aria-expanded="true" aria-controls="collapsefive">
                    Q5.Who takes care of utilities? <span class="glyphicon glyphicon-plus pull-right" aria-hidden="true"></span>
                  </a>
                </h4>
              </div>
              <div id="collapsefive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingfive" aria-expanded="true" style="">
                <div class="panel-body">
                <ul>
                  <p><li>Utility bills are typically handled by the tenants residing at the property. House owners looking to list their house need to ensure that all previous dues have been settled before signing the agreement.</li></p>
                </ul>
                 </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><!-- /.sidebar column end here -->
 </div>
</section>
 <!--  from here get in touch -->
 <div class="container">
   <div class="row">
      <div class="col-lg-8 col-lg-offset-2 text-center">
         <h2 class="margin-top-0 wow fadeIn" style="margin-top:10px">Get in Touch</h2>
         <hr class="primary">
         <p>We love feedback. Fill out the form below and we'll get back to you as soon as possible.</p>
      </div>
       <div class="col-lg-10 col-lg-offset-1 text-center">
         <form class="contact-form row" action="sendMail" method="post" >
            <div class="col-md-4">
               <label></label>
                 <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Name" required>
                    <span id="checkName" class="checkName"></span>
                        </div>
                        <div class="col-md-4">
                            <label></label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
                            <span id="checkEmail" class="checkEmail"></span>
                        </div>
                        <div class="col-md-4">
                            <label></label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone" required>
                            
                            <span id="checkPhoneNumber" class="checkPhoneNumber"></span>
                        </div>
                        <div class="col-md-12">
                            <label></label>
                            <textarea class="form-control" rows="8" placeholder="Your message here.." name="message" required></textarea>
                        </div>
                        <div class="col-md-3 col-md-offset-4">
                            <label></label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" data-toggle="modal" data-target="#alertModal" class="btn btn-info" id="register" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SUBMIT<i class="ion-android-arrow-forward"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button><br>
                        </div>
                    </form>

                </div>
            </div>
        </div>

   <jsp:include page="footer.jsp"></jsp:include>  
   
   <div class="mod" id="myModal11" style="color: black;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background-color: white;">
                <span class="close1">&times;</span>
                <h4 class="modal-title" id="myModalLabel">
                    Login</h4>
            </div>
            <div class="modal-body" style="background-color: white;">
            <h3 style="color: red">Username or Password is incorrect</h3>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                         
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                       
                                <form role="form" class="form-horizontal" method="post" action="loginOwner">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Email" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary btn-sm" style="color: black;">
                                            Submit</button>
                                        <a href="javascript:;">Forgot your password?</a>
                                    </div>
                                </div>
                                </form>
                          
                        </div>
                    
                    </div>
                  
                </div>
            </div>
        </div>
    </div>
</div>
   
   
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> 
    
    <script type="text/javascript">
 function popup()
 {
 var modal = document.getElementById('myModal11');
 modal.style.display = "block";
 var span = document.getElementsByClassName("close1")[0];
 span.onclick = function() {
	    modal.style.display = "none";
	}
 }
 </script>
  <style>
.mod {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* The Close Button */
.close1 {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close1:hover,
.close1:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
.nav-tabs {
    margin-bottom: 15px;
}
</style>
    
    <% 
	String invalid=(String)session.getAttribute("invalid");
        if(invalid!=null)
            {%>
        	 <script type="text/javascript">
        	 popup();
        	 </script>
          <% 
          session.removeAttribute("invalid");
          }  
         else  
         {
         }
        %> 
  </body>
</html>