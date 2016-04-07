<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function validate() {
		var i = 0;
		
		if (document.submitForm.title.value == 0) {
			document.getElementById("title1").style.display = '';
			i++;
		} else {
			document.getElementById("title1").style.display = 'none';
		}
		
		if (document.submitForm.link.value == 0) {
			document.getElementById("link1").style.display = '';
			i++;
		} else {
			
				document.getElementById("link1").style.display = 'none';
			}
		if (i >= 1) {
			return false;
		} else {
			return true;
		}
}
		</script>
<title>Insert title here</title>
</head>
<body>

<%

HttpSession mysession=request.getSession();
if(mysession.getAttribute("username")!=null)
{
String user=(String)mysession.getAttribute("username");
}
else
{
	response.sendRedirect("index.jsp");
}

%>
</body>
<form name="submitForm" action="SubmitLink" method="post" onsubmit="return(validate());">
<table>
<tr><td>
Title:<input type="text" name="title" />
</td>
<td id="title1" style="color: red; display: none;"><center>Please enter a proper title!!!</center></td>
</tr>
<tr><td>
Link:<textarea rows="6" cols="50" name="link" id="link"> 
</textarea>
</td>
<td  name="link1" id="link1" style="color: red; display: none;"><center>Please enter a proper Link!!!</center></td></tr>
</table>
<input type="submit" />
</form> 
</html>