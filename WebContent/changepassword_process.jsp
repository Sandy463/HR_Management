 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,com.Insert.DatabaseConnection"%>
<%
String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String pass="";
String name1="";
try{
	Connection con = DatabaseConnection.loadDriver();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from hr where upass='"+currentPassword+"'");
while(rs.next()){
 name1=rs.getString(5);
pass=rs.getString(6);
}
if(pass.equals(currentPassword)&& Newpass.equals(conpass)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update hr set upass='"+Newpass+"' where uname ='"+name1+"'");%>
<center>
Password changed successfully
</center>
<%
getServletContext().getRequestDispatcher("/changepassword.jsp").include(
request, response);
st1.close();
con.close();
}
else{%>
	<center>
<p style="color: red">Invalid Current password</p>
</center>
<%	getServletContext().getRequestDispatcher("/changepassword.jsp").include(
request, response);
}	
}
catch(Exception e){
out.println(e);
}
%> 