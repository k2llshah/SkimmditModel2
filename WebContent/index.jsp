<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*"  %>
     <%@page import="com.skimmdit.bin.*"  %>
<%

HttpSession mysession=request.getSession();
if(mysession.getAttribute("username")!=null)
{
	response.sendRedirect("Profile.jsp");	
}

%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Welcome to Skimmdit</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
 
  
  
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
    body { font-size: 62.5%; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
  </style>
  <script>
  $(function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function addUser() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name, "username", 3, 16 );
      valid = valid && checkLength( email, "email", 6, 80 );
      valid = valid && checkLength( password, "password", 5, 16 );
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
      valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
      if ( valid ) {
    	  $("#Register").submit();
       
      
        //window.location.replace("http://www.w3schools.com");
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Create an account": addUser,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
     
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
    	
    });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  });
  </script>
</head>
<body>
 
<div id="dialog-form" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
  <form action="Register" id="Register" method="post">
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" placeholder="User Name" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" placeholder="Email" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" placeholder="xxxxxxx" required class="text ui-widget-content ui-corner-all">
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
 

<!--  <button id="create-user">Create new user</button>-->
<div style="width:100%;height:15px;border-bottom:1px solid black;background-color:#f0f0f0;"></div>
<div style="width:100%;height:50px;border-bottom:1px solid black;background-color:#8FBBE6;">
<div id="logo" style="padding:15px">
<span style="color:white;font-size:24px;">Skimmdit</span>
</div>
</div>
<form action="Login" method="post">
<div style="width:100%">
<div style="float:right;padding:5px;border:1px solid black">

<div style="float:left;margin-right:10px">
<span style="font-size:18px">User Name:</span><input type="text" name="username" required width="20px"/>
</div>
<div style="float:left;margin-bottom:10px">
<span style="font-size:18px">Password:</span><input type="password" name="password" required width="20px"/>
</div> 
<div style="clear:left;float:right;border:1px solid black">
<input type="submit" value="login" />
</div>
</div>
</div> 
 </form>
 <a id='create-user'>register your self</a>

  <p>&nbsp</p>
   <p>&nbsp</p>
<div id="div1">
</div>
</body>
</html>
<%
if(request.getAttribute("notifynotregister")!=null)
{
	out.println("<span style='color:red'>Please Register Yourself First</span> <a id='create-user'>clickhere</a>");
}
if(request.getAttribute("notifynewuser")!=null)
{
	out.println("<span style='color:green'>Congratulation Please Login to Use Skimddit</span>");
}
if(request.getAttribute("notifyexistinguser")!=null)
{
	out.println("<span style='color:red'>Please select different username</span>");
}
if(request.getAttribute("notifywronguser")!=null)
{
	out.println("<span style='color:red'>Username and Password did not match.Please try again</span>");
}
%>


<script>
$( document ).ready(function() {
$.ajax({

url: "loginAjax.jsp", 

success: function(result){

        $("#div1").html(result);

    }});

});
</script>