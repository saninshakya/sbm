<?php
/////////////////////////
// Definitions
////////////////////////
define("IN_SPICEMART",true);
define("HOME",$_SERVER['PHP_SELF']);

require_once("classes/database.class.php");
require_once("classes/form.class.php");
/*
define("SUCCESS",0);
define("FAILURE",1);
define("USER_NOT_FOUND",2);
define("PASSWORD_MISMATCH",3); */

/* The default variable which stores the default values of their respectives */
$default=array(
	'DB_SERVER'=>'Localhost',
	'DB_USER'=>'root',
	'DB_PASS'=>'',
	'DB_NAME'=>'sbm_v1'
	
	);

//Database object
$m_db=new clsMySQLDB();
$m_db->server_name=$default['DB_SERVER'];
$m_db->user=$default['DB_USER'];
$m_db->pass=$default['DB_PASS'];
$m_db->db=$default['DB_NAME'];

$m_db->Connect();
$m_db->SelectDB();

//Form Object
$oForm=new clsForm();

?>