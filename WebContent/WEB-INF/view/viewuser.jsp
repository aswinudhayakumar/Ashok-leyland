<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.ashokleyland.model.*, java.util.List, java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User</title>

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
    <div class="form-inline my-2 my-lg-0">
      Hello, Admin &nbsp<form action="logout" method="post"><button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button></form>
    </div>
  </div>
</nav>

<%
	List<Labour> lab = (List<Labour>) request.getAttribute("lablist");
	List<Supervisor> sup = (List<Supervisor>) request.getAttribute("suplist");
	List<Manager> man = (List<Manager>) request.getAttribute("manlist");
	List<Ceo> ceo = (List<Ceo>) request.getAttribute("ceolist");
%>

<div class="container">
  <div class="row">
  	<div class="col-sm"></div>
    <div class="col col-md-10">
    	<br>
    	<h3>View Users</h3><br>
    	<table>
    		<tr>
    			<td>
    			    	<form action="selectuser">
    			    	<select class="form-control" name="category" id="category">
    						<option>labour</option>
    						<option>supervisor</option>
    						<option>manager</option>
    						<option>ceo</option>
    					</select>    					
    			</td>
    			<td>
    				&nbsp&nbsp<button class="btn btn-success">Search</button>
    				</form>
    			</td>
    		</tr>
    	</table> <br>

    	<table class="table">
  		<thead class="thead-dark">
    	<tr>
      		<th scope="col">Id</th>
      		<th scope="col">Name</th>
      		<th scope="col">Email</th>
      		<th scope="col">Reset</th>
    	</tr>
  		</thead>
  		<tbody>
  		
  		  		<%
  			String reset = (String) request.getAttribute("reset");
  			if(reset == null){
  				reset = "";
  			}
  			if(reset.equals("true")){
  		%>
  		<p>Password Reset Successful</p>
  		
  		<%}
  			if(lab != null){
  				if( lab.size() > 0){
  			int a = 1;
  		%>
  		<h4>Listing all the labours</h4>
  		<% 
  			for(Labour i:lab){
  		%>
  		<tr>
  			<td><%= a %></td>
  			<td><%= i.getName() %></td>
  			<td><%= i.getEmail() %></td>
  			<td>
  			<%String ty = request.getAttribute("type").toString(); %>
  			<form action="reset">
  				<input type="hidden" name="uid" value="<%= i.getId() %>">
  				<input type="hidden" name="utype" value="<%=ty  %>">
  				<button type="submit" class="btn btn-outline-danger btn-sm">Reset Password</button>
  			</form>
  			</td>
  		</tr>
  		<%
  			a = a + 1;
  			}
  			}
  				else{
  					%> <h4>Np Labours Found</h4> <% 
  				}
  			}
  			if(sup != null){
  				if( sup.size() > 0){
  	  		int a = 1;
  	  	%>
  	  		<h4>Listing all the Supervisors</h4>
  	  	<% 
  	  		for(Supervisor i:sup){
  		%>
  		
  		 <tr>
  			<td><%= a %></td>
  			<td><%= i.getName() %></td>
  			<td><%= i.getEmail() %></td>
  			<td>
  			<form action="updateuser">
  				<button class="btn btn-outline-success btn-sm">Update</button>
  			</form>
  			</td>
  			<td>
  			<form>
  				<button class="btn btn-outline-danger btn-sm">Fire</button>
  			</form>
  			</td>
  		</tr>
  		
  		<% 
			a = a + 1;
			}
			}
				else{
  					%> <h4>No Supervisors Found</h4> <% 
  				}
  			}
  			if(man != null){
  				if( man.size() > 0){
  	  	  	int a = 1;
  	  	%>
  	  		<h4>Listing all the Managers</h4>
  	  	<% 
  	  	  	for(Manager i:man){
  		%>
  		
  		<tr>
  			<td><%= a %></td>
  			<td><%= i.getName() %></td>
  			<td><%= i.getEmail() %></td>
  			<td>
  			<form action="updateuser">
  				<button class="btn btn-outline-success btn-sm">Update</button>
  			</form>
  			</td>
  			<td>
  			<form>
  				<button class="btn btn-outline-danger btn-sm">Fire</button>
  			</form>
  			</td>
  		</tr>
  		
  		<% 
			a = a + 1;
			}
			}
				else{
  					%> <h4>No Managers Found</h4> <% 
  				}
  			}
  			if(ceo != null){
  				if( ceo.size() > 0){
  	  	  	int a = 1;
  	  	%>
  	  		<h4>Listing all the CEOs</h4>
  	  	<% 
  	  	   	for(Ceo i:ceo){
  		%>
  		
  		<tr>
  			<td><%= a %></td>
  			<td><%= i.getName() %></td>
  			<td><%= i.getEmail() %></td>
  			<td>
  			<form action="updateuser">
  				<button class="btn btn-outline-success btn-sm">Update</button>
  			</form>
  			</td>
  			<td>
  			<form>
  				<button class="btn btn-outline-danger btn-sm">Fire</button>
  			</form>
  			</td>
  		</tr>
  		
  		<%
		a = a + 1;
		}
		}
				else{
  					%> <h4>No CEOs Found</h4> <% 
  				}
  			}
  		%>
  		</tbody>
	</table>  
    </div>
    <div class="col-sm"></div>
    

<div class="footer">
	<center>
	<br><br> 
	<h5>Product by</h5>
	<img src="${pageContext.request.contextPath}/resources/images/karpagam.jpg" height="50px" width="200px">
	
	</center>
</div>
</body>
</html>