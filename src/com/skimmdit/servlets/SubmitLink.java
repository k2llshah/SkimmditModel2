package com.skimmdit.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import com.skimmdit.bin.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skimmdit.bin.RegisterBean;

/**
 * Servlet implementation class SubmitLink
 */

public class SubmitLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SubmitLinkBean links; 

	public static HashMap mymap;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init()
	{
		
		mymap=new HashMap();

	}
	
	
    public SubmitLink() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		links=new SubmitLinkBean();	
		HttpSession usersession=request.getSession();
		String username=(String)usersession.getAttribute("username");
		links.setTitle(request.getParameter("title"));
		links.setUrl(request.getParameter("link"));
		links.setUsername(username);
		links.setVoteBy(username);
		UUID linkid=UUID.randomUUID();
		links.setLinkId(linkid);
		mymap.put(linkid,links);
		request.getServletContext().setAttribute("map",mymap);
		//RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
		response.sendRedirect("Profile.jsp");
		
}
	
	
	}


