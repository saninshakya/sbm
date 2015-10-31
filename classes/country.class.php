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
		echo("<div class=\"container-fluid\"><div class=\"row\">");
		while ($row=$m_db->Fetch($result))
			echo("<div class=\"col-md-1\"><a href=\"index.php?page=league&continent=".$this->continent ."&country=". $row['country_name'] ."\">".$row['country_name']. "</a></div>");
		echo("</div></div>");
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