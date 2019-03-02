<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.ashokleyland.model.*, java.util.List, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh5U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

 <nav class="navbar navbar-expand-lg navbar-light" style="background:#74b9ff">
		<a class="navbar-brand" href="adminpannel">Ashok Leyland</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href=""
					style="border-bottom: 2px solid black;">Add Data <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="labview">View
						Data <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="changepassword">Change
						password <span class="sr-only">(current)</span>
				</a></li>

			</ul>
			<div class="form-inline my-2 my-lg-0">
				Hello,
				<%=session.getAttribute("lab-name")%>
				&nbsp
				<form action="logout" method="post">
					<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
				</form>
			</div>
		</div>
	</nav>

	<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		String fdate = formatter.format(date);
	%>
<br>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-5" style="background:#dfe6e9;padding:24px;padding-top:0px;border-radius:5px;">
				<br>
				<form action="addstationdetails">

					<h5>Date of Data Entry</h5>
					<input type="hidden" value="<%=fdate%>" name="date">
					<%=fdate%><br><br>

					<h5>Select the Station to Enter data</h5> <select
						class="form-control" name="station" id="station"
						style="width: 50%;">
						<option value="" disabled selected>Select Station</option>
						<option value="1">Station 1</option>
						<option value="2">Station 2</option>
						<option value="3">Station 3</option>
						<option value="4">Station 4</option>
					</select> <br>
					
					<h5>Select Shift</h5>
					<select
						class="form-control" name="shift" id="shift"
						style="width: 50%;">
						<option value="" disabled selected>Select Shift</option>
						<option value="1">Shift 1</option>
						<option value="2">Shift 2</option>
					</select> <br>
					
					<h5>Enter the count from this shift</h5>
					<input name="count" type="number" class="form-control" style="width: 50%;" placeholder="count"> <br>
					
					<h5>Fault if any</h5>
					<input name="fault" type="number" class="form-control" style="width: 50%;" placeholder="count"> <br>
					
					<input type="hidden" value="<%=fdate%>" name="date">
					
					<h5>Description</h5>
					<textarea name="desc" class="form-control" placeholder="Description about this shift"></textarea><br>
					
					<p>(Check before you enter details once entered wrong cannot be updated)</p>
					<p>These details are entered by <%= session.getAttribute("lab-name") %></p>
					
					<button class="btn btn-primary btn-lg btn-block">Save Entry</button>
					
				</form>
			</div>
			<div class="col-md-4">
				<br>
				
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