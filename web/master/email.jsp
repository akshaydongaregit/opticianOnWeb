<%-- 
    Document   : email
    Created on : Jan 18, 2018, 9:52:16 PM
    Author     : DONGRE
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
         <%!   
             String gfrom;
             String gpassword;
             
           boolean mail(String from,String password,String to,String subject,String message)
           {
               
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
                this.gfrom=from;
                this.gpassword=password;
                
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(gfrom,gpassword);
			}
		  });

		try {

			Message mmessage = new MimeMessage(session);
			mmessage.setFrom(new InternetAddress(from));
			mmessage.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
			mmessage.setSubject(subject);
			mmessage.setText(message);
			Transport.send(mmessage);
                        
			System.out.println("Message Sent");
                        return true;
                        
		} catch (MessagingException e) {
			e.printStackTrace();
                        return false;
		}
               
           }
           
         %>
    </body>
</html>
