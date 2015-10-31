<?php
// For list of Countries
include("classes/country.class.php");
$oCountry=new country();
$oCountry->continent= $_GET['continent'];
$oCountry->countryList();

include("classes/league.class.php");
$oLeague=new league();
// To display list of league of certain country
if (isset($_GET['country'])!="")
{
	$oLeague->country= $_GET['country'];
	$oLeague->leagueList();
}




?>