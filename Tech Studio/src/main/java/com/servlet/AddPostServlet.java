package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.PostDao;
import com.entities.Post;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter  out = response.getWriter();
		
		int cid =Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		
		Part part = request.getPart("pic");
		
		//out.print(part.getSubmittedFileName());
		
		//getting current user id
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		
		Post p = new Post( pTitle, pContent,  pCode,  part.getSubmittedFileName(),  null,  cid, user.getId());
		
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		if(pd.savePost(p)) {
			
			String path = request.getRealPath("/blog_pics")+ File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.print("done");
			
			
		}else {
			out.print("error");
		}
		
		
	}

}
