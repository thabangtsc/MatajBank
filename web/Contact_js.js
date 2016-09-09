/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Validate()
			{			
				//Validate all contact fields.
				
                            if(document.contact.name.value=="")
				{		 
                                    alert("Name field must not be empty. Please enter your name.");
                                    document.contact.name.focus();
                                    return false;
				}

                            if (document.contact.surname.value=="")
				{			
                                    alert("Surname field must not be empty. Please enter your surname.");
                                    document.contact.surname.focus();
                                    return false;
				}
				
                            if (document.contact.telephone.value=="")
				{			
                                    alert("Telephone field must not be empty. Please enter your telephone numbers.");
                                    document.contact.telephone.focus();
                                    return false;
				}
					
                            if (document.contact.cemail.value=="@")
				{				
                                    alert("Email field must not be empty. Please enter your email.");
                                    document.contact.cemail.focus();
                                    return false;
				}
                            if (document.contact.gender.value=="Select your gender")
				{
                                    alert("Gender is a required field. Please select male or female.");
                                    document.contact.gender.focus();
                                    return false;
				}
				
                            if (document.contact.text.value=="Type your comments here...")
				{
                                    alert("Please leave your comment, query or your message of good well for us.");
                                    document.contact.text.focus();
                                    document.contact.text.value="";
                                    return false;
				}
					
					
					
                            else 
				{
                                    return true;
				}
			}
			
			//The purpose if this this is to confirm the reset of the form
		function confirmReset()
			{
			// The variable will hold the value of the form confirmation response 
                            var resetForm = window.confirm("Are you sure you want to reset the form?");
	
			//Checks if the response is yes. 
			if(resetForm == true)
	
			// The form get reset. 
			return true;
	
			//Otherwise the form is not reset. 
			return false;
	
			}	
	
