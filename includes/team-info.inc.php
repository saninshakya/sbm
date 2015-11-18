<?php
// to get the name of team
	include("classes/team.class.php");
	$oTeam = new team();
	$oTeam->teamid = $_GET['teamid'];
?>
	<div style="margin-left:10px;" class="page-title"><?php $oTeam->teamName(); ?></div>
<?php
// to get the league name 
	include("classes/league.class.php");
	$oLeague = new league();
	$oLeague->leagueid = $_GET['leagueid'];
?>
	<div style="margin-left:10px;" class="small-page-title"><?php $oLeague->leagueName(); ?> </div>

<div class="container-fluid">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#squad">Squad Info</a></li>
		<li><a href="#league">League Info</a></li>
	</ul>

	<div class="tab-content">
		<div id="squad" class="tab-pane fade in active">
			<div class="col-xs-8">
				<div class="coach-info">
					<?php $oTeam->teamCoach($_GET['teamid']);  ?>
				</div>
					<?php $oTeam->teamMembers($_GET['teamid']);   ?>
			</div>
		</div>
		<div id="league" class="tab-pane fade">
			<div class="col-xs-8">
				<div style="margin-top:15px;" class="small-page-title">League Position</div>
				<?php $oTeam->teamLeaguePosition();	?>
				<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">Full League Table</a>
				<br/><br/>
				<?php $oTeam->teamLastResults($_GET['teamid']); ?>
				<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">View All Club Results</a>
				<br/><br/>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
    $('.nav-tabs a').on('shown.bs.tab', function(event){
        var x = $(event.target).text();         // active tab
        var y = $(event.relatedTarget).text();  // previous tab
        $(".act span").text(x);
        $(".prev span").text(y);
    });
});
</script>



<!-- <div class="container-fluid">
	<div class="row">
		<div class="col-xs-6">
			<div class="coach-info">
				<?php $oTeam->teamCoach($_GET['teamid']);  ?>
			</div>
			<?php $oTeam->teamMembers($_GET['teamid']);   ?>
		</div>
		<div class="col-xs-6">
			League Position
			<?php $oTeam->teamLeaguePosition();	?>
			<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">Full League Table</a>
			<br/><br/>
			<?php $oTeam->teamLastResults($_GET['teamid']); ?>
			<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">View All Club Results</a>
			<br/><br/>
		</div>
	</div>
</div> -->



