<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Category"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.User"%>
<%@page import="com.entities.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao pd = new PostDao(ConnectionProvider.getConnection());
Post p = pd.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%></title>
<!--  CSS -->
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

	<!-- navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"> </span> Tech Studio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="fa fa-meh-o"></span>Home || profile <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> catagories<span class="fa fa-unsorted"></span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming courses</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data structure and
							algorithms</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-vcard"></span>Contact</a></li>


				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span>do Posts</a></li>




			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile-Modal"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>



				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-sign-out"></span>Logout</a></li>

			</ul>
		</div>
	</nav>




	<!-- navbar end -->






	<!-- 	main content of the body -->




	<div class="container">


		<div class="row my-4">

			<div class="col-md-8 offset-md-2">

				<div class="card-header">

					<h4>
						<%=p.getpTitle()%></h4>

				</div>

				<div class="card-body">
						
						<img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
	
					<p><%=p.getpContent()%>
						<br> <br><pre><%=p.getpCode()%>
					
					</pre>
				</div>
				<div class="card-footer">
					<a href="#" class="btn btn-outline-primary btn-small"><i
						class="fa fa-thumbs-o-up"> <span>10</span>
					</i></a> 
					<a href="#" class="btn btn-outline-primary btn-small"><i
						class="fa fa-commenting-o"> <span>20</span>
					</i></a>



				</div>


			</div>

		</div>



	</div>







	<!-- End od body	 -->







	<!-- Modal -->
	<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title " id="exampleModalLongTitle">Tech
						Studio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">


					<div class="container text-center">
						<img alt="" src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px"><br>
						<h5 class="modal-title mt-3" id="exampleModalLongTitle"><%=user.getName()%>
						</h5>


						<!--//details-->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>

									</tr>

								</tbody>
							</table>
						</div>


						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td><textarea rows="3" class="form-control"
												name="user_about"><%=user.getAbout()%>
                                                </textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>









					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- end of profile model -->
















	<!-- add post modal -->


	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide Post
						Details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">




					<form action="AddPostServlet" method="post" id="add-post-form">


						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---select catagory---</option>
								<%
								PostDao post = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = post.getAllCategories();

								for (Category c : list) {
								%>


								<option value=<%=c.getCid()%>><%=c.getName()%>>
								</option>


								<%
								}
								%>

							</select>


						</div>

						<br>





						<div class="form-group">
							<input type="text" name="pTitle" placeholder="enter post title"
								class="form-control">

						</div>

						<div class="from-group">
							<textarea class="form-control" name="pContent"
								placeholder="enter content.." style="height: 200px;"></textarea>

						</div>
						<br>
						<div class="from-group">
							<textarea class="form-control" name="pCode"
								placeholder="enter program (if any).." style="height: 200px;"></textarea>

						</div>

						<div class="form-group">
							<label>select your pic :</label> <br> <input type="file"
								name="pic">

						</div>

						<div class="container text-center">

							<button type="submit" class="btn btn-outline-primary">
								post</button>

						</div>

					</form>


				</div>

			</div>
		</div>
	</div>





	<!-- end of add post model -->
















	<!--javascripts-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script
		scr="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script src="js/myjs.js" type="text/javascript"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide()
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>




	<!--  add post  using  js  -->


	<script>
		$(document)
				.ready(
						function() {

							$("#add-post-form")
									.on(
											"submit",
											function(event) {

												//this code get called when form is submited

												event.preventDefault();
												console.log("Loaded");
												let form = new FormData(this);

												//send form to servlet through ajax

												$
														.ajax({

															url : "AddPostServlet",
															type : 'POST',
															data : form,

															success : function(
																	data,
																	textStatus,
																	jqXHR) {

																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good Job !!",
																			"Post saved Successfully !",
																			"success");
																} else {
																	swal(
																			"error",
																			"Something went wrong ",
																			"error");
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																swal(
																		"error",
																		"Something went wrong ",
																		"error");
															},
															processData : false,
															contentType : false

														})

											});

						});
	</script>





	<!-- end of post js -->







</body>
</html>