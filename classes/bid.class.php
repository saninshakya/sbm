<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class bid
{
	function userweeklybid(){
		global $m_db;
		$bid_date = date("Y-m-d H:i:s"); 
		$result = $m_db->Query("INSERT INTO sbm_user_weekly_bid (amount, bid_date, is_win, payoff, user_id, weekly_odd_id, odd_selection) VALUES ('".$this->amount."' , '".$bid_date."' , '0' , '0' , '".$_SESSION['sbm_user_id']."' , '".$this->weeklyoddid."' , '".$this->odd."')");
		if ($result > 0)
			return "SUCCESS";
		else
			return "TRY_AGAIN";
	}

}