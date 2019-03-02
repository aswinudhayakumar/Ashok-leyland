<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
		<style>
		body{
		}
	</style>
	
</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
	
	setTimeout(function() {
	    $('#add').fadeOut('fast');
	}, 1000); // <-- time in milliseconds
	
	</script>
 
 <nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
  <a class="navbar-brand" href="">Ashok leyland</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="labourpannel" style="border-bottom: 2px solid black;">Login<span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
</nav>


<%
	String adminerror = (String) request.getAttribute("error");
	String labourerror = (String) request.getAttribute("laborerror");
	String supervisorerror = (String) request.getAttribute("supervisorerror");
	String managererror = (String) request.getAttribute("managererror");
	String ceoerror = (String) request.getAttribute("ceoerror");
	String log = (String) request.getAttribute("log");
	if(adminerror == null){
		adminerror = "";
	}
	if(labourerror == null){
		labourerror = "";
	}
	if(supervisorerror == null){
		supervisorerror = "";
	}
	if(managererror == null){
		managererror = "";
	}
	if(ceoerror == null){
		ceoerror = "";
	}
	if(log == null){
		log = "";
	}
%>
<%= supervisorerror %>
<div class="container-fluid">
	<br><br>
  <div class="row">
    <div class="col-md-8">
    	
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/images/1.jpg" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/2.png" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/3.png" alt="New York" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/4.jpg" alt="New York" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
    <div class="col col-md-4">
    	<img src="${pageContext.request.contextPath}/resources/images/as.png" height="150px" width="300px" style="margin-left:60px;">
 
     <%
     	String change = (String) request.getAttribute("change");
     	if(change != null){
     %>
     <p> password changed successfully now login using new password </p>
     <%} %>
     <% if(managererror.equals("true") || adminerror.equals("true") || labourerror.equals("true") || supervisorerror.equals("true") || managererror.equals("true") || ceoerror.equals("true") && !log.equals("true")){ %>
         <p style="color:red;" id="add">Username or password is incorrect</p><%=adminerror %>
  	 <% } %>
     <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="admin-tab" data-toggle="tab" href="#admin" role="tab" aria-controls="admin" aria-selected="true">Admin</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="labour-tab" data-toggle="tab" href="#labour" role="tab" aria-controls="labour" aria-selected="false">Labour</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="supervisor-tab" data-toggle="tab" href="#supervisor" role="tab" aria-controls="supervisor" aria-selected="false">Supervisor</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="manager-tab" data-toggle="tab" href="#manager" role="tab" aria-controls="manager" aria-selected="false">Manager</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="ceo-tab" data-toggle="tab" href="#ceo" role="tab" aria-controls="ceo" aria-selected="false">CEO</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="admin" role="tabpanel" aria-labelledby="admin-tab">
  	
  	<br>
  	<form action="adminlogin" method="post">
  <div class="form-group">
    <label for="admin-email">Email address</label>
    <input type="email" class="form-control" id="admin-email" name="admin-email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="admin-pass">Password</label>
    <input type="password" class="form-control" id="admin-pass" name="admin-pass" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  	
  </div>
  <div class="tab-pane fade" id="labour" role="tabpanel" aria-labelledby="labour-tab">
  
    <br>
  	<form action="labourlogin" method="post">
  <div class="form-group">
    <label for="labour-email">Email address</label>
    <input type="email" class="form-control" id="labour-email" name="labour-email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="labour-pass">Password</label>
    <input type="password" class="form-control" id="labour-pass" name="labour-pass" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  
  <div class="tab-pane fade" id="supervisor" role="tabpanel" aria-labelledby="supervisor-tab">
  
    	<br>
  	<form action="supervisorlogin" method="post">
  <div class="form-group">
    <label for="supervisor-email">Email address</label>
    <input type="email" class="form-control" id="admin-email" name="supervisor-email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="supervisor-pass">Password</label>
    <input type="password" class="form-control" id="supervisor-pass" name="supervisor-pass" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  
  <div class="tab-pane fade" id="manager" role="tabpanel" aria-labelledby="manager-tab">
  
   	<br>
  	<form action="managerlogin" method="post">
  <div class="form-group">
    <label for="manager-email">Email address</label>
    <input type="email" class="form-control" id="manager-email" name="manager-email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="manager-pass">Password</label>
    <input type="password" class="form-control" id="manager-pass" name="manager-pass" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  <div class="tab-pane fade" id="ceo" role="tabpanel" aria-labelledby="ceo-tab">
  
    <br>
  	<form action="ceologin" method="post">
  <div class="form-group">
    <label for="ceo-email">Email address</label>
    <input type="email" class="form-control" id="ceo-email" name="ceo-email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="ceo-pass">Password</label>
    <input type="password" class="form-control" id="ceo-pass" name="ceo-pass" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
</div>
      
    </div>

  </div>
</div>

<br>
<center> <h5>Developed by the students of</h5> <img src = "${pageContext.request.contextPath}/resources/images/karpagam.jpg" height="60px" width="170px"> </center>
</body>
</html>