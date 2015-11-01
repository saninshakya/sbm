<?php
/*
dependencies
database.class.php
config.php
mystyle.css
for user registration
*/
class team
{
	function teamStanding(){
		global $m_db;
		$result = $m_db->Query("SELECT 
								ts.total_pts AS pts, 
								ts.total_match_played AS pld, 
								ts.total_goal_score - ts.total_goal_concede AS GD, 
								ts.team_id AS id,
								t.team_fullname AS name
								FROM 
								sbm_team_standing as ts 
								LEFT JOIN sbm_team as t ON (ts.team_id = t.team_id) 
								WHERE t.league_id =".$this->leagueid." AND ts.season=".$this->season." 
								ORDER BY pts DESC, GD DESC");

		echo("<table class=\"table table-bordered\">");
		echo("<thead><tr><th>CLUB</th><th>Pld</th><th>Pts</th></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result)){
			echo("<tr>");
			echo("<td><a href=\"index.php?page=team-info&teamid=".$row['id']."&leagueid=".$this->leagueid."\">".$row['name']. "</a></td>");
			echo("<td>".$row['pld']. "</td>");
			echo("<td>".$row['pts']. "</td>");
			echo("</tr>");
		}
		echo("</tbody></table>");
	}

	function teamStandingFull(){
		global $m_db;
		$counter = 1;
		$result = $m_db->Query("SELECT ts.*, ts.total_goal_score - ts.total_goal_concede AS GD, t.team_fullname AS name
								FROM 
								sbm_team_standing as ts 
								LEFT JOIN sbm_team as t ON (ts.team_id = t.team_id) 
								WHERE t.league_id =".$this->leagueid." AND ts.season=".$this->season." 
								ORDER BY ts.total_pts DESC, GD DESC");

		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>POS</th><th>CLUB</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"PLAYED\">P</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"WIN\">W</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"DRAW\">D</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"LOST\">L</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"RED CARD\">RC</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"YELLOW CARD\">YC</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"GOALS FOR\">GF</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"GOAL AGAINST\">GA</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"GOAL DIFFERENCE\">GD</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"POINTS\">PTS</th></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result)){
			echo("<tr>");
			echo("<td>".$counter. "</td>");
			echo("<td>".$row['name']. "</td>");
			echo("<td>".$row['total_match_played']. "</td>");
			echo("<td>".$row['total_win']. "</td>");
			echo("<td>".$row['total_draw']. "</td>");
			echo("<td>".$row['total_loss']. "</td>");
			echo("<td>".$row['total_red_card']. "</td>");
			echo("<td>".$row['total_yellow_card']. "</td>");
			echo("<td>".$row['total_goal_score']. "</td>");
			echo("<td>".$row['total_goal_concede']. "</td>");
			echo("<td>".$row['GD']. "</td>");
			echo("<td>".$row['total_pts']. "</td>");
			echo("</tr>");
			$counter++;
		}
		
		echo("</tbody></table>");
	}


	function teamMembers(){
		global $m_db;
		$result = $m_db->Query("SELECT * FROM sbm_player WHERE team_id=".$this->id);
		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>Squad Member</th><th>Position</th><th>DOB</th><th>Contact From</th><th>Contract Till</th><th>Shirt Number</th><th>Status</th></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result)){
			echo("<tr>");
			echo("<td>".$row['player_firstname']. " ". $row['player_lastname']. "</td>");
			echo("<td>".$row['position']. "</td>");
			echo("<td>".$row['player_dob']. "</td>");
			echo("<td>".$row['contract_start_date']. "</td>");
			echo("<td>".$row['contract_end_date']. "</td>");
			echo("<td>".$row['player_shirt_no']. "</td>");
			echo("<td>".$row['status']. "</td>");
			echo("</tr>");
		}
	}

	function teamCoach(){
		global $m_db;
		$result = $m_db->Query("SELECT CONCAT(firstname,lastname) AS fullname, nationality FROM sbm_team_coach WHERE team_id=".$this->id);
		$row=$m_db->Fetch($result);
		echo("Coach Name:<b>".$row['fullname']."</b>&nbsp;&nbsp;&nbsp;&nbsp;Nationality:<b>". $row['nationality']."</b>");
	}


	function teamLeaguePosition(){
		global $m_db;
		$result = $m_db->Query("SELECT 
								*, ts.total_goal_score - ts.total_goal_concede AS GD
								FROM 
								sbm_team_standing as ts 
								WHERE ts.team_id = ".$this->id);

		echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>POS</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"PLAYED\">P</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"WIN\">W</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"DRAW\">D</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"LOST\">L</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"GOAL DIFFERENCE\">GD</th><th data-container=\"body\" data-toggle=\"tooltip\" title=\"POINTS\">Pts</th></thead>");
		echo("<tbody>");
		while ($row=$m_db->Fetch($result)){
			echo("<tr>");
			echo("<td></td>");
			echo("<td>".$row['total_match_played']. "</td>");
			echo("<td>".$row['total_win']. "</td>");
			echo("<td>".$row['total_draw']. "</td>");
			echo("<td>".$row['total_loss']. "</td>");
			echo("<td>".$row['GD']. "</td>");
			echo("<td>".$row['total_pts']. "</td>");
			echo("</tr>");
		}
		echo("</tbody></table>");
	}

	function teamName(){
		global $m_db;
		$result = $m_db->Query("SELECT team_fullname FROM sbm_team WHERE team_id=".$this->id);
		$row=$m_db->Fetch($result);
		echo($row['team_fullname']);
	}

	function teamLastResults(){

	}

}