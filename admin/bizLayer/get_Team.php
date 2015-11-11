<?php
require_once("../../config.php");
global $m_db;
if(!empty($_POST["league_id"])) {
	$results = $m_db->Query("SELECT team_id, team_fullname FROM sbm_team WHERE league_id = '" . $_POST["league_id"] . "'");
?>
	<option value="">-- Select Team --</option>
<?php
	while ($row=$m_db->Fetch($results)) {
?>
	<option value="<?php echo $row["team_id"]; ?>"><?php echo $row["team_fullname"]; ?></option>
<?php
	}
}
?>