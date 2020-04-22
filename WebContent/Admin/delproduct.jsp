<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver"%>

<%
    if(request.getParameter("delID")!=null)
    {
		String Ri=request.getParameter("delID");
                
                 try
                 {

                	  Class.forName("com.mysql.jdbc.Driver").newInstance();
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
            	       Statement stmt=Conn.createStatement();
                     
                      
                      stmt.executeUpdate("delete from products where ID="+Ri);
                    
                      response.sendRedirect("Products.jsp?msg=Update%20Success");
                }
                catch(Exception ee)
                {
                        //out.println(ee);
                }
              
    }     
           

%>
