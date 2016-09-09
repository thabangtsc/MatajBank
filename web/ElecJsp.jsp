<%-- 
    Document   : ElecJsp
    Created on : 23 Aug 2016, 12:30:49 PM
    Author     : Thabang
--%>

<<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MATAJBank_Electricity_JSP</title>
    </head>
    <body>
         <%
       Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/mataj_bank";
    String user = "root";
    String password = "thabang";
    
    con = DriverManager.getConnection(url,user,password);
    
    Statement st = con.createStatement();
    
    String amount = request.getParameter("amt");// Send to Acc table
    String account = request.getParameter("acc");
    String Electricity = request.getParameter("demo");
    String Bal,query;
    String ref ,TransT = "Electricity";
    LocalDateTime ldt = LocalDateTime.now();
    String Date = ldt.toString(); 
    
 try
    {
       ps = con.prepareStatement("SELECT amount FROM tbl_balance_amount WHERE account = '"+account+"'");
    
      rs = ps.executeQuery();
    
      while(rs.next())
      {
         Bal = rs.getString("amount");
         
         int b = Integer.parseInt(Bal);
         int c = Integer.parseInt(amount);
         
         if(b < c)
         {
             out.println("No Funds");
             response.sendRedirect("NoFunds.html");
         }
         else
         {
             ref = account.substring(5, 8) +TransT.substring(0, 3)+ account.substring(5, 8)+Date.substring(5, 16);
           
   // String sql = "SELECT acc_number,password FROM tbl_online_account WHERE acc_number = ? and password = ?";// Select Username & Password
         String up = "UPDATE tbl_balance_amount SET amount =(amount - '"+amount+"') WHERE account ='"+account+"'";
    
     st.executeUpdate(up);
   
   //out.println("Airtime voucher worth: R"+amount+" was bought from account number: "+account+ " :" + airtime);
    // airtime="Airtime voucher worth: R"+amount+" was bought from account number: "+account+ " :" + airtime; 
   // Display airtime in <p id="demo"></p>
      query = "INSERT INTO tbl_transaction(transaction_ref, acc_number, Receiver_acc, transaction_type, date_time)VALUES(?, ?, ?, ?, ?)";
           
           PreparedStatement ps2 = con.prepareStatement(query);
           
           ps2.setString(1, ref);
           ps2.setString(2, account);
           ps2.setString(3, account);
           ps2.setString(4, TransT);
           ps2.setString(5, Date);
           
           ps2.executeUpdate();
          // con.close();   
     }
      
     }
    }  
  catch(SQLException a)
    {
       out.println("SQL Error. Try to fix your SQL statement now" + a);
    }
 out.println("Electricity voucher worth: R"+amount+" was bought from account number: "+account);
          %>
          
    </body>
</html>
