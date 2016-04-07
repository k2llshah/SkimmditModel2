<%@page import="com.skimmdit.servlets.SubmitLink"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"  %>
     <%@page import="com.skimmdit.bin.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="float:right">
<h1>Welcome 
<%
String user=null;
HttpSession mysession=request.getSession();
if(mysession.getAttribute("username")!=null)
{

user=(String)mysession.getAttribute("username");

out.println(user);
	
}
else
{
	response.sendRedirect("index.jsp");
}

%>
 To Your Profile Page</h1>
<%


%>
<a href="SubmitLink.jsp">Submit Link</a>

<a href="Logout">Logout</a>

</div>

<!--  <button onClick=f1('"+pair+"','"+user+"') ><img src='arrow-top-3x.png' /></button>
<a href='LikeLink?linkid="+pair+"&username="+user+"'  >like</a> 
<a href='DisLikeLink?linkid="+pair+"&username="+user+"'>Dislike</a>-->
<div id="div1">
</div>
</body>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$( document ).ready(function() {
$.ajax({

url: "loginAjax.jsp", 

success: function(result){

        $("#div1").html(result);

    }});

});
</script>

</html>