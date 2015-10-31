<?php

//if(!defined("IN_SPICEMART"))
//	die("External access denied!");
	

class clsMySQLDB
{
	var $server_name;
	var $user;
	var $pass;
	var $db;
	var $con;
	
	/* Connects to the server */
	function Connect()
	{
		$this->con=mysql_connect($this->server_name,$this->user,$this->pass) or die("ERROR: Couldnot connect to the database!");
	}
	
	/* Selects the database */
	function SelectDB()
	{
		mysql_select_db($this->db,$this->con) or die("ERROR: Couldnot select database");
	
	}
	
	
	/* Executes an SQL statement */
	function Query($sql)
	{	
		return mysql_query($sql);
	}
	
	function Fetch($rs)
	{
		return mysql_fetch_assoc($rs);
	}
	
	function countRows($rs)
	{
		return mysql_num_rows($rs);
	}

	
}	
?>