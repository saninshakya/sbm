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

		$result = $m_db->Query("SELECT user_id, username FROM sbm_user WHERE username ='" . $this->user ."' and password='" . md5($this->pass) . "' and role_id='1'");
		if ($m_db->countRows($result) > 0)
		{
			// $_SESSION['chk'] = true;
			$row=$m_db->Fetch($result);
			$_SESSION['sbm_adminuser']=$row['username'];
			$_SESSION['sbm_adminuser_id']=$row['user_id'];
			return "SUCCESS";
			
		}
		else
		{
			return "INVALID";
			
		}
	}


	
}
?>