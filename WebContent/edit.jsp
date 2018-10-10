<%@page import="java.sql.*,java.util.*,com.Insert.DatabaseConnection"%>
<html>
 <head>
<title>Edit Form</title>
 <script type="text/javascript">
   function validate_form() {
            if (document.emp.emp_name.value == "") {
                alert("Please fill in the 'Your Employee Name' box.");
                return false;
            }
            if (document.emp.num.value == "") {
                alert("Enter Employee Number");
                return false;
            }
            alert("sucessfully Submitted");
 			if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/).test(document.emp.email_id.value)) {
                alert("You have entered an invalid email address!")
                return (false)
            }
        }
 
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode != 46 && charCode > 31 &&
                (charCode < 48 || charCode > 57)) {
                alert("Enter Number");
                return false;
            }
            return true;
        }
 
 
    
    </script>
 <style type="text/css">
.tab {
margin-left: 0.5em
}
</style>
</head>
 
<body >
<a class="tab" style="float:right" href="index.jsp">Logout</a> 
<a style="float:right" href="changepassword.jsp">Change Password</a><br>
<%@ include file="header.jsp" %>
<%@ include file="css.jsp" %>
<% 

   String sql = "select * from hr where uname=?";
   String username = (String)session.getAttribute("username");
   
   if(!(username.equals(null)|| username.equals("")))
   {
	  try{
		  Connection con = DatabaseConnection.loadDriver();

			PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
            	%>
            
    <form name="emp" action="editSave.jsp" onsubmit="return validate_form();" method="post">
        <table align="center" width=40% width="100%" cellspacing="2" cellpadding="2" border="5">
            <tr>
                <td colspan="2" align="center"><b>Edit Form.</b></td>
 
            </tr>
            <tr>
            		<td align="left" valign="top" width="41%">EmployeeId</td>
 					<td width="57%"><input type="hidden" placeholder="hidden content" value="<%=rs.getString("employeeId")%>" name="empId" size="24"></td>
            </tr>
             <tr>
                <td align="left" valign="top" width="41%">Designation</td>
                <td width="57%"><select name="designation" >
<option value="<%=rs.getString("designation")%>"><%=rs.getString("designation")%></option>
<option value="Employee">Employee</option>
<option value="Manager">Manager</option> 
</select></td>
 
 
            </tr>
            <tr>
                <td align="left" valign="top" width="41%">First Name<span style="color:red">*</span></td>
 
                <td width="57%"><input type="text" value="<%=rs.getString("fname")%>" name="fname" size="24"></td>

            </tr>
            <tr>
                <td align="left" valign="top" width="41%">Last Name<span style="color:red">*</span></td>
 
                <td width="57%"><input type="text" value="<%=rs.getString("lname")%>" name="Lname" size="24" required></td>
                
            </tr>
             <tr>
                <td align="left" valign="top" width="41%">DOB<span style="color:red">*</span></td>
 
                <td width="57%"><input type="date" value="<%=rs.getString("dob")%>" name="bday" size="24" required></td>
                
            </tr>
            <tr>
                <td align="left" valign="top" width="41%">User Name<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="text" value="<%=rs.getString("uname")%>" name="uname"  size="24" required></td>
            </tr>



<tr>
<td align="left" valign="top" width="41%">Sex<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="radio" value="Male" name="sex" size="24" required>Male
                      <input type="radio" value="Female" name="sex"  size="24">Female</td>

            </tr>


            <tr>
                <td align="left" valign="top" width="41%">Address</td>
 
                <td width="57%"><input type="text" rows="4" maxlen="200" name="addr" cols="20" value="<%=rs.getString("addr")%>" required></textarea></td>
            </tr>
             <tr>
 
            <td align="left" valign="top" width="41%">Contact Number</td>
            <td width="57%">
                <input type="text"  onkeypress="return isNumberKey(event)" value="<%=rs.getString("phoneno")%>" name="phoneno" size="24"></td>
            </tr>
                <td align="left" valign="top" width="41%">Email<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="email" value="<%=rs.getString("email")%>" name="email_id" size="24" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
            </tr>
 
            <tr>
                <td colspan="2">
                    <p align="center">
                        <input type="submit" value="Edit & Save" name="B4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="  Reset All   " name="B5"></td>
            </tr>
 
        </table>
    </form>
<script>


function checkPass()
{
    
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    
    var message = document.getElementById('confirmMessage');
   
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    if(pass1.value == pass2.value){
       
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match"
    }else{
    
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}</script> 
<%}
            }catch(Exception ex){ System.out.print(ex);} 
            }%>
}

</body>
</html>