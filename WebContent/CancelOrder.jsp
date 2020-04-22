<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver"%>

<%
    if(request.getParameter("ID")!=null)
    {
		String Ri=request.getParameter("ID");
                
                 try
                 {

                	  Class.forName("com.mysql.jdbc.Driver").newInstance();
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
            	       Statement stmt=Conn.createStatement();
                      Statement stmt1=Conn.createStatement();
                      
                      stmt.executeUpdate("delete from orders where OrderID="+Ri);
                      stmt1.executeUpdate("delete from order_detail where orderid="+Ri);
                      response.sendRedirect("LastOrders.jsp?msg=Update%20Success");
                }
                catch(Exception ee)
                {
                        //out.println(ee);
                }
              
    }     
           

%>
