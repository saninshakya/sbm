<?php
	include("classes/team.class.php");
	$oTeam = new team();
	$oTeam->id = $_GET['teamid'];
?>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<hr>
				<p class = "active-tab"><strong>Active Tab</strong>: <span></span></p>
				<p class = "previous-tab"><strong>Previous Tab</strong>: <span></span></p>
				<hr>

				<ul id = "myTab" class = "nav nav-tabs">
				   <li class = "active"><a href = "#overview" data-toggle = "tab">OVERVIEW</a></li>
				   <li><a href = "#squad" data-toggle = "tab">SQUAD</a></li>
				</ul>

				<div id = "myTabContent" class = "tab-content">

				   <div class = "tab-pane fade in active" id = "overview">
					   	<div class="container-fluid">
							<div class="row">
							  <div class="col-xs-6">
							  		League Position
							  		<?php
							  		$oTeam->teamLeaguePosition();
							  		?>
							  		<a href="index.php?page=team-position&leagueid=<?php echo($_GET['leagueid']); ?>">Full League Table</a>

							  </div>
							  <div class="col-xs-6">.col-xs-6</div>
							</div>
						</div>
				   </div>
				   
				   <div class = "tab-pane fade" id = "squad">
				      <?php
				      $oTeam->teamMembers();
				      ?>
				   </div>
				  
				</div>
		
		</div><!-- end col-md-12 -->
	</div><!--end row -->
</div><!-- end container -->

<script>
   $(function(){
      $('a[data-toggle = "tab"]').on('shown.bs.tab', function (e) {
         // Get the name of active tab
         var activeTab = $(e.target).text(); 
         
         // Get the name of previous tab
         var previousTab = $(e.relatedTarget).text(); 
         
         $(".active-tab span").html(activeTab);
         $(".previous-tab span").html(previousTab);
      });
   });
</script>