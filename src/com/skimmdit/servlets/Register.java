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
 * Servlet implementation class Register
 */

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	RegisterBean user;
	
	public HashMap mymap;
	public void init()
	{
		mymap=new HashMap();
	}
	
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
public boolean checkexistance(RegisterBean user)
{

		if(mymap.containsKey(user.getUsername()))
		{
			return true;
		}
		
		return false;
}
					public boolean createUser(RegisterBean user)
					{
						
						mymap.put(user.getUsername(),user);		
						return true;
					}
					
					protected void setUserSession(HttpServletRequest request)
					{
						HttpSession usersession=request.getSession();
						usersession.setAttribute("username",user.getUsername());
					}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user=new RegisterBean();
		user.setUsername(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));

		
		
		if(checkexistance(user))
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			request.setAttribute("notifyexistinguser", "Please Select different username to register");
			rd.forward(request, response);
		}
		else{
			
			if(createUser(user))
			{
				
				setUserSession(request);
				request.getServletContext().setAttribute("users",mymap);
				RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
				rd.forward(request, response);	
				
			}
		}
		
	}

}
