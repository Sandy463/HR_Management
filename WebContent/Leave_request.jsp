<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Request</title>
<style type="text/css">
.tab {
margin-left: 0.5em
}
</style>
</head>
<body>
<%@ include file="css.jsp" %>
<a class="tab" style="float:right" href="index.jsp">Logout</a> 
<a style="float:right" href="changepassword.jsp">Change Password</a><br>
<%@ include file="header.jsp" %>


<form action="LeaveProcess.jsp">
<center><p>Welcome, <%=session.getAttribute("username") %></p><br>
Leave remain:<%=session.getAttribute("leave") %><br><br>
Leave Request:<input type="text" id="l1"  name="l1"/><br><br>
<input type="submit" value="submit">
</center>
</form>
</body>
</html>