<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class fixture
{
	var $leagueid;
	var $week_sd;
	var $week_ed;
	var $gameweek;

	///////////////////////////////////////////////////////
	//Dsiplay list of fixture of the league		///
	///////////////////////////////////////////////////////
	function fixtureList()
	{	
		global $m_db;
		$counter = 1;
		$league = $m_db->Query("SELECT league_name FROM sbm_league WHERE league_id='".$this->leagueid."'");
		$row=$m_db->Fetch($league);
		echo("<div class=\"league-title\">".$row['league_name']."</div>");
		// $result = $m_db->Query("SELECT f.*,
		// 						       t.team_fullname,
		// 						       tf.home_team,
		// 						       tf.away_team,
		// 						       wo.odd_home,
		// 						       wo.odd_draw,
		// 						       wo.odd_away
		// 						FROM sbm_fixture AS f
		// 						LEFT JOIN sbm_team_fixture AS tf ON (f.fixture_id=tf.fixture_id)
		// 						LEFT JOIN sbm_team as t ON(tf.team_id = t.team_id)
		// 						LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id) WHERE f.fixture_date BETWEEN '".$this->week_sd."' AND '".$this->week_ed."'");

		$result = $m_db->Query("SELECT DISTINCT f.fixture_id, 
												gf.fixture_id,
												gf.game_week,
												gf.fixture_date, 
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
								LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id) 
								WHERE gf.fixture_date BETWEEN '".$this->week_sd."' AND '".$this->week_ed."'");


		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>Game Week</th><th>Date</th><th>Home Team</th><th>Away Team</th><th>1</th><th>X</th><th>2</th></thead>");
		echo("<tbody>");


		while ($row=$m_db->Fetch($result))
		{

			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td>".$row['game_week']. "</td>");
			echo("<td>".$row['fixture_date']. "</a</td>");
			echo("<td>".$row['home_team']. "</td>");
			echo("<td>".$row['away_team']. "</td>");
			echo("<td>".$row['odd_home']. "</td>");
			echo("<td>".$row['odd_draw']. "</td>");
			echo("<td>".$row['odd_away']. "</td>");
			
			// echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['odd_home']. "</a></td>");
			// echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['odd_draw']. "</a></td>");
			// echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['odd_away']. "</a></td>");
			// 	echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['team_fullname']. "</a></td>");
			// }
			// 	echo("<td><a href=\"index.php?page=fixture&leagueid=". $row['league_id'] ."\">".$row['team_fullname']. "</a></td>");
			// }


			echo("</tr>");
			$counter++;
		}
		echo("</tbody></table>");
	}

	///////////////////////////////////////////////////////
	//Get Distinct game week of a league		///
	///////////////////////////////////////////////////////
	function getGameWeekList()
	{
		global $m_db;
		$gameWeekList = array();

		$rslt = $m_db->Query("SELECT DISTINCT game_week FROM sbm_fixture WHERE league_id='".$this->leagueid."'");
		while ($row=$m_db->Fetch($rslt))
		{
			array_push($gameWeekList,$row['game_week']);
		}
		return $gameWeekList;
	}

	function filterFixtureList()
	{
		global $m_db;
		$counter = 1;
		$league = $m_db->Query("SELECT league_name FROM sbm_league WHERE league_id='".$this->leagueid."'");
		$row=$m_db->Fetch($league);
		echo("<div class=\"league-title\">".$row['league_name']."</div>");
		$result = $m_db->Query("SELECT DISTINCT f.fixture_id, 
												gf.fixture_id,
												gf.game_week,
												gf.fixture_date, 
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
								LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id) 
								WHERE gf.game_week='".$this->gameweek."'");

		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>Game Week</th><th>Date</th><th>Home Team</th><th>Away Team</th><th>1</th><th>X</th><th>2</th></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result)){
			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td>".$row['game_week']. "</td>");
			echo("<td>".$row['fixture_date']. "</a</td>");
			echo("<td>".$row['home_team']. "</td>");
			echo("<td>".$row['away_team']. "</td>");
			echo("<td>".$row['odd_home']. "</td>");
			echo("<td>".$row['odd_draw']. "</td>");
			echo("<td>".$row['odd_away']. "</td>");
			echo("</tr>");
			$counter++;
		}
		echo("</tbody></table>");
	}
	
}

?>