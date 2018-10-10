<%@ page language="java" %>
<HTML>
<HEAD><TITLE>Image Upload</TITLE>
<style type="text/css">
.tab {
margin-left: 0.5em
}
</style>
</HEAD>
<BODY> 
<a class="tab" style="float:right" href="index.jsp">Logout</a> 
<a style="float:right" href="changepassword.jsp">Change Password</a><br>
<%@ include file="css.jsp" %>
<%@ include file="header.jsp" %>
<FORM ENCTYPE="multipart/form-data" ACTION="upload_image_proc.jsp" METHOD=POST>
<br><br><br>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr>
<center>
<td colspan="2" align="center"><B>UPLOAD THE FILE</B><center></td>
</tr>
<tr>
<td colspan="2" align="center"> </td>
</tr>
<tr>
<td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file"></td>
</tr>
<tr>
<td colspan="2" align="center"> </td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Send File"> </td>
</tr>
<table>
</center>
</FORM>
</BODY>
</HTML>