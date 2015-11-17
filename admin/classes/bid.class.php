<?php

/*
dependencies
database.class.php
config.php
table_mystyle.css
*/

class bid {

	function bidList(){
		global $m_db;
        $rslt = $m_db->Query("SELECT  DISTINCT
    						ub.amount,
    						ub.bid_date,
    						ub.is_win,
    						ub.payoff, 
    						ub.odd_selection, 
    						wo.odd_home,
    						wo.odd_draw,
    						wo.odd_away,
    						gf.game_week,
    						gf.fixture_date,
    						(SELECT team_fullname 
								FROM return_gameweek 
								WHERE fixture_id = gf.fixture_id AND home_team = 1 
							) AS home_team,
							(SELECT team_fullname 
								FROM return_gameweek 
								WHERE fixture_id = gf.fixture_id AND away_team = 1
							) AS away_team,
                            l.league_name,
                            u.firstname,
                            u.lastname
        					FROM sbm_user_weekly_bid AS ub
    						LEFT JOIN sbm_weekly_odd AS wo ON (ub.weekly_odd_id = wo.weekly_odd_id)
    						LEFT JOIN return_gameweek  AS gf ON (wo.fixture_id = gf.fixture_id)
                            LEFT JOIN sbm_fixture AS f ON (wo.fixture_id = f.fixture_id)
                            LEFT JOIN sbm_league AS l ON (f.league_id = l.league_id)
                            LEFT JOIN sbm_user AS u ON (ub.user_id = u.user_id)
                            ");

        echo("<table class=\"table table-striped\">");
		echo("<thead><tr><th>S.No</th><th>Game Week</th><th>League</th><th>Game Date</th><th>Home Team</th><th>Away Team</th><th>Bid Date</th><th>User</th><th>Odd</th><th>Amount (USD)</th><th>Pay Off (USD)</th><th>Is Win</th></thead>");
		echo("<tbody>");
		$counter = 1;
		setlocale(LC_MONETARY,"THB");
		$total_bid = $total_payoff = 0.00;
		while ($row=$m_db->Fetch($rslt)){
			echo("<tr>");
			echo("<td>".$counter."</td>");
			echo("<td>".$row['game_week']. "</td>");
			echo("<td>".$row['league_name']. "</td>");
			echo("<td>".$row['fixture_date']. "</a</td>");
			echo("<td>".$row['home_team']. "</td>");
			echo("<td>".$row['away_team']. "</td>");
			echo("<td>".$row['bid_date']. "</td>");
			echo("<td>".$row['firstname']. " " .$row['lastname'] . "</td>");

			if ($row['odd_selection'] == "oh")
				echo("<td>HOME: ".$row['odd_home']. "</td>");
			else if ($row['odd_selection'] == "od")
				echo("<td>DRAW: ".$row['odd_draw']. "</td>");
			else if ($row['odd_selection'] == "oa")
				echo("<td>AWAY: ".$row['odd_away']. "</td>");

			echo("<td>".$row['amount']. "</td>");
			echo("<td>".$row['payoff']. "</td>");

			if (is_null($row['is_win'])){
				echo("<td class=\"result-wait\">Waiting For Result</td>");
				$total_bid = $total_bid + $row['amount'];
			}
			elseif ($row['is_win'] == 0){
				echo("<td class=\"win-no\">No</td>");
				$total_bid = $total_bid + $row['amount'];
			}
			elseif ($row['is_win'] == 1){
				echo("<td class=\"win-yes\">YES</td>");
				$total_bid = $total_bid + $row['amount'];
				$total_payoff = $total_payoff + $row['payoff'];
			}
			
			echo("</tr>");
			$counter++;
		}
		echo("<tr><td colspan=\"10\" style=\"text-align:right\">Total Bid: </td><td colspan=\"2\">".number_format($total_bid,2)." USD</td></tr>");
		echo("<tr><td colspan=\"10\" style=\"text-align:right\">Total Pay Off: </td><td colspan=\"2\">".number_format($total_payoff,2)." USD</td></tr>");
		echo("</tbody></table>");
		// $win=1.99;
		// $loss = 2.95;
		// echo(number_format($win+$loss,2));
	}


}