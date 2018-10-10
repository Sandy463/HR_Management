<%@ page import="java.sql.*,com.Insert.DatabaseConnection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ include file="css.jsp" %>
<%@ include file="header.jsp" %>
<%
PreparedStatement ps = null;
ResultSet rs = null;
String sql = "select designation from hr";
try {
			Connection con = DatabaseConnection.loadDriver();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
	%>
<form method="post" action="Login_Process.jsp">
<center>
		<h2 style="color: green">Login </h2>
		</center>
		<table border="1" align="center">
		<tr>
			<td>Enter Your Name :</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>Enter Your Password :</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>Select UserType</td>
			<td><select name="designation">
			<option value="select">select</option>
			<option value="Employee">Employee</option>
			<option value="Manager">Manager</option>
			<option value="Admin">Admin</option>
				<%
					while (rs.next())
							{
								String usertype = rs.getString("designation");
						%>
					
<%
							}

			}catch (SQLException sqe){
							out.println("Login" + sqe);
}
						%>

				</select></td>

			</tr>

			<tr>

				<td><a href="forgot.jsp">Forgot Password</a></td>

				<td><input type="submit" value="submit" /></td>
		</table>

	</form>

</body>

</html>