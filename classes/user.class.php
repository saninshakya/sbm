<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class user
{
	var $user;
	var $pass;
	var $firstname;
	var $lastname;
	var $address;
	var $country;
	var $dob;
	var $contact;
	var $email;
	var $code;
	var $username;
	var $password;
	var $confirm;
  
	///////////////////////////////////////////////////////
	//Checks if username and password are correct		///
	///////////////////////////////////////////////////////
	function check_user()
	{
	
		global $m_db;
		if (($this->user=="") || ($this->pass==""))
		{
			return "FILL_THIS_FIELD";
		}

		$result = $m_db->Query("SELECT * FROM sbm_user WHERE username ='" . $this->user ."' and password='" . md5($this->pass) . "'");
		if ($m_db->countRows($result) > 0)
		{
			$_SESSION['chk'] = true;
			$row=$m_db->Fetch($result);
			$_SESSION['sbm_user']=$row['username'];
			$_SESSION['sbm_user_id']=$row['user_id'];
			return "SUCCESS";
			
		}
		else
		{
			return "INVALID";
			
		}
	}


	///////////////////////////////////////////////////////
	//Register New Users                        		///
	///////////////////////////////////////////////////////
	function create_user()
	{
		global $m_db;
	
		if (($this->username!="") && ($this->password!="") && ($this->confirm!=""))
		{	
			global $m_db;
			//checks the username
			if (strlen($this->username)<5)  			// username shouldnot be less than 5
				return "USERNAME_BELOW_5_CHARACTER";
			elseif (strlen($this->username)>20)			//username shouldnot be greater than 20
				return "USERNAME_ABOVE_20_CHARACTER";
			else if(!eregi("^([0-9a-z])+$", $this->username)) //only alphanumeric values are allowed in username
				return "USERNAME_NOT_ALPHANUMERIC";

			//for checking whether or not the username exists.
			$rsltusername=$m_db->Query("SELECT * FROM sbm_user WHERE username='".$this->username."'");
			if(mysql_fetch_row($rsltusername)>0)
				return "USERNAME_EXISTS";
						
			//checks the password
			if ($this->password!=$this->confirm)	//for checking the password and confirm password
				return "PASSWORD_DIDNOT_MATCH";
			else if(!eregi("^([0-9a-z])+$", $this->password)) //only alphanumeric values are allowed in password
				return "PASSWORD_NOT_ALPHANUMERIC";
			elseif (strlen($this->password) < 4)  			// PASSWORD shouldnot be less than 4
				return "PASSWORD_BELOW_4_CHARACTER";
			
			//checks the email address
			if ($this->email!="")
			{
				$regex = "^[_+a-z0-9-]+(\.[_+a-z0-9-]+)*"."@[a-z0-9-]+(\.[a-z0-9-]{1,})*"."\.([a-z]{2,}){1}$"; // pattern of the email address.
        		if(!eregi($regex,$this->email))
            		return "INVALID_EMAIL";
			}		
			$rsltuser=$m_db->Query("INSERT INTO sbm_user (firstname, lastname, address, country, dob, contact_no, email, security_code, username, password, role_id) VALUES ('".$this->firstname."' , '".$this->lastname."' , '".$this->address."' , '".$this->country."' , '".$this->dob."' , '".$this->contact."' ,'".$this->email."' ,'".$this->code."' , '".$this->username."' , '".md5($this->password)."' , '2')");
			
			if ($rsltuser > 0) //Insert successful
			{
				$_SESSION['chk'] = true;
				$_SESSION['sbm_user']=$this->username;
				$id=mysql_insert_id(); 
				$_SESSION['sbm_user_id']=$id;
				return "SUCCESS";
			}
			else 
				return "TRY_AGAIN";
			
				
		}//if (($this->username!="") && ($this->password!="") && ($this->confirm!=""))
		
		else
			return "FILL_THIS_FIELD";
			
	}//end insert function
	
	
	
		
	
	/////////////////////////////////////////////
	// For validating user registration
	////////////////////////////////////////////
	function validate_user()
	{
		if ($this->firstname=="")
			return false;
		if ($this->lastname=="")
			return false;
		if ($this->address=="")
			return false;
		if ($this->country=="")
			return false; 
		if ($this->dob=="")
			return false;
		if ($this->contact=="")
			return false;
				
		if ($this->username=="")
			return false;
		elseif (strlen($this->username)<5) 
			return false;
		elseif (!eregi("^([0-9a-z])+$", $this->username))
			return false;
		
	 	if ($this->password=="")
			return false;
		elseif	(!eregi("^([0-9a-z])+$", $this->password))
			return false;
		elseif (strlen($this->password)>20)
			return false;
		elseif (strlen($this->password) < 4)
			return false;
		elseif ($this->password!=$this->confirm)
			return false;
		if($this->email!="")
		{		
			$regex = "^[_+a-z0-9-]+(\.[_+a-z0-9-]+)*"."@[a-z0-9-]+(\.[a-z0-9-]{1,})*"."\.([a-z]{2,}){1}$"; // pattern of the email address.
			if(!eregi($regex,$this->email))
				return false;
		}
		
		if ($this->confirm=="")
			return false;
		else 
		return true;
		
	}
	
	
	
	
}
?>