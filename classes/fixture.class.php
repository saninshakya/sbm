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
		echo("<div class=\"page-title\">".$row['league_name']."</div>");
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
								LEFT JOIN sbm_weekly_odd as wo ON (f.fixture_id=wo.fixture_id)
								WHERE f.league_id ='". $this->leagueid ."' ORDER BY f.fixture_id DESC");
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
			if (isset($_SESSION['sbm_user_id'])==""){ // case: Not login 
				echo("<td><button type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\">".$row['odd_home']."</button></td>");
				echo("<td><button type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\">".$row['odd_draw']."</button></td>");
				echo("<td><button type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\">".$row['odd_away']."</button></td>");
			}
			else{ //case: Already Login
				// To disable the past fixture
				$now = new DateTime(null, new DateTimeZone('Asia/Bangkok'));
				$date =  $now->format('Y-m-d H:i:s');
				$class = "";
				if ($row['fixture_date'] < $date)
					$class = "disabled=\"disabled\" class=\"btn-ds\""; 
				// check if user has already bid 
				$rslt = $m_db->Query("SELECT weekly_odd_id, user_id FROM sbm_user_weekly_bid WHERE weekly_odd_id = '".$row['weekly_odd_id']."' AND user_id = '".$_SESSION['sbm_user_id']."'");
				if ($m_db->countRows($rslt) > 0){
					echo("<td><button disabled=\"disabled\" type=\"button\" class=\"btn-ds\" class=\"btn btn-info btn-sm\">".$row['odd_home']."</button></td>");
					echo("<td><button disabled=\"disabled\" type=\"button\" class=\"btn-ds\" class=\"btn btn-info btn-sm\">".$row['odd_draw']."</button></td>");
					echo("<td><button disabled=\"disabled\" type=\"button\" class=\"btn-ds\" class=\"btn btn-info btn-sm\">".$row['odd_away']."</button></td>");
				}
				else{
					echo("<td><button ".$class." type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#bid\"  data-weeklyoddid=\"".$row['weekly_odd_id']."\" data-odd=\"oh\">".$row['odd_home']."</button></td>");
					echo("<td><button ".$class." type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#bid\"  data-weeklyoddid=\"".$row['weekly_odd_id']."\" data-odd=\"od\">".$row['odd_draw']."</button></td>");
					echo("<td><button ".$class." type=\"button\" class=\"btn btn-info btn-sm\" data-toggle=\"modal\" data-target=\"#bid\"  data-weeklyoddid=\"".$row['weekly_odd_id']."\" data-odd=\"oa\">".$row['odd_away']."</button></td>");
				}
			}
			
			echo("</tr>");
			$counter++;
		}
		echo("</tbody></table>");
		$_SESSION['currentURL']= "?page=fixture&leagueid=".$this->leagueid;
		
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