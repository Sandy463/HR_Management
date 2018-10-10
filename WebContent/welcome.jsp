<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.Insert.DatabaseConnection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Info</title>
<style type="text/css">
body{
    background-image: url(http://kreativo.se/backlogin.jpg);
    font-family: "Helvetica Neue", Helvetica, Arial;
    padding-top: 20px;
}
.tab {
margin-left: 0.5em
}
</style>
</head>

<body>
<%@ include file="css.jsp" %>
<a class="tab" style="float:right" href="index.jsp">Logout</a>
<a style="float:right" href="changepassword.jsp">Change Password</a>
<%@ include file="header.jsp" %>
<center><p>Welcome, <%=session.getAttribute("username") %></p></center>
<%  int timeout = 20 ;
	HttpSession sessionObj = request.getSession(true); 
	sessionObj.setMaxInactiveInterval(timeout);
	response.setHeader("Refresh", timeout + "; URL=timeout.jsp");
	%>
   <% 
   String sql = "select * from hr where uname=?";
   String username = (String)session.getAttribute("username");
   String Show_Leave;
   
   if(!(username.equals(null)|| username.equals("")))
   {
	  try{
		  Connection con = DatabaseConnection.loadDriver();

			PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            %>
            	<center>	
            		<form autocomplete="on">
            		 <table style=color:red>
                  		<tr>
                  			<td>
                  				<label  for=employeeId >EmployeeId</label></td> 
            		   		<td>	<input type=text value=<%=rs.getString("employeeId") %> >
            		   		</td>
            		   		<td>
            		  			<label  for=designation>Designation</label></td>
            		   		<td>	<input type=text value=<%=rs.getString("designation") %> >
            		   		</td>
            		   	</tr>
            		   <tr>
            		   		<td>
            		   			<label  for=Fname >Firstname</label></td>
            		   		<td><input type=text value=<%=rs.getString("fname") %> >
            		   		</td>
            		   		<td>
            		   			<label  for=employeeId>Lastname</label></td>
            		  		<td>	<input type=text value=<%=rs.getString("lname") %> >
            		  		</td>
            		  	</tr>
            		   <tr>
            		   		<td>
            		   			<label  for=employeeId>UserName</label></td>
            		   		<td><input type=text value=<%=rs.getString("uname") %> >
            		   		</td>
            		   		<td>
            		   			<label  for=employeeId>Password</label></td>
            		   			<td><input type=password value=<%=rs.getString("upass") %> >
            		   		</td>
            		   	</tr>
            		   <tr>
            		   		<td>
            		   			<label  for=employeeId>Email</label></td>
            		   		<td><input type=text value=<%=rs.getString("email") %> >
            		   		</td>
            		   		<td>
            		   			<label  for=employeeId>DOB</label></td>
            		   		<td><input type=date value=<%=rs.getString("dob") %> >
            		   		</td>
            		   	</tr>
            		   <tr>
            		   		<td>
            		   			<label  for=employeeId>MobileNo</label></td>
            		   		<td><input type=text value=<%=rs.getString("phoneno") %> >
            		   		</td>
            		   		<td>
            		   			<label  for=employeeId>Address</label></td>
            		   		<td>	<input type=text value=<%=rs.getString("addr") %> >
            		   		</td>
            		   	</tr>
            		   	<tr>	
            		   		<td>
            		   			<label  for=employeeId>Sex</label></td>
            		   		<td><input type=text value=<%=rs.getString("sex") %> >
            		   		</td>
            		   </tr>
            		   <tr>	
            		   		<td>
            		   			<label  for=Leave>Leave Remaining</label></td>
            		   		<td><input type=text name="leave" value=<%=rs.getString("Leave") %> >
            		   		 <%Show_Leave= rs.getString("Leave");
           session.setAttribute("leave", Show_Leave);%>
            		   		</td>
            		   </tr>
            		   <tr></tr>
            		   <tr></tr>
            		   <tr></tr>
            		   <center><tr>
            		   <td></td>
            		   		<td>
            		   			<a href="edit.jsp">EDIT</a>
            		   		</td>
            		   		<td>
            		   			<a href="upload.jsp">UPLOAD IMAGE</a>
            		   		</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		   		<td></td>
            		   		<td>
            		   			<a href="Leave_request.jsp">Leave Request</a>
            		   		</td>	
            		   </tr>
            		   </center>
            		   </table>
                    </form>
                 </center>   
            	<%
              // rs.close();
              // ps.close(); 
            }
	  }catch(SQLException sqe){
            out.println(sqe);
      } 
   }
	%>
	
</body>
</html>