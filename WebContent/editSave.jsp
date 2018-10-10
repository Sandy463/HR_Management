<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<%
String Id= request.getParameter("empId");
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
String sql="update hr set designation=?,fname=?,lname=?,uname=?,email=?,dob=?,phoneno=?,addr=?,sex=? where employeeId=" +Id;
try
{
Connection con = DatabaseConnection.loadDriver();
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,designation);
ps.setString(2,fname);
ps.setString(3,Lname);
ps.setString(4,uname);
ps.setString(5,email_id);
ps.setString(6,bday);
ps.setString(7,phoneno);
ps.setString(8,addr);
ps.setString(9,sex);
int i=ps.executeUpdate();
if(i>0)
out.println("Successfully Update<br><br>To go back Click<a href='index.jsp'>Here</a>");
else
	out.println("Problem in Update<br><br>To go back Click<a href='index.jsp'>Here</a>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 