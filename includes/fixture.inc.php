<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
	<?php
	include("classes/fixture.class.php");
	$oFixture=new fixture();
	// if (isset($_GET['leagueid'])!=""){
	// 	$oFixture->leagueid = $_GET['leagueid'];
	// 	// Get list of gameweek
	// 	// $gameWeek=$oFixture->getGameWeekList();
	// }
	?>
		<!-- <div class="gameweek-filter pull-right">
		    <div class="form-group">
		      <label for="gameweek">GameWeek:</label>
		      <select class="form-control" name="gameweek" id="gameweek" >
		      	<?php
			  	// foreach($gameWeek as $x => $x_value) 
			  	// 	echo("<option value='".$x_value."'>".$x_value."</option>");
			  	?>
		      </select>
		    </div>
		</div> -->
	<?php
	 
	// echo "Current week range from $this_week_sd to $this_week_ed ";
	// if (!empty($_POST)) {
	// 	$data = @$_POST;
	// 	$oFixture->gameweek = $data['gameweek'];
	//     $oFixture->filterFixtureList();
	// }
	// else {
		if (isset($_GET['leagueid'])!=""){
			$oFixture->leagueid = $_GET['leagueid'];
			// To display list of gameweek of this week of certain league
			// To get this week date range
			// $sunday = strtotime("last sunday");
			// $sunday = date('w', $sunday)==date('w') ? $sunday+7*86400 : $sunday; 
			// $saturday = strtotime(date("Y-m-d",$sunday)." +6 days"); 
			// $this_week_sd = date("Y-m-d",$sunday);
			// $this_week_ed = date("Y-m-d",$saturday);
			// $oFixture->week_sd = $this_week_sd;
			// $oFixture->week_ed = $this_week_ed;
			$oFixture->fixtureList();
		}
	// }

	?>
	</div><!-- end col-xs-12 col-sm-6 col-md-8 -->
		<div class="col-md-2">
			<div class="team-standing">
			<!-- For team standing -->
            <div class="small-page-title">Team Standing</div>
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


<div class="container">
  <!-- Modal LoginInfo -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Request</h4>
        </div>
        <div class="modal-body">
          <p>Please Login Before You continue.!!</p>
        </div>
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
		<a href="index.php?page=login" type="button" class="btn btn-default">OK</a>
        </div>
      </div>
      
    </div>
  </div>

    <!-- Modal Bid -->
  <div class="modal fade" id="bid" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Soccer BetWay Management</h4>
        </div>
        <div class="modal-body">
        	<script>
				$('#bid').on('show.bs.modal', function(e) {
					var weekly_odd_id = e.relatedTarget.dataset.weeklyoddid;
					var odd = e.relatedTarget.dataset.odd;
					$('#odd').val(odd);
					$('#weeklyoddid').val(weekly_odd_id);
					 // var dataArray = [],
					 // weekly_odd_id = e.relatedTarget.dataset.weeklyoddid,
					 // odd = e.relatedTarget.dataset.odd;
					 // dataArray.push(weekly_odd_id);  
					 // dataArray.push(odd);
					 // var data = JSON.stringify(dataArray);
					 // console.log('dataArray', data);
					});

			</script>
            <form class="form-horizontal" id="defaultForm" method="post" action="<?php echo($_SERVER['PHP_SELF'] . "?page=bid"); ?>">
                <div class="form-group">
                    <label for="bid-amount" class="col-md-3 control-label">Bid Amount*</label>
                    <div class="col-md-9">
                        <input type="text" id="amount" class="form-control" name="amount" placeholder="Amount in USD">
                        <span class="error"><?php echo($oForm->Error("bid")); ?></span>
                    </div>
                    <input type="hidden" id="odd" class="form-control" name="odd">
                    <input type="hidden" id="weeklyoddid" class="form-control" name="weeklyoddid">
                </div>
                <div style="margin-top:10px" class="form-group">
                    <div class="col-sm-12 controls">
            		<input type="submit" class="btn btn-default pull-right" name="bid-submit" value="BID NOW">
            		</div>
            	</div>
            </form>
        </div>
      </div>
    </div>
  </div>


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
