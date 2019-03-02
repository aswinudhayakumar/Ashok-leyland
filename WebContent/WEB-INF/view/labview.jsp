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
				<li class="nav-item active"><a class="nav-link" href="labourpannel">Add Data <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="labview" style="border-bottom: 2px solid black;">View
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

	List<Stationentry> temp =  (List<Stationentry>) request.getAttribute("list");

%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			    	<br>
    	<h3>View Data</h3>
    	<table>
    		<form action="search" method="post">
    		<input type="hidden" value="labour" name="type">
    		<tr>
    			<td>
    			<label>From</label>
    			</td>
    		    <td>
					<input type="date" name="fdate" class="form-control" placeholder="From date">					
    			</td>
    			<td> &nbsp</td>
    			<td>
    			<label>To</label>
    			</td>
    			<td>
					<input type="date" name="tdate" class="form-control" placeholder="To date">					
    			</td>
    			
    			<td> &nbsp&nbsp&nbsp </td>
    			
    			<td>
    			    	<select class="form-control" name="station" required>
    			    		<option value="" disabled selected>select station</option>
    			    		<option value="Any">Any</option>
    						<option value="1">station 1</option>
    						<option value="1">station 2</option>
    						<option value="1">station 3</option>
    						<option value="1">station 4</option>
    					</select>    					
    			</td>
    			
    			<td>
    				         <select name="shift" id="" class="form-control" required>
                                <option value="" disabled selected>select shift</option>
                                <option value="Any">Any</option>
                                <option value="1">Shift 1</option>
                                <option value="2">shift 2</option>
                            </select>
    			</td>
    			
    			<td>
    				&nbsp&nbsp<button class="btn btn-success">Search</button>
    			</td>
    		</tr>
    		</form>
    	</table> <br>
    	
    	    	<table class="table">
  		<thead class="thead-dark">
    	<tr>
      		<th scope="col">Station</th>
      		<th scope="col">Date</th>
      		<th scope="col">Shift</th>
      		<th scope="col">Success</th>
      		<th scope="col">Fault</th>
      		<th scope="col">Description</th>
      		<th scope="col">Entered by</th>
    	</tr>
  		</thead>
  		<tbody>
  		
  		<%
  			if(temp != null){
  			for(Stationentry i : temp){
  		%>
  		
  		<tr>
  			<td>Station <%= i.getStation() %></td>
  			<td><%= i.getDate() %></td>
  			<td><%= i.getShift() %></td>
  			<td><%= i.getCount() %></td>
  			<td><%= i.getFault() %></td>
  			<td><%= i.getDescription() %></td>
  			<td><%= i.getEnteredby() %></td>
  		</tr>
 
  		<%
  		}
  		}
  			else{
  		%>
  		<h3>No data found</h3> <br>
  		<% }%>
  		</tbody>
  		</table>
    	
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