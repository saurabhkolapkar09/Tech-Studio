package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import com.dao.UserDao;
import com.entities.Message;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		//fetch username and password
		String userEmail=request.getParameter("name");
		String password=request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		com.entities.User user = dao.getUserByEmailAndPassword(userEmail, password);
		PrintWriter out = response.getWriter();
		if(user==null)
		{
			
			Message  msg = new Message("Invalid username or password","error","alert-danger");
			HttpSession s= request.getSession();	
			s.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		}
		else {
			
			//login success
			//session use
			HttpSession s= request.getSession();
			s.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
			
		}
		
	}

	

}
