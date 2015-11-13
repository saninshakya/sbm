<?php

/*
dependencies
database.class.php
config.php
table_mystyle.css
*/

class fixture {

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
								LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id) ORDER BY f.fixture_id DESC");


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



	/////////////////////////////////////////////
	//For adding fixture
	/////////////////////////////////////////////
	function insert_fixture() {
		global $m_db;
		$rslt = $m_db->Query("INSERT INTO sbm_fixture (game_week, fixture_date, league_id) VALUES ('".$this->gameweek."' , '".$this->datetime."' , '".$this->league."')");
		if ($rslt > 0){
			$fixtureid =  mysql_insert_id();
			$rslthometeam = $m_db->Query("INSERT INTO sbm_team_fixture (team_id, fixture_id, home_team, away_team) VALUES ('".$this->hometeam."' , '".$fixtureid."' , '1', '0')");
			$rsltawayteam = $m_db->Query("INSERT INTO sbm_team_fixture (team_id, fixture_id, home_team, away_team) VALUES ('".$this->awayteam."' , '".$fixtureid."' , '0', '1')");

			$rsltweeklyodd = $m_db->Query("INSERT INTO sbm_weekly_odd (odd_home, odd_away, odd_draw, fixture_id) VALUES ('".$this->oddhome."' , '".$this->oddaway."' , '".$this->odddraw."' , '".$fixtureid."')");

			return "SUCCESS";
		}
		else
			return "ERROR";


	}

}


?>