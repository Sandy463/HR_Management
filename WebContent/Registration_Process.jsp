<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<%
String designation = request.getParameter("designation");

String fname = request.getParameter("fname");

String Lname = request.getParameter("Lname");
String bday = request.getParameter("bday");
String uname = request.getParameter("uname");
String password = request.getParameter("password");
String sex = request.getParameter("sex");
String addr = request.getParameter("addr");
String phoneno = request.getParameter("phoneno");
String email_id = request.getParameter("email_id");
try
{
	Connection con = DatabaseConnection.loadDriver();
Statement st=con.createStatement();
int i=st.executeUpdate("insert into hr(designation,fname,lname,uname,upass,email,dob,phoneno,addr,sex)values('"+designation+"','"+fname+"','"+Lname+"','"+uname+"','"+password+"','"+email_id+"','"+bday+"','"+phoneno+"','"+addr+"','"+sex+"')");
%><center>Thank you for register..</center>
<%	getServletContext().getRequestDispatcher("/Registration.jsp").include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 