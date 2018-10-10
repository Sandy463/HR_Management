<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*,com.Insert.DatabaseConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<title>Registration Form</title>
 
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
                alert("You have entered an invalid email address!");
                return (false);
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

</head>
 
<body  >
<%@ include file="header.jsp" %>
<%@ include file="css.jsp" %>
        <script src="jquery.js" type="text/javascript"></script>
    	<script type="text/javascript">
              $(document).ready(function(){
                  $(".uname").change(function(){
                      var uname = $(this).val();
                      if(uname.length >= 3){
                          $(".status").html("<font color=gray> Checking availability...</font>");
                           $.ajax({
                              type: "POST",
                              url: "check",
                              data: "uname="+ uname,
                              success: function(msg){

                                  $(".status").ajaxComplete(function(event, request, settings){
                                       
                                      $(".status").html(msg);

                                  });
                              }
                          }); 
                      }
                      else{
                           
                          $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>");
                      }
                      
                  });
              });
              
            </script>
    <form name="emp" action="Registration_Process.jsp" onsubmit="return validate_form();" method="post">
        <table align="center" width=40% width="100%" cellspacing="2" cellpadding="2"  border="3" Bordercolor=red style="border-collapse: collapse">
            <tr>
                <td colspan="2" align="center"><b>Registration Form.</b></td>
 
            </tr>
             <tr>
                <td align="left" valign="top" width="41%">Designation</td>
                <td width="57%"><select name="designation">
<option value="Default">Default</option>
<option value="Employee">Employee</option>
<option value="Manager">Manager</option> 
<option value="Admin">ADMIN</option>
</select></td>
 
 
            </tr>
            <tr>
                <td align="left" valign="top" width="41%">First Name<span style="color:red">*</span></td>
 
                <td width="57%"><input type="text" value="" name="fname" size="24"></td>

            </tr>
            <tr>
                <td align="left" valign="top" width="41%">Last Name<span style="color:red">*</span></td>
 
                <td width="57%"><input type="text" value="" name="Lname" size="24" required></td>
                
            </tr>
             <tr>
                <td align="left" valign="top" width="41%">DOB<span style="color:red">*</span></td>
 
                <td width="57%"><input type="date" value="" name="bday" size="24" required></td>
                
            </tr>
            <tr>
                <td align="left" valign="top" width="41%">User Name<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="text" required value="" class ="uname" name="uname"  size="24">&nbsp;<span class="status"></span></td>
            </tr>

<tr>

<td align="left" valign="top" width="41%">Password:<span style="color:red">*</span></td>
                <td width="57%">

               
                    <input required name="password" type="password" class="form-control inputpass" id="pass1" size="24" /> </td></tr>

         <tr>       <td align="left" valign="top" width="41%">Confirm Password:<span style="color:red">*</span></td>
                <td width="57%">
                    <input required name="password" size="24" type="password" class="form-control inputpass" id="pass2" onkeyup="checkPass(); return false;" />
                        <span id="confirmMessage" class="confirmMessage"></span></td>
         

</tr>
<tr>
 <td align="left" valign="top" width="41%">Sex<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="radio" value="Male" name="sex" size="24" required>Male
                      <input type="radio" value="Female" name="sex"  size="24">Female</td>

            </tr>


            <tr>
                <td align="left" valign="top" width="41%">Address</td>
 
                <td width="57%"><textarea rows="4" maxlen="200" name="addr" cols="19" required></textarea></td>
            </tr>
             <tr>
 
            <td align="left" valign="top" width="41%">Contact Number</td>
            <td width="57%">
                <input type="text" value="" onkeypress="return isNumberKey(event)" name="phoneno" size="24"></td>
            </tr>
            <tr>
                <td align="left" valign="top" width="41%">Email<span style="color:red">*</span></td>
                <td width="57%">
                    <input type="email" value="" name="email_id" size="24" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
            </tr>
 				
            <tr>
                <td colspan="2">
                   <center><input class="submit" type="submit" value="  Submit" name="B4">
                   <input class="reset" type="reset" value="  Reset All   " name="B5"></td></center>
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
        message.innerHTML = "Passwords Not Match!"
    }
}
</script> 

</body>
 
</html>