<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong...</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href = "css/mystyle.css" rel = "stylesheet" type = "text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 67% 92%, 31% 100%, 0 90%, 0 0);

}
</style>
<div class="container-fluid text-center " style="background:#cfd8dc">
	
	<img alt="error page" src="img/error_comp.png" class="img-fluid" >
	<p><%=exception %></p>
	<h3 class="display-4">Sorry ! Something went wrong</h3>
	
<br>
</div>
<div class="text-center">
<br>
<a href="index.jsp" class="btn primary-background  " style="color:white">home</a>
</div>
	


</head>
<body>
	
</body>
</html>