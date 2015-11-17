<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class country
{
	///////////////////////////////////////////////////////
	//Dsiplay list of countries		///
	///////////////////////////////////////////////////////
	function countryList()
	{	
		global $m_db;
		$result = $m_db->Query("SELECT * FROM sbm_country WHERE continent_name ='" . $this->continent . "'");
		echo("<div class=\"col-sm-3\"><div class=\"navbar-collapse collapse sidebar-navbar-collapse\"><ul class=\"nav nav-pills nav-stacked\">");
		echo("<li><a href=\"index.php\">List of Continent</a></li>");
		while ($row=$m_db->Fetch($result))
			echo("<li><a href=\"index.php?page=league&continent=".$this->continent ."&country=". $row['country_name'] ."\">".$row['country_name']. "</a></li>");
		echo("</ul></div></div>");
	}

	///////////////////////////////////////////////////////
	//Get the country 	///
	///////////////////////////////////////////////////////
	function getCountry()
	{	
		global $m_db;
		$result = $m_db->Query("SELECT country_name FROM sbm_country WHERE continent_name ='" . $this->continent . "' LIMIT 1");
		$row = $m_db->Fetch($result);
		return $row['country_name'];
	}


}

?>