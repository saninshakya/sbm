<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class league
{
	///////////////////////////////////////////////////////
	//Dsiplay list of countries		///
	///////////////////////////////////////////////////////
	function leagueList()
	{	
		global $m_db;
		$counter = 1;
		$result = $m_db->Query("SELECT
					   l.league_id, l.league_name, o.organization_id, o.organization_name, o.country_name 
					FROM
					   sbm_league as l 
					LEFT JOIN
					   sbm_organization as o 
					      ON l.organization_id=o.organization_id
						WHERE o.country_name = '".$this->country."'");

		echo("<div class=\"col-sm-9\"><table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>League</th><th>Organization</th><th>Country</th></tr></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result))
		{
			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['league_name']. "</a></td>");
			echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['organization_name']. "</a></td>");
			echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['country_name']. "</a></td>");
			echo("</tr>");
			$counter++;
		}
		echo("</tbody></table></div>");
	}

	function leagueName(){
		global $m_db;
		$league = $m_db->Query("SELECT league_name FROM sbm_league WHERE league_id='".$this->leagueid."'");
		$row=$m_db->Fetch($league);
		echo($row['league_name']);
	}
	
}

?>