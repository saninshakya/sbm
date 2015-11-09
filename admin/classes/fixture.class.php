<?php

/*
dependencies
database.class.php
config.php
table_mystyle.css
*/
class fixture
{

	/////////////////////////////////////////////
	//For displaying list of units added in table
	/////////////////////////////////////////////
	function display_fixture()
	{
		global $m_db;
		$counter = 1;
		$result = $m_db->Query("SELECT DISTINCT f.fixture_id, 
												gf.fixture_id AS fixtureid,
												gf.game_week,
												gf.fixture_date,
												wo.weekly_odd_id,  
												wo.odd_home, 
												wo.odd_draw, 
												wo.odd_away,
								(SELECT team_fullname 
									FROM return_gameweek 
									WHERE fixture_id = gf.fixture_id AND home_team = 1 
								) AS home_team,
								(SELECT team_fullname 
									FROM return_gameweek 
									WHERE fixture_id = gf.fixture_id AND away_team = 1
								) AS away_team
								FROM sbm_fixture AS f
								LEFT JOIN return_gameweek  AS gf ON (f.fixture_id = gf.fixture_id)
								LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id)");


		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>Game Week</th><th>Date</th><th>Home Team</th><th>Away Team</th><th>1</th><th>X</th><th>2</th></thead>");
		echo("<tbody>");

		while ($row=$m_db->Fetch($result))
		{
			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td>".$row['game_week']. "</td>");
			echo("<td>".$row['fixture_date']."</a</td>");
			echo("<td>".$row['home_team']."</td>");
			echo("<td>".$row['away_team']."</td>");
			echo("<td>".$row['odd_home']."</td>");
			echo("<td>".$row['odd_draw']."</td>");
			echo("<td>".$row['odd_away']."</td>");
			echo("<td><a href=\"#\">EDIT</a></td>");
			echo("<td><a href=\"#\">DELETE</a></td>");
			echo("</tr>");
			$counter++;
		}
		echo("</tbody></table>");
	}

}


?>