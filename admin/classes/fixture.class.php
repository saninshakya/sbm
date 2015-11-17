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
								) AS away_team,
								(SELECT team_id 
									FROM return_gameweek 
									WHERE fixture_id = gf.fixture_id AND home_team = 1 
								) AS hometeamid,
								(SELECT team_id 
									FROM return_gameweek 
									WHERE fixture_id = gf.fixture_id AND away_team = 1
								) AS awayteamid,
								l.league_name
								FROM sbm_fixture AS f
								LEFT JOIN return_gameweek  AS gf ON (f.fixture_id = gf.fixture_id)
								LEFT JOIN sbm_weekly_odd AS wo ON (f.fixture_id=wo.fixture_id) 
								LEFT JOIN sbm_league AS l ON (f.league_id = l.league_id)
								ORDER BY f.fixture_id DESC");


		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>Game Week</th><th>Date</th><th>League</th><th>Home Team</th><th>Away Team</th><th>1</th><th>X</th><th>2</th><th>Game Result</th></thead>");
		echo("<tbody>");

		while ($row=$m_db->Fetch($result))
		{
			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td>".$row['game_week']. "</td>");
			echo("<td>".$row['fixture_date']."</td>");
			echo("<td>".$row['league_name']."</td>");
			echo("<td>".$row['home_team']."</td>");
			echo("<td>".$row['away_team']."</td>");
			echo("<td>".$row['odd_home']."</td>");
			echo("<td>".$row['odd_draw']."</td>");
			echo("<td>".$row['odd_away']."</td>");
			echo("<td><a href=\"home.php?page=fixture&action=result&id=".$row['fixture_id']."&hometeam=".$row['hometeamid']."&awayteam=".$row['awayteamid']."\">ADD RESULT</a></td>");
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
			$hometeamstatistics = $m_db->Query("INSERT INTO 
												sbm_team_statistics 
												(team_id, fixture_id, goal_score, goal_concede, red_card, yellow_card, result) 
												VALUES ('".$this->hometeam."' , '".$fixtureid."' , '', '', '', '', '')");
			$awayteamstatistics = $m_db->Query("INSERT INTO 
												sbm_team_statistics 
												(team_id, fixture_id, goal_score, goal_concede, red_card, yellow_card, result) 
												VALUES ('".$this->awayteam."' , '".$fixtureid."' , '', '', '', '', '')");
			return "SUCCESS";
		}
		else
			return "ERROR";
	}


	/////////////////////////////////////////////
	//For displaying fixture information in adding result page
	/////////////////////////////////////////////
	function fixture_detail()
	{
		global $m_db;
		$result = $m_db->Query("SELECT DISTINCT
									gf.game_week,
									gf.fixture_date,
									wo.weekly_odd_id,  
									wo.odd_home, 
									wo.odd_draw, 
									wo.odd_away,
								(SELECT team_fullname 
									FROM return_gameweek 
									WHERE fixture_id = $this->id AND home_team = 1 
								) AS home_team,
								(SELECT team_fullname 
									FROM return_gameweek 
									WHERE fixture_id = $this->id AND away_team = 1
								) AS away_team
								FROM return_gameweek  AS gf 
								LEFT JOIN sbm_weekly_odd AS wo ON (gf.fixture_id=wo.fixture_id) WHERE gf.fixture_id=$this->id");
		while ($row=$m_db->Fetch($result))
		{
			echo("GameWeek:".$row['game_week']. "<br/>");
			echo("Game Date:".$row['fixture_date']."<br/>");
			echo("Home Team:".$row['home_team']."<br/>");
			echo("Away Team:".$row['away_team']."<br/>");
			echo("Odd Home:".$row['odd_home']."<br/>");
			echo("Odd Draw:".$row['odd_draw']."<br/>");
			echo("Odd Away:".$row['odd_away']."<br/>");
		}
	}

	/////////////////////////////////////////////
	//For adding fixture  results 
	/////////////////////////////////////////////
	function insert_fixture_result(){
		global $m_db;
		//insert home team information in sbm_team_statitistics table
		$hometeam = $m_db->Query("UPDATE 
									sbm_team_statistics 
									SET
									goal_score = '".$this->home_goalscore."' ,  goal_concede = '".$this->away_goalscore."' , 
									red_card = '".$this->home_redcard."' ,  yellow_card = '".$this->home_yellowcard."' , 
									result = '".$this->home_result."' 
									WHERE team_id = '".$this->hometeamid."' and fixture_id = '".$this->id."'");
		// insert away team information
		$awayteam = $m_db->Query("UPDATE 
									sbm_team_statistics 
									SET
									goal_score = '".$this->away_goalscore."' ,  goal_concede = '".$this->home_goalscore."' , 
									red_card = '".$this->away_redcard."' ,  yellow_card = '".$this->away_yellowcard."' , 
									result = '".$this->away_result."' 
									WHERE team_id = '".$this->awayteamid."' and fixture_id = '".$this->id."'");
		if ($hometeam > 0 && $awayteam > 0){
			// update team standing for home team sbm_team_standing table
			$rslt = $m_db->Query("SELECT * FROM sbm_team_standing WHERE team_id='".$this->hometeamid."'");
			$row = $m_db->Fetch($rslt);
			$total_match_played = $row['total_match_played'] + 1;
			if ($this->home_result == "w"){
				$total_win = $row['total_win'] + 1;
				$total_pts = $row['total_pts'] + 3;
			}
			else
				$total_win = $row['total_win'];

			if ($this->home_result == "d"){
				$total_draw = $row['total_draw'] + 1;
				$total_pts = $row['total_pts'] + 1;
			}
			else
				$total_draw = $row['total_draw'];

			if ($this->home_result == "l"){
				$total_loss = $row['total_loss'] + 1;
				$total_pts = $row['total_pts'];
			}
			else
				$total_loss = $row['total_loss'];

			$total_red_card = $row['total_red_card'] + $this->home_redcard;
			$total_yellow_card = $row['total_yellow_card'] + $this->home_yellowcard;
			$total_goal_score = $row['total_goal_score'] + $this->home_goalscore;
			$total_goal_concede = $row['total_goal_concede'] + $this->away_goalscore;
			// $total_pts = $row['total_pts'];

			$update = $m_db->Query("UPDATE 
									sbm_team_standing 
									SET 
									season = '2015' , 
									total_match_played = '".$total_match_played."' , 
									total_win = '".$total_win."' , 
									total_draw = '".$total_draw."' , 
									total_loss = '".$total_loss."' ,
									total_red_card = '".$total_red_card."' ,
									total_yellow_card = '".$total_yellow_card."' ,
									total_pts = '".$total_pts."' ,
									total_goal_score = '".$total_goal_score."' ,
									total_goal_concede = '".$total_goal_concede."' 
									WHERE team_id = '".$this->hometeamid."'");

			// update team standing for away team
			$rslt = $m_db->Query("SELECT * FROM sbm_team_standing WHERE team_id='".$this->awayteamid."'");
			$row = $m_db->Fetch($rslt);
			$total_match_played = $row['total_match_played'] + 1;
			if ($this->away_result == "w")
				$total_win = $row['total_win'] + 1;
			else
				$total_win = $row['total_win'];

			if ($this->away_result == "d")
				$total_draw = $row['total_draw'] + 1;
			else
				$total_draw = $row['total_draw'];

			if ($this->away_result == "l")
				$total_loss = $row['total_loss'] + 1;
			else
				$total_loss = $row['total_loss'];

			$total_red_card = $row['total_red_card'] + $this->away_redcard;
			$total_yellow_card = $row['total_yellow_card'] + $this->away_yellowcard;
			$total_goal_score = $row['total_goal_score'] + $this->away_goalscore;
			$total_goal_concede = $row['total_goal_concede'] + $this->home_goalscore;
			$total_pts = $row['total_pts'];

			$update = $m_db->Query("UPDATE 
									sbm_team_standing 
									SET 
									season = '2015' , 
									total_match_played = '".$total_match_played."' , 
									total_win = '".$total_win."' , 
									total_draw = '".$total_draw."' , 
									total_loss = '".$total_loss."' ,
									total_red_card = '".$total_red_card."' ,
									total_yellow_card = '".$total_yellow_card."' ,
									total_pts = '".$total_pts."' ,
									total_goal_score = '".$total_goal_score."' ,
									total_goal_concede = '".$total_goal_concede."' 
									WHERE team_id = '".$this->awayteamid."'");

			// To update the bidding of users
			if ($this->home_result == "w"){
				$result = "oh";
				$odd = "o.odd_home";
			}
			elseif ($this->away_result == "w"){
				$result = "oa";
				$odd = "o.odd_away";
			}
			elseif ($this->home_result == "d" && $this->away_result == "d"){
				$result = "od";
				$odd = "o.odd_draw";
			}
			$updatebid = $m_db->Query("UPDATE
										sbm_user_weekly_bid AS b
										LEFT JOIN sbm_weekly_odd AS o ON b.weekly_odd_id = o.weekly_odd_id
										SET
										b.is_win = 1,
										b.payoff = b.amount * ".$odd."
										WHERE
										(o.fixture_id = '".$this->id."' AND b.odd_selection = '".$result."')");

			return "SUCCESS";
		}
		else
			return "ERROR";
	}


}


?>