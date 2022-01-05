<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register page</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href = "css/mystyle.css" rel = "stylesheet" type = "text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 67% 92%, 31% 100%, 0 90%, 0 0);

}
</style>



</head>
<body>
<!-- Navbar -->

<%@include file = "Normal_navbar.jsp" %>

<main class = "d-flex align-items-center primary-background banner-background " style="padding-bottom:80px">

	<div class = "container">
		
		<div class = "col-md-6 offset-md-3">
		
		
			<div class = "card">
			
				<div class ="card-header text-center primary-background text-white" >
					<h4><span class = "fa fa-user-plus"></span> <br>Register here</h4>
				
				</div>
				<div class = "card-body">
					
					<form id="reg-form" action="RegisterServlet" method="post">  						
  						<div class="form-group">
 						   <label for="user_name">User Name</label>
						   <input type="text" class="form-control" name = "user_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						   <small id="user_name" class="form-text text-muted"></small>
 						</div>
  						
  						
  						
  						<div class="form-group">
 						   <label for="exampleInputEmail1">Email address</label>
						   <input type="email" class="form-control" name="user_email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						   <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
 						</div>
  	
  	
  						<div class="form-group">
   							 <label for="exampleInputPassword1">Password</label>
  							  <input type="password" class="form-control" name="user_password" id="exampleInputPassword1" placeholder="Password">
 						 </div>
 
 
 						<div class="form-group">
   							 <label for="gender">Select Gender</label><br>
  							  <input type="radio"  id="genger" name = "user_gender" value="male">male
  							  <input type="radio"  id="genger" name = "user_gender" value="female">female
 						 </div>
 						 
 						 
 						 <div class = "form-group">
 						 	<textarea name="user_about" rows="5"  class="form-control" placeholder="Enter something about you"></textarea>
 						 
 						 </div>
 
 						 <div class="form-check">
  							  <input type="checkbox" name = "user_check" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">terms and comditions</label>
  						</div>
  						
  						<div id="load" style=" display:none " class="container text-center">
  						<span class="fa fa-refresh fa-spin fa-3x"></span>
  						<h4>please wait...</h4>
  						</div><br>
  						
 						<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
					</form>
				
				
				</div>
				
		
		
		
		
		</div>
	
	</div>






</main>

<!-- JAVASCRIPT -->

		<script
  			src="https://code.jquery.com/jquery-3.6.0.min.js"
  			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  			crossorigin="anonymous"></script>
  			
  			
  			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  			

		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
	//this is ajax for giving output on that page only
	$(document).ready(function(){
		console.log("loaded...");
		
		//we fetch form through id using jQuery
		
		$('#reg-form').on('submit',function(event){
			
			//servlet page pr jane se rokne ke liye
			
			event.preventDefault();
			
			let form = new FormData(this);
			
			$("#submit-btn").hide();
			$("#load").show();
			
			//send data to register servlet -> use ajax
			
			$.ajax({
				url:"RegisterServlet",
				type:"POST",
				data: form,
				
				
				success: function(data,textStatus,jqXHR)
				{
					console.log(data);
					$("#submit-btn").show();
					$("#load").hide();
					

					if(data.trim() ==="done")
					{
						swal("Registered successfully")
						.then((value) => {
						  window.location="login_page.jsp"
						});
					}
					else{
							
							swal(data)
							
					}
					
					
				},
				error: function (jqXHR,textStatus,errorThrown)
				{
					
					$("#submit-btn").show();
					$("#load").hide();
					
					swal("Something went wrong...")
					
					
				},
				
				processData: false,
				contentType: false
				
			})
			
			
		
		
		});
		
		
		
		
	});

</script>


</body>
</html>