<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin pannel</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
	
	setTimeout(function() {
	    $('#add').fadeOut('fast');
	}, 5000); // <-- time in milliseconds
	
	</script>	
 
 	<%
 		String mobile = (String) session.getAttribute("mobile");
 		String age = (String) session.getAttribute("age");
 		String mail = (String) session.getAttribute("mail"); 
 		String add = (String) session.getAttribute("added");
 		if(mobile == null){
 			mobile = "";
 		}
 		if(age == null){
 			age = "";
 		}
 		if(mail == null){
 			mail = "";
 		}
 	%>
 
 <nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
  <a class="navbar-brand" href="">Ashok Leyland</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="" style="border-bottom:2px solid black;">Create User <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="viewuser" >View User <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="changepassword">Change password <span class="sr-only">(current)</span></a>
      </li>
    
    </ul>
    <div class="form-inline my-2 my-lg-0">
      Hello, Admin &nbsp<form action="logout" method="post"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></form>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col-sm">
    </div>
    <div class="col col-md-5">
     <br>
       	<p style="color:green;" id="add">If the User is Added Succesfully, the mail id given is the current password of that user</p>
     <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="labour-tab" data-toggle="tab" href="#labour" role="tab" aria-controls="labour" aria-selected="false">Labour</a>
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
  <div class="tab-pane fade show active" id="labour" role="tabpanel" aria-labelledby="labour-tab">
  
  	<br>
  	<form action="createuser">
  <div class="form-group">
    <label for="labour-email">Email address</label>
    <input type="email" class="form-control" name="email" id="labour-email" aria-describedby="emailHelp" placeholder="Enter Labour email">
    <% if(mail.equals("true")){ %>
    	<small id="emailHelp" class="form-text" style="color:red;">Email Id already exists</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-pass">Name</label>
    <input type="text" class="form-control" name="name" id="labour-name" placeholder="Enter Labour Name">
  </div>
  <div class="form-group">
    <label for="labour-age">Employee Id</label>
    <input type="text" class="form-control" name="age" id="labour-age" placeholder="Enter Employee Id">
    <% if(age.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Age Should be greater than 18</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-mobile">Mobile number</label>
    <input type="text" class="form-control" name="mobile" id="labour-mobile" placeholder="Enter Mobile number">
    <% if(mobile.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Mobile number sholud be 10 digits</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-address">Address</label>
    <input type="text" class="form-control" name="address" id="labour-address" placeholder="Enter Address">
    <input type="hidden" name="category" value="labour">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  <div class="tab-pane fade" id="supervisor" role="tabpanel" aria-labelledby="supervisor-tab">
  
  	<br>
  	<form action="createuser">
  <div class="form-group">
    <label for="supervisor-email">Email address</label>
    <input type="email" class="form-control" name="email"  id="supervisor-email" aria-describedby="emailHelp" placeholder="Enter supervisor email">
    <% if(mail.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Email Id already exists</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="supervisor-pass">Name</label>
    <input type="text" class="form-control" name="name" id="supervisor-pass" placeholder="Enter supervisor Name">
  </div>
  <div class="form-group">
    <label for="supervisor-age">Employee Id</label>
    <input type="text" class="form-control" name="age" id="supervisor-age" placeholder="Enter Employee Id">
    <% if(age.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Age Should be greater than 18</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="supervisor-mobile">Mobile number</label>
    <input type="text" class="form-control" name="mobile" id="supervisor-mobile" placeholder="Enter Mobile number">
    <% if(mobile.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Mobile number sholud be 10 digits</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-address">Address</label>
    <input type="text" class="form-control" name="address" id="supervisor-address" placeholder="Enter Address">
    <input type="hidden" name="category" value="supervisor">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  <div class="tab-pane fade" id="manager" role="tabpanel" aria-labelledby="manager-tab">
  
  	<br>
  	<form action="createuser">
  <div class="form-group">
    <label for="manager-email">Email address</label>
    <input type="email" class="form-control" name="email" id="manager-email" aria-describedby="emailHelp" placeholder="Enter manager email">
    <% if(mail.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Email Id already exists</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="manager-pass">Name</label>
    <input type="text" class="form-control" name="name" id="manager-pass" placeholder="Enter manager Name">
  </div>
  <div class="form-group">
    <label for="manager-age">Employee Id</label>
    <input type="text" class="form-control" name="age" id="manager-age" placeholder="Enter Employee Id">
    <% if(age.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Age Should be greater than 18</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="manager-mobile">Mobile number</label>
    <input type="text" class="form-control" name="mobile" id="manager-mobile" placeholder="Enter Mobile number">
    <% if(mobile.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Mobile number sholud be 10 digits</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-address">Address</label>
    <input type="text" class="form-control" name="address" id="manager-address" placeholder="Enter Address">
    <input type="hidden" name="category" value="manager">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
  <div class="tab-pane fade" id="ceo" role="tabpanel" aria-labelledby="ceo-tab">
  
  	<br>
  	<form action="createuser">
  <div class="form-group">
    <label for="ceo-email">Email address</label>
    <input type="email" class="form-control" name="email" id="ceo-email" aria-describedby="emailHelp" placeholder="Enter ceo email">
    <% if(mail.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Email Id already exists</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="ceo-pass">Name</label>
    <input type="text" class="form-control" name="name" id="supervisor-pass" placeholder="Enter ceo Name">
  </div>
  <div class="form-group">
    <label for="ceo-age">Id</label>
    <input type="text" class="form-control" name="age" id="ceo-age" placeholder="Enter Id">
    <% if(age.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Age Should be greater than 18</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="ceo-mobile">Mobile number</label>
    <input type="text" class="form-control" name="mobile" id="ceo-mobile" placeholder="Enter Mobile number">
    <% if(mobile.equals("true")){ %>
    <small id="emailHelp" class="form-text" style="color:red;">Mobile number sholud be 10 digits</small>
    <% } %>
  </div>
  <div class="form-group">
    <label for="labour-address">Address</label>
    <input type="text" class="form-control" name="address" id="labour-address" placeholder="Enter Address">
    <input type="hidden" name="category" value="manager">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  
  </div>
</div>
      
    </div>
    <div class="col-sm">
    </div>
  </div>
</div>
	
	
<div class="footer">
	<center>
	<h5>Product by</h5>
	<img src="${pageContext.request.contextPath}/resources/images/karpagam.jpg" height="50px" width="200px">
	
	</center>
</div>	
</body>
</html>