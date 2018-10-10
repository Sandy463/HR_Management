 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 
 <html>
 <head>
 <style type="text/css">
.tab {
margin-left: 0.5em
}
</style>
 </head>
 <body>
 <a class="tab" style="float:right" href="index.jsp">Logout</a> 
<a style="float:right" href="changepassword.jsp">Change Password</a><br>
 <%@ include file="css.jsp" %>
 <%@ include file="header.jsp" %>
 <center>
<form action="changepassword_process.jsp" method="post">
<table>
<tr><td>Current Password</td><td><input type="password" name="current" ></td></tr>
<tr><td>New Password</td><td><input type="password" name="new"></td></tr>
<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr><tr></tr>
<tr><td></td><td><input type="submit" value="Change Password"></td></tr>
</table>
</form>
</center>
</body>
</html> 