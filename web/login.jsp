<%-- 
    Document   : login
    Created on : 20 Jul 2016, 11:03:58 AM
    Author     : Thabang
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
    Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    String DM = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/mataj_bank";
    String user = "root";
    String password = "thabang";
    
    String username = request.getParameter("uname");// Send to Acc table
    String Pass = request.getParameter("password");
    
    String sql = "SELECT acc_number,password FROM tbl_online_account WHERE acc_number = ? and password = ?";// Select Username & Password
   
    
try{
    Class.forName(DM);
    con = DriverManager.getConnection(url,user,password);
    ps = con.prepareStatement(sql);
    
    ps.setString(1,username); //username from database
    ps.setString(2,Pass); // get password from database
    
    rs = ps.executeQuery();

         if(rs.next())// username and pasword correct
            {
                
                 response.sendRedirect("transactions.html");
                
            }
         else// username and pasword incorrect
            {
                response.sendRedirect("error.html");
            }
     }
  catch(SQLException a)
    {
       out.println("SQL Error. Try to fix your SQL statement now" + a);
    }
          %>
          
                          
    </body>
</html>
