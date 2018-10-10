<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<%!String userdbName;
	String userdbPsw;
	String userdbrole;%>
<%
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "select * from hr where uname=? and upass=? and designation=?";
	String username = request.getParameter("name");
	String password = request.getParameter("password");
	String designation = request.getParameter("designation");
	
	
	if (!(username.equals(null) || username.equals(""))
			&& !(password.equals(null) || password.equals(""))) {
		try {
			Connection con = DatabaseConnection.loadDriver();
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3,designation);
			rs = ps.executeQuery();
			if (rs.next()) {
				userdbName = rs.getString("uname");
				userdbPsw = rs.getString("upass");
				userdbrole=rs.getString("designation");
				if (username.equals(userdbName)
						&& password.equals(userdbPsw)&& designation.equals(userdbrole)) {
					if(designation.equals("Employee")||designation.equals("Manager")){
					session.setAttribute("username", userdbName);
					response.sendRedirect("welcome.jsp");
					}
					else{
						response.sendRedirect("welcomeAdmin.jsp");
					}
				} 
			}else {%>
				<center>
				<p style="color: red">Wrong Credential</p>
			</center>
		<%	getServletContext().getRequestDispatcher("/Login.jsp").include(
				request, response);
		}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			ps.close();
		}
	} else {
%>
<center>
	<p style="color: red">Error In Login</p>
</center>
<%
	getServletContext().getRequestDispatcher("/login.jsp").include(
				request, response);
	}
%>
