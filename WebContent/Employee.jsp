<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a style="float:right" href="index.jsp">Logout</a>
<a style="float:right" href="changepassword.jsp">Change Password</a>
<%@ include file="css.jsp" %>
<%@ include file="header.jsp" %>
<br><br>
<center>
<%

try{
	Connection con = DatabaseConnection.loadDriver();
	String sql = "select * from hr where designation='Employee'";
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery(sql);%>
	
	<table border="1">
    <tr>
	   <th>employeeId</th>
	   <th>designation</th>
	   <th>fname</th>
	   <th>lname</th>
	   <th>uname</th>
	   <th>upass</th>
	   <th>email</th>
	   <th>dob</th>
	   <th>phoneNo</th>
	   <th>addr</th>
	   <th>sex</th>
	  </tr> 
	   <%
	while(rs.next()){%>
	

            		<tr>
            		   <td><%=rs.getString("employeeId") %></td>
            		   <td><%=rs.getString("designation") %></td>
            		   <td><%=rs.getString("fname") %></td>
            		   <td><%=rs.getString("lname") %></td>
            		   <td><%=rs.getString("uname") %></td>
            		   <td><%=rs.getString("upass") %></td>
            		   <td><%=rs.getString("email") %></td>
            		   <td><%=rs.getString("dob") %></td>
            		   <td><%=rs.getString("phoneno") %></td>
            		   <td><%=rs.getString("addr") %></td>
            		   <td><%=rs.getString("sex") %></td>
            		</tr>
            		
 <%}%></table><%}catch(Exception ex){
	ex.printStackTrace();
}
%>
</center>
</body>
</html>