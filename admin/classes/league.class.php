<?php

/*
  dependencies
  database.class.php
  config.php
  mystyle.css
  for user registration
 */

class league {

    function leagueName() {
        global $m_db;
        $league_list = array();
        $rslt = $m_db->Query("SELECT league_id,league_name FROM sbm_league");
        while ($row = $m_db->Fetch($rslt)) {
            $key = $row['league_id'];
            $value = $row['league_name'];
            $league_list[$key] = $value;
            // array_push($league_list[$key],$value);
        }
        return $league_list;
    }

}

?>