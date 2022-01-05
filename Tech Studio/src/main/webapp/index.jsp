<%@page import="com.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tech Studio Home Page  </title>


<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 67% 92%, 31% 100%, 0 90%, 0 0
		);
}
</style>
</head>
<body>
	<!-- NAV BAr -->
	<%@include file="Normal_navbar.jsp"%>


	<!-- connectionm  -->
	<%-- 
<%
	Connection con = ConnectionProvider.getConnection();

%>
<h1><%=con %></h1> --%>

	<!--Container  -->

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container ">
				<h3 class="display-3">Welcome to TechStudio</h3>
				<p>A programming language is a formal language comprising a set
					of strings that produce various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start!for free
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span
					class="fa fa-user-circle-o fa-spin"></span> login</a>
			</div>
		</div>


	</div>


	<!--cards  -->

	<div class="container">

		<div class="row">

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>



		</div>


		<br>



		<div class="row mb-2">

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">All about java programming from core java
							,object oriented programming in java</p>
						<a href="#" class="btn btn-primary primary-background text-white">read
							more</a>
					</div>
				</div>

			</div>



		</div>
	</div>



	<%--  <%
 Connection con = com.helper.ConnectionProvider.getConnection();
%>
<h1><%= con %></h1> --%>



	<!-- JAVASCRIPT -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<!-- 		<script src="js/myjs.js" type="text/javascript"></script> -->
</body>
</html>