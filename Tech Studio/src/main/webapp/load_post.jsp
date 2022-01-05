<%@page import="java.util.List"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>

<div class= "row">

<%
Thread.sleep(500);
PostDao pd = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));

List<Post> post = null;

if(cid == 0)
{
	post = pd.getAllPost();
}

else{
	post = pd.getPostByCatId(cid);
}

if(post.size()==0)
{
	out.print("<h3 class='display-3 text-center'>no posts </h3>");
	return;
}


for (Post p : post) {
%>

<div class= "col-md-6 mt-2">

<div class = "card">
 <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
<div class= "card-body">
<b><%= p.getpTitle() %></b>
<p> <%= p.getpContent() %>  </p>


<div class="card-footer text-center">
		<a href="#" class="btn btn-outline-primary btn-small"><i class="fa fa-thumbs-o-up"> <span>10</span> </i></a>

	<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-small">read more</a>
	<a href="#" class="btn btn-outline-primary btn-small"><i class="fa fa-commenting-o"> <span>20</span> </i></a>
</div>

</div>

</div>

</div>



<%
}
%>

</div>