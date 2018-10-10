 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <html>
 <body>
 <%@ include file="css.jsp" %>
 <%@ include file="header.jsp" %>
<form action="reset_process.jsp" method="post">
<table>
<tr><td>New Password</td><td><input type="password" name="new"></td></tr>
<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr>
<tr><td><input type="submit" value="Reset Password"></td></tr>
</table>
</form>
</body>
</html> 