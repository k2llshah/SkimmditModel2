package com.skimmdit.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skimmdit.bin.SubmitLinkBean;
import com.skimmdit.bin.ValueComparator;

/**
 * Servlet implementation class DisLikeLink
 */

public class DisLikeLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisLikeLink() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println(request.getParameter("linkid"));
		HttpSession session=(HttpSession)request.getSession();
		if(session.getAttribute("username")!=null)
		{			
			PrintWriter out=response.getWriter();
			
			HashMap likemap=(HashMap)request.getServletContext().getAttribute("map");
			UUID id=UUID.fromString(request.getParameter("linkid"));
			SubmitLinkBean objBean=(SubmitLinkBean)likemap.get(id);
	
			if(objBean.getStringList().contains(request.getParameter("username")))
			{
				if(objBean.getStringList().size() - objBean.getUnlikelist().size() > 1)
				{
					objBean.getStringList().remove(request.getParameter("username"));
					objBean.getUnlikelist().add(request.getParameter("username"));
				}
				else if(objBean.getStringList().size() - objBean.getUnlikelist().size() == 1)
				{
					objBean.getUnlikelist().add(request.getParameter("username"));
				}			
				else
				{
					objBean.getStringList().remove(request.getParameter("username"));
					objBean.getUnlikelist().remove(request.getParameter("username"));
					objBean.getStringList().add(request.getParameter("username"));
				}
			}
			else if(objBean.getUnlikelist().contains(request.getParameter("username")))
			{
				objBean.getUnlikelist().remove(request.getParameter("username"));
			}
			else
			{
				if(objBean.getStringList().size() > 0)
				{
					objBean.getUnlikelist().add(request.getParameter("username"));
				}
			}	
			response.sendRedirect("Profile.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
        
    /* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
