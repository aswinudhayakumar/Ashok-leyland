<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
        import="com.ashokleyland.model.*, java.util.List, java.util.Date, java.text.SimpleDateFormat" %>
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
        <a class="nav-link" href="" style="border-bottom:2px solid black;">View User <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="changepassword">Change password <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      Hello, Admin &nbsp<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
    </form>
  </div>
</nav>

<div class="container">
	<div class="row">
		<div class="col-sm"></div>
<div class="col col-md-8">

<%
	List<Labour> temp = (List<Labour>) request.getAttribute("user");
	if(temp != null){
	for(Labour i : temp ){
%>

	  	<br>
	  <h3>Update User</h3>
  	<form action="adminlogin">
  <div class="form-group">
    <label for="ceo-email">Email address</label>
    <input type="email" value="<%= i.getEmail() %>" class="form-control" id="ceo-email" aria-describedby="emailHelp" placeholder="Enter ceo email">
  </div>
  <div class="form-group">
    <label for="ceo-pass">Name</label>
    <input type="text" value="<%= i.getName() %>" class="form-control" id="supervisor-pass" placeholder="Enter ceo Name">
  </div>
  <div class="form-group">
    <label for="ceo-age">Age</label>
    <input type="text" value="<%= i.getAge() %>" class="form-control" id="ceo-age" placeholder="Enter Age">
  </div>
  <div class="form-group">
    <label for="ceo-mobile">Mobile number</label>
    <input type="text" value="<%= i.getMobile() %>" class="form-control" id="ceo-mobile" placeholder="Enter Mobile number">
  </div>
  <button type="submit" class="btn btn-primary">Update</button> <a href="#" class="btn btn-danger">Reset password</a>
</form>

</div>
<div class="col-sm"></div>
	</div>
</div>
<%}} %>
</body>
</html>