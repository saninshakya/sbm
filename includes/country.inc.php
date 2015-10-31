<?php

// session_start();
include("classes/country.class.php");
$oCountry = new country();
$oCountry->continent= $_GET['continent'];
$oCountry->countryList();

// Default League of England
include("classes/league.class.php");
$oLeague = new league();
$country = $oCountry->getCountry();
$oLeague->country= $country;
$oLeague->leagueList();

?>