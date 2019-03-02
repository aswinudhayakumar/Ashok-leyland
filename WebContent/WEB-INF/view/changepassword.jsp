<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%
	String change = (String) request.getAttribute("change");
	String type = (String) session.getAttribute("type");
	if(type != null){
		if(type.equals("admin")){
%>

<nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
  <a class="navbar-brand" href="adminpannel">Ashok Leyland</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="adminpannel">Create User <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="viewuser">View User <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="changepassword" style="border-bottom:2px solid black;">Change password <span class="sr-only">(current)</span></a>
      </li>
    
    </ul>
    <div class="form-inline my-2 my-lg-0">
      Hello, Admin &nbsp<form action="logout" method="post"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></form>
    </div>
  </div>
</nav>

<%
		}
		else if(type.equals("labour")){
%>
<nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
  <a class="navbar-brand" href="adminpannel">Ashok Leyland</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="labourpannel">Add user <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="labview">View Data <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="changepassword" style="border-bottom:2px solid black;">Change password <span class="sr-only">(current)</span></a>
      </li>
    
    </ul>
    <div class="form-inline my-2 my-lg-0">
      Hello, <%= session.getAttribute("email") %> &nbsp<form action="logout" method="post"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></form>
    </div>
  </div>
</nav>
<%
		}
		else if(type.equals("supervisor")){
%>

	<nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
  <a class="navbar-brand" href="suppannel">Ashok Leyland</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="suppannel">View Data <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="changepassword" style="border-bottom:2px solid black;">Change password <span class="sr-only">(current)</span></a>
      </li>
    
    </ul>
    <div class="form-inline my-2 my-lg-0">
      Hello, <%= session.getAttribute("email") %> &nbsp<form action="logout" method="post"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></form>
    </div>
  </div>
</nav>
	
<% 		
		}
	}
%>

<div class="container">
	<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm">
	<br><br><br>
  	<form action="cpassword" method="post">
  <div class="form-group">
    <label for="ceo-email">Current Password</label>
    <input type="password" name="cpass" class="form-control" id="ceo-email" aria-describedby="emailHelp" placeholder="Enter Current Password">
    <% if(change != null){
    	if(change.equals("false")){
    %>
    <small id="emailHelp" class="form-text" style="color:red;">Current password is incorrect </small>
    <%}} %>
  </div>
  <div class="form-group">
    <label for="ceo-pass">New Password</label>
    <input type="password" required name="npass" class="form-control" id="supervisor-pass" placeholder="Enter New Password">
  </div>
  <button type="submit" class="btn btn-primary">Change password</button>
</form>
		
		</div>
		<div class="col-sm"></div>
	</div>
</div>

<br><br><br><br><br><br>
<div class="footer">
	<center>
	<h5>Product by</h5>
	<img src="${pageContext.request.contextPath}/resources/images/karpagam.jpg" height="50px" width="200px">
	
	</center>
</div>
</body>
</html>