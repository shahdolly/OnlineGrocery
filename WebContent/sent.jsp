
  <%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
Properties props = new Properties();


props.put("mail.smtp.host", "smtp.gmail.com");
// below mentioned mail.smtp.port is optional 
props.put("mail.smtp.port", "587");		
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");



Session sessionN = Session.getInstance(props,new javax.mail.Authenticator()
{
    protected PasswordAuthentication getPasswordAuthentication()
    {
	         return new PasswordAuthentication("suriredhatprojects@gmail.com","pb57a1815"); 
    }
});

try {

	   
   
}
catch(Exception e) {
     e.printStackTrace();
     out.print(e);
}
%>
