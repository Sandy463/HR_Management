<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.Insert.DatabaseConnection"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot password</title>
</head>
<body>
<%
    String strQuery = "select * FROM hr where email=?";
    final String email=request.getParameter("email");
    
    if(!(email.equals(null)) || email.equals(""))
    	try
    	{
		Connection con = DatabaseConnection.loadDriver();
		PreparedStatement ps=con.prepareStatement(strQuery);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
	   	String to = email;
	   	if (rs.next()) {
			String userdbEmail = rs.getString("email");
			if (email.equals(userdbEmail)){
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
	
		Session session1 = Session.getInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("khajuresandeep463@gmail.com","san*4631994");
		}
		});
	
	
	    MimeMessage message = new MimeMessage(session1);
	    message.setFrom(new InternetAddress(email));
	    message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		message.setSubject("PasswordReset");
		
		message.setContent("<html>\n" +
                "<body>\n" +
                "\n" +
                "<a href=\"http://localhost:8081/HR/reset.jsp\">\n" +
                "Reset</a>\n" +
                "\n" +
                "</body>\n" +
                "</html>", "text/html");
	
	    Transport.send(message);
	    %>
		<center>
		<p style="color: red">Password sent to your email id successfully !</p>
	</center>
	<%	getServletContext().getRequestDispatcher("/forgot.jsp").include(
			request, response);
        }
			}else{%>
			<center>
			<p style="color: red">Email-Id not matched with database</p>
		</center>
		<%	getServletContext().getRequestDispatcher("/forgot.jsp").include(
			request, response);
		}
}catch (Exception e){
e.printStackTrace();
}else{%>
<center>
<p style="color: red">Enter email-id.</p>
</center>
<%
getServletContext().getRequestDispatcher("/forgot.jsp").include(
			request, response);
}
%>

</body>
</html>
