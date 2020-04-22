<%@page import="java.text.ParseException"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>

<%

        String bs="";
        String msg="";
        
        String A="";
        String B="";
        String C="";
        String D="";
        String E="";
        String F="";
        String J="";
        String G="";
        String UserID="";
       
    
    
		try
        {
			
		String path=String.valueOf(request.getRealPath("/")+"assets/products");
	    
        MultipartRequest m = new MultipartRequest(request, path);
        Enumeration files = m.getFileNames(); 
        String name="",filename="";

        while (files.hasMoreElements()) 
        { 
                          name = (String)files.nextElement(); 
                          filename = m.getFilesystemName(name); 
        } 
        J=filename;
        String controlname="";
        
        Enumeration params = m.getParameterNames();
        
        while (params.hasMoreElements()) 
        {

                 controlname = (String)params.nextElement();
                 
                 if(controlname.equals("Brandname"))
                 {
                    A= m.getParameter(controlname);
                 }
                 
                 if(controlname.equals("Categoryname"))
                 {
                    B= m.getParameter(controlname);
                 }
                 
                 if(controlname.equals("Productname"))
                 {
                    C= m.getParameter(controlname);
                 }
                 
                 if(controlname.equals("Quantityname"))
                 {
                   D= m.getParameter(controlname);
                 }
                 
                 if(controlname.equals("Price"))
                 {
                    E= m.getParameter(controlname);
                 }
                 
                 if(controlname.equals("desc"))
                 {
                   F= m.getParameter(controlname);
                 }
                 
                
		}
        
        

          
 
          Class.forName("com.mysql.jdbc.Driver").newInstance(); 
          Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
	  	  Statement stmt=Conn.createStatement();
	  	  
	      stmt.executeUpdate("insert into products(Brandname,Categoryname,Itemname,QuantityAvaliable,description,price,picture) values('"+ A +"','"+ B +"','"+ C +"','"+ D +"','"+ F +"','"+ E +"','"+ J +"')");
          
	      response.sendRedirect("Products.jsp");
        }
        catch(Exception ee)
        {
            out.println(ee);
        }

    
  
%>