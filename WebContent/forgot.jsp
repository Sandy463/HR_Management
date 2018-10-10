<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password JSP</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="css.jsp" %>
<center>
<h2>Forgot Password</h3>
<form action="forgot-process.jsp" method="post"><br><br>
Enter Email ID:<input type="text" name="email" /><br><br>
<input type="submit" value="submit"/>
</form>
</center>
</body>
</html>