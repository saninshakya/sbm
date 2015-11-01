<?php
// to get the league name 
	include("classes/league.class.php");
	$oLeague = new league();
	$oLeague->id = $_GET['leagueid'];
?>
	<div class="league-title"><?php $oLeague->leagueName(); ?> </div>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<?php
				include("classes/team.class.php");
				$oTeam = new team();
				$oTeam->leagueid = $_GET['leagueid'];
				$oTeam->season = date("Y");
				$oTeam->teamStandingFull();
			?>
			</div>

		</div><!-- end col-md-12 -->
	</div><!--end row -->
</div><!-- end container -->