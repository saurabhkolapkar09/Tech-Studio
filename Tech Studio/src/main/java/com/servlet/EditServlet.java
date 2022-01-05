package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;
import com.helper.ConnectionProvider;
import com.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		
		PrintWriter out = response.getWriter();
		
		//fetch data from user
		
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
		
		Part part = request.getPart("image");
		
		String imageName=part.getSubmittedFileName();
		
	
		//get user from session
		
		HttpSession s = request.getSession();
		
		User user=(User)s.getAttribute("currentUser");
		
		
		
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		user.setProfile(imageName);
		
		if(imageName == "null")
		{
			user.setProfile("default.png");
		}
		
		
		String oldFile=user.getProfile();
		
		
		//update database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = dao.updateUser(user);
		if(ans)
		{
			out.print("updated");
			String path = request.getRealPath("/pics")+ File.separator + user.getProfile();
			
			
			String pathOldFile = request.getRealPath("/pics")+ File.separator + oldFile;
			
			
			
				if(Helper.saveFile(part.getInputStream(), path))
				{
					out.print("updated to db");
					
					

					Message  msg = new Message("Profile updated Successfully...","success","alert-success");
						
					s.setAttribute("msg", msg);
					
				}else {
					//////////

					Message  msg = new Message("Something went wrong...","error","alert-danger");
					
					s.setAttribute("msg", msg);
				}
			
			
			
			
			
		}
		else {
			out.println("not updated");

			Message  msg = new Message("Something went w","error","alert-danger");
			
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
		
		
		
		
		
		
		
		
		
		
		
	}

}
