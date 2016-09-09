/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 function myFunction()
            {
                var c = document.getElementById("c").value;
                var m = document.getElementById("m").value;
                var t = document.getElementById("t").value;
                var v = document.getElementById("v").value;
               
                var date =  Date();
                var random1 = Math.floor((Math.random()* 9) + 1) +""+ Math.floor((Math.random()* 10) + 100);
                var random2  = Math.floor((Math.random()* 9) + 1) +""+ Math.floor((Math.random()* 10) + 100);
                var random3  = Math.floor((Math.random()* 9) + 1) +""+ Math.floor((Math.random()* 10) + 100);
                var random4  = Math.floor((Math.random()* 9) + 1) +""+ Math.floor((Math.random()* 10) + 100);
                //var amount = document.getElementById("amt").value;
//              
//                  if( (document.getElementById("m").checked==false)|| (document.getElementById("t").checked==false)||(document.getElementById("v").checked==false)||(document.getElementById("c").checked==false))
//                 {
//                      document.getElementById("demo").innerHTML ="Select airtime";
//                 }
// angelo: taks18
                 if(document.getElementById("amt").value == "")
                 {
                        document.getElementById("demo").innerHTML = "Please enter airtime amount"; 
                            document.getElementById("amt").value="";
                            document.getElementById("amt").focus();
                 }
                else if(document.getElementById("amt").value <= 5)
                 {
                        document.getElementById("demo").innerHTML = "Amount should be greater than R5"; 
                            document.getElementById("amt").value="";
                            document.getElementById("amt").focus();
                 }
                else if(isNaN (document.getElementById("amt").value))
                 {
                            document.getElementById("demo").innerHTML = "Amount should be a numeric value"; 
                            document.getElementById("amt").value="";
                            document.getElementById("amt").focus();
                 }
                
                else
                 {
                    if(c == "cellC")
                    {
                        document.getElementById("m").checked=false;
                        document.getElementById("t").checked=false;
                        document.getElementById("v").checked=false;
                        document.write = "'"  +random4 + " "+random1 + " "+random3 + "' "+ date;
                        document.getElementById("c").checked=false;
                    }
                      if(m == "MTN")
                     {
                        document.getElementById("c").checked=false;
                        document.getElementById("t").checked=false;
                        document.getElementById("v").checked=false;
                        document.write = "'"  +random1 + " "+random3 + " "+random2 + " "+random4 +"' "+ date;
                        document.getElementById("m").checked=false;
                      }
                     if(t == "Telkom")
                     {
                        document.getElementById("m").checked=false;
                        document.getElementById("c").checked=false;
                        document.getElementById("v").checked=false; 
                        document.write = "'"  +random3 + " "+random1 + " "+random4 +"' "+ date;
                        document.getElementById("t").checked=false;
                     }
                      if (v == "Vodacom")
                     {
                         document.getElementById("m").checked=false;
                        document.getElementById("t").checked=false;
                        document.getElementById("c").checked=false;
                        document.write = "'"  +random1 + " "+random2 + " "+random4 +"' "+ date;
                        document.getElementById("v").checked=false;
                    }
                    
                                        
                 }
                }
                
                
//              }
//                if (opt)
//                {
//                    if (opt.selectedIndex == 0)
//                    {
//                      alert("No airtime is selected");
//                      
//                    }
//                    if(opt.selectedIndex ==1)
//                    {
//                       alert("Cell"); 
//                    }
//                    else if(opt.selectedIndex ==2)
//                    {
//                       alert("Mtn"); 
//                    }
//                    else if(opt.selectedIndex ==3)
//                    {
//                       alert("Tell"); 
//                    }
//                    else if(opt.selectedIndex ==4)
//                    {
//                       alert("Voda"); 
//                    }
//                }
                
         