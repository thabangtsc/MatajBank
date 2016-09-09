<%-- 
    Document   : transaction
    Created on : 25 Aug 2016, 1:40:19 AM
    Author     : Thabang
--%>

<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TRANSACTIONS</title>
    </head>
    <body>

    </body>
</html>
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
    // variables
    String SenderAcc = request.getParameter("Sacc");
    String ReceiverAcc = request.getParameter("Racc");  
    String Amount = request.getParameter("Amount");
    String Bal,query;
    
    String ref ,TransT = "Transfer";
    LocalDateTime ldt = LocalDateTime.now();
    String Date = ldt.toString();  
    
    try
    {
       ps = con.prepareStatement("SELECT amount FROM tbl_balance_amount WHERE account = '"+SenderAcc+"'");
    
      rs = ps.executeQuery();
    
      while(rs.next())
      {
         Bal = rs.getString("amount");
         int b = Integer.parseInt(Bal);
         int c = Integer.parseInt(Amount);
         
         
         if(b == 0)
         {
             response.sendRedirect("NoFunds.html");
         }
         if(b < c)
         {
              out.println("No Funds");
             response.sendRedirect("NoFunds.html");
         }
         else
         {
            ref = SenderAcc.substring(5, 8) +TransT.substring(0, 3)+ ReceiverAcc.substring(5, 8)+Date.substring(5, 16);
           
            st.executeUpdate("UPDATE tbl_balance_amount SET amount = (amount - '"+Amount+"') WHERE account = '"+SenderAcc+"'");    
            st.executeUpdate("UPDATE tbl_balance_amount SET amount = (amount + '"+Amount+"') WHERE account = '"+ReceiverAcc+"'");
            
            out.println("An Amount of R"+Amount+" has been transfered from "+SenderAcc +" to "+ReceiverAcc
                    +". Ref number: " + ref);   
            
           query = ("INSERT INTO tbl_transaction(transaction_ref, acc_number, Receiver_acc, transaction_type, date_time)VALUES(?,?,?,?,?)");
           
           //String sqlAcc = ("INSERT INTO tbl_online_account (id, acc_number, password) VALUES ('"+ID+"','"+Acc+"','"+Pass+"')"); 
           
//           int ii = st.executeUpdate(query);
//           
//           if (ii>0)
//            {
//                    
//            }
//           con.close();
           ps = con.prepareStatement(query);
           
           ps.setString(1, ref);
           ps.setString(2, SenderAcc);
           ps.setString(3, ReceiverAcc);
           ps.setString(4, TransT);
           ps.setString(5, Date);
           
           ps.executeUpdate();
            
           
           con.close();         
         }
    }
    }
    catch(SQLException se)
    {
        se.printStackTrace();
    }
  
    
    

     
   
    
%>

