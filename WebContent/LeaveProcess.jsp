<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Request</title>
</head>
<body>

<% 
String name=(String)session.getAttribute("username");
String s1=new String();
s1=(String)session.getAttribute("leave");
String s2=new String();
s2=request.getParameter("l1");
Integer a=Integer.valueOf(s1);
Integer b=Integer.valueOf(s2);
int c=a-b;
/* 
int b=Integer.parseInt(s2); 
int a=Integer.parseInt(s1); */
//int c=(int)a-(int)b;
try
{
	Connection con = DatabaseConnection.loadDriver();
Statement st=con.createStatement();
int i=st.executeUpdate("update hr set Leave='"+c+"' where uname ='"+name+"'");
if(i==1)%>
<center>
<p style="color: red">Leave request accepted</p>
</center>
<%	getServletContext().getRequestDispatcher("/Leave_request.jsp").include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>
</body>
</html>