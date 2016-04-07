package com.skimmdit.servlets;
import com.skimmdit.bin.*;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	String sUserName;
	String sPassword;
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	public void destroy()
	{
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getServletContext().getAttribute("users")!=null)
		{		
			
			System.out.println("firstif");
			HashMap users=(HashMap)request.getServletContext().getAttribute("users");
			RegisterBean user=(RegisterBean)users.get(request.getParameter("username"));
			
			if(user!=null)
			{
				
				if(authenticateUser(request,user))
					{
					System.out.println("secondif");
						setUserSession(request);
						RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
						rd.forward(request, response);
						//go to profile page
					}
					else
					{
						System.out.println("secondelse");	
						RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
						request.setAttribute("notifywronguser", "Create a new User");
						rd.forward(request, response);	
						//go to error page	
					}
				
			}
			else
			{
				System.out.println("nesteelse");	
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("notifynotregister", "Create a new User");
				rd.forward(request, response);		
			}
					}
		else
		{
			System.out.println("main else");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			request.setAttribute("notifynotregister", "Create a new User");
			rd.forward(request, response);		
		}
	}
	protected boolean authenticateUser(HttpServletRequest request,RegisterBean user)
	{
		sUserName=request.getParameter("username");
		sPassword=request.getParameter("password");
		
		if(((String)user.getUsername()).equals(sUserName) && ((String)user.getPassword()).equals(sPassword))
		{
		return true;
		}
		else
		{
		return false;
		}
	}
	
	protected void setUserSession(HttpServletRequest request)
	{			
		HttpSession usersession=request.getSession();
		usersession.setAttribute("username",request.getParameter("username"));
	}
	
	
}
