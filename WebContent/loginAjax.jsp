<%@page import="com.skimmdit.bin.SortedMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*"  %>
     <%@page import="com.skimmdit.bin.*"  %>
<%

HttpSession mysession=request.getSession();
String user="";
if(mysession.getAttribute("username")!=null)
{

user=(String)mysession.getAttribute("username");
	
}
String opt="";
if(request.getServletContext().getAttribute("map")!=null)
{
	
	opt+="<table width='70%' border='1px' cellpadding='3' cellspacing='3'style='background-color:#0CF;border-collapse:collapse;border:1px solid #000;color:#000000;width:'100%'><tr><td>Like</td><td>Dislike</td><td>Title</td><td>Link</td><td>No of Votes</td></tr>";
	
	HashMap sorted_map=null;
	Iterator it;
	HashMap mymap=(HashMap)request.getServletContext().getAttribute("map");
	SortedMap sm=new SortedMap();
	TreeMap sortedmap=sm.getSortedmap(mymap);
	Set keys = sortedmap.keySet();
   	 	for (Iterator i = keys.iterator(); i.hasNext();) {
	     String key1 =  i.next().toString();
	  		UUID uid = UUID.fromString(key1); 
				   SubmitLinkBean dao=(SubmitLinkBean)mymap.get(uid);
				   opt+="<tr><td><center><a href='LikeLink?linkid="+key1+"&username="+user+"'  ><img src='arrow-top-3x.png' /></a></center><td><center><a href='DisLikeLink?linkid="+key1+"&username="+user+"'><img src='arrow-bottom-3x.png' /></a></center></td><td><center>"+dao.getTitle()+"</center></td><td><center><a href='"+dao.getUrl()+"' target='blank'>"+dao.getUrl()+"</a></center></td><td><center>"+dao.getVotecounter()+"</center></td></tr>";
				     // avoids a ConcurrentModificationException
				} 	
   	 opt+="</table>";
out.print(opt);
}
%>
