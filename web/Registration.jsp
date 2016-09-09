<%-- 
    Document   : Registration
    Created on : 20 Jul 2016, 2:51:46 PM
    Author     : Thabang
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
              <h1>Hello Registration!</h1>
         <%
    Connection con =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    String ID = request.getParameter("id");// Send to Acc table
    String Name = request.getParameter("name");
    String Surname = request.getParameter("surname");
    String Gender = request.getParameter("Gender");
    int Age= Integer.parseInt(request.getParameter("age"));
    String Race= request.getParameter("race");
    String National= request.getParameter("nationality");
    String Address = request.getParameter("address");
    String Email= request.getParameter("email");
    int Contact = Integer.parseInt(request.getParameter("contact"));
    double Monthly = Double.parseDouble(request.getParameter("monthly_income"));
    String Acc = request.getParameter("ACCNO");// Send to Acc table
    String Pass = request.getParameter("Ppass");
    
    
    String DM = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/mataj_bank";
    String user = "root";
    String password = "thabang";
    
    String sql = ("INSERT INTO tbl_personal_info (id, name, surname, gender, age, race, nationality, address, email, contact, monthly_income, acc) VALUES ('"+ID+"','"+Name+"','"+Surname+"','"+Gender+"','"+Age+"','"+Race+"','"+National+"','"+Address+"','"+Email+"','"+Contact+"','"+Monthly+"','"+Acc+"')");
    String sqlAcc = ("INSERT INTO tbl_online_account (id, acc_number, password) VALUES ('"+ID+"','"+Acc+"','"+Pass+"')"); // Insert into Acc table
    String sqlCID = "SELECT * FROM tbl_personal_info WHERE id ='"+ID+"'";
    con = DriverManager.getConnection(url,user,password);
    
    Statement stm = con.createStatement();
    
    boolean unique = true;
    // Check if id is not a duplicated
    try
     {
        //ps = con.prepareStatement(sqlCID);
    
        //ps.setString(1,ID);
        
       // rs=ps.executeQuery();
        rs = stm.executeQuery(sqlCID);
        int dupli = 0;
        
        //String duplicate = null;
        while(rs.next())
        {
           // duplicate = rs.getString(1);
           
            if (rs.getString("id").equalsIgnoreCase(ID))
            {
                throw new SQLException("Duplicate ID Number. Enter new ID number");
               // out.println("Duplicate ID Number. Enter new ID number");
//                out.println("<script>");
//                out.println("document.getElementById('error').innerText=Duplicate ID Number. Enter new ID number");
//                out.println("document.getElementById('IDN').value=");
//                out.println("</script>");
               // unique  = false;
            }
//            if(duplicate==null)
//            {}else
//            {out.println("Duplicate ID Number. Enter new ID number");
//            }
            //out.println("Duplicate ID Number. Enter new ID number");
//           out.println("<script>");
//           out.println("document.getElementById('error').innerText=Sorry UserName or Password Error");
//           out.println("</script>"); 
        }
         
        
         // Insert into database tables
    int ii = stm.executeUpdate(sql);
    int iii = stm.executeUpdate(sqlAcc);
   
     if (( ii > 0) && (iii > 0))
    { 

       response.sendRedirect("index.html");
       
    }
    else
    {
        response.sendRedirect("Register.html"); // change here
    }
     } 
     catch(SQLException a)
     {
         out.println(a);
     }
     
    //String sqlid = "select id from tbl_personal_info where id =  '"+ ID +" '  "; // Get id from user
    //Class.forName(DM);
    //ps = con.prepareStatement(sqlid);
     //rs = ps.executeQuery();
   // try{
    // Class.forName(DM);
     //con = DriverManager.getConnection(url,user,password);
     //ps = con.prepareStatement(sqlid);
    //rs = ps.executeQuery();
     //rs = stm.executeQuery(sqlid);// retrival
     //String idnum = rs.getString("id");
    // int randomNum = 10 + (int)(Math.random()*99);
    // String acc = "2";
    // String Output = acc + randomNum + idnum.substring(7,10) + idnum.substring(12);
    // }
   //catch(SQLException a)
     // {
        //  out.println("Home" + a);
     // } // Catch ends here
      
//    rs = stm.executeQuery(sqlid);// retrival
   /* String idnum = rs.getString("id");// resultset get field id from database
    int randomNum = 10 + (int)(Math.random()*99);
     String acc = "2";
    String Output = acc + randomNum + idnum.substring(7,10) + idnum.substring(12);
    
    int AccountN = 87595464 ;//Integer.parseInt(Output);
    AccountN = Integer.parseInt(request.getParameter("acc_number"));
    System.out.print("your generated account :" + Output  );
    String Password = "1234";
    Password = request.getParameter("password"); 
    
    
    String Insert_Account_Sql = ("INSERT INTO tbl_online_account(acc_number, password, id) VALUES('"+AccountN+"','"+Password+"','"+ID+"')");
    con = DriverManager.getConnection(url,user,password);
    Statement Acc_st = con.createStatement();
    
     int  Acc_ii= Acc_st.executeUpdate(Insert_Account_Sql);
    
    if ( Acc_ii > 0)
    { 
       response.sendRedirect("index.html");
    }
    else
    {
        response.sendRedirect("me.html"); // change here
    }
    */
    
//try{
  //  Class.forName(DM);
    //con = DriverManager.getConnection(url,user,password);
    //ps = con.prepareStatement(sql);
    //rs = ps.executeQuery();


    //}
 //catch(SQLException a)
   //  {
     //    out.println("Home" + a);
     //}
       //   %>
       
    </body>
</html>

