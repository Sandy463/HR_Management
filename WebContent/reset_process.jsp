 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,com.Insert.DatabaseConnection"%>
<%
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String pass="";
String name1="";
try{
	Connection con = DatabaseConnection.loadDriver();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from hr");
while(rs.next()){
 name1=rs.getString(5);
}
if( Newpass.equals(conpass)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update hr set upass='"+Newpass+"' where uname ='"+name1+"'");%>
<center>
	<p style="color: red">Password changed successfully</p>
</center>
<%
	getServletContext().getRequestDispatcher("/reset.jsp").include(
				request, response);
st1.close();
con.close();
}
else{%>
	<center>
	<p style="color: red">Both password are not same</p>
</center>
<%
	getServletContext().getRequestDispatcher("/reset.jsp").include(
				request, response);
	}


}
catch(Exception e){
out.println(e);
}
%> 