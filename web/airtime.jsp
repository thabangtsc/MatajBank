<%-- 
    Document   : airtime
    Created on : 24 Aug 2016, 12:47:12 PM
    Author     : Thabang
--%>
<%@page import="java.util.Random"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <title>MATAJBank_Buy_Airtime</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"  type="text/css" href="transaction.css"/>
         <LINK REL=StyleSheet HREF="Logo.css" TYPE="text/css" />
        <script src ="Logo.js" type="text/javascript"></script>
        <script type="text/javascript" src="myScript.js"></script>
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
    String airtime = request.getParameter("demo");
    String Bal,query,air;
    String ref ,TransT = "Airtime";
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
         
         air = "Airtime voucher worth: R"+amount+" was bought from account number: "+account+ " :";
          out.println(air);
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
 
          %>
     <div id ="Logo">
            <img src="MATAJ.png" alt ="Logo" onclick="home()"/>
        </div>
     <div align="center"><a href="login.html">Log Out</a></div>
        <div id="form" align="center">
        <form name="airtime" method="post" action="airtime.jsp">
            <center>
            <h2 style="color:green">Airtime </h2>
        </center>
            <table>
                <tr> <td> 
                        <fieldset>
                     <legend>Network Provider:</legend> 
                    
                     <br>
                        <input type="radio" name="cell" value="cellC" id="c"/>
                        <img src="cell c.png" alt="CellCPic" width="50" height="30"/>
                     <br>
                        <input type="radio" name="mtn" value="MTN" id="m">
                         <img src="MTN_Logo.svg.png" alt="MtnPic" width="50" height="30" />
                    <br>
                         <input type="radio" name="telkom" value="Telkom" id="t" >
                        <img src="Telkom.png" alt="TelkpmPic" width="50" height="30"/>
                     <br>
                        <input type="radio" name="vodacom" value="Vodacom" id="v">
                        <img src="vodacom.jpg" alt="VodacomPic" width="50" height="30"/>
                    </fieldset>
                        </td>
                    
                </tr>
                <tr> <td>
                     <label>Amount:</label> <input type="text" name="amt"/> 
                    </td>
                 </tr>
               <tr> <td>
                 <label>Account Number:</label> <input type="text" name="acc"/> 
                </td>
             </tr>
             
               <tr> <td>
                       
                 <div id="btn">
                     <input type="submit" name="btnAirtime" value="Buy Airtime" onclick="myFunction()"/>
                    <input type="reset" name="btnReset"/>
                 </div>  
                </td>
               </tr>
               
            </table> 
        </form>
            <p id="demo"></p>

        </div>
        
        <a href="transactions.html">Back</a>
    </body>
</html>
