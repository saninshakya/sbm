<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
	<?php
	include("classes/fixture.class.php");
	$oFixture=new fixture();
	if (isset($_GET['leagueid'])!=""){
		$oFixture->leagueid = $_GET['leagueid'];
		// Get list of gameweek
		$gameWeek=$oFixture->getGameWeekList();
	}
	?>
		<div class="gameweek-filter pull-right">
		    <div class="form-group">
		      <label for="gameweek">GameWeek:</label>
		      <select class="form-control" name="gameweek" id="gameweek" >
		      	<?php
			  	foreach($gameWeek as $x => $x_value) 
			  		echo("<option value='".$x_value."'>".$x_value."</option>");
			  	?>
		      </select>
		    </div>
		</div>
	<?php
	 
	// echo "Current week range from $this_week_sd to $this_week_ed ";
	if (!empty($_POST)) {
		$data = @$_POST;
		$oFixture->gameweek = $data['gameweek'];
	    $oFixture->filterFixtureList();
	}
	else {
		if (isset($_GET['leagueid'])!="") {
			// To display list of gameweek of this week of certain league
			// To get this week date range
			$sunday = strtotime("last sunday");
			$sunday = date('w', $sunday)==date('w') ? $sunday+7*86400 : $sunday; 
			$saturday = strtotime(date("Y-m-d",$sunday)." +6 days"); 
			$this_week_sd = date("Y-m-d",$sunday);
			$this_week_ed = date("Y-m-d",$saturday);
			$oFixture->week_sd = $this_week_sd;
			$oFixture->week_ed = $this_week_ed;
			$oFixture->fixtureList();
		}
	}

	?>
	</div><!-- end col-xs-12 col-sm-6 col-md-8 -->
		<div class="col-md-2">
			<div class="team-standing">
			<!-- For team standing -->
			Team standing
			<?php
				include("classes/team.class.php");
				$oTeam = new team();
				$oTeam->leagueid = $_GET['leagueid'];
				$oTeam->season = date("Y");
				$oTeam->teamStanding();
			?>
			</div>
			<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">View Full Table</a>
		</div><!-- end col-xs-6 col-md-4 -->
	</div><!--end row -->
</div><!-- end container -->




<script type="text/javascript">
	$(document).ready(function() {
		$('#gameweek').on('change', function() {
		  // alert( this.value ); // or $(this).val()
		   $.post('fixture.inc.php', this.value, function(data) {
           alert(data);
			});
		});


	});

    
</script>