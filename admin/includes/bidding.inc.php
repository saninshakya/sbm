<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12 title">Weekly ODD Bid</div>
	</div>
</div>
<?php
// session_start();
include("classes/bid.class.php");
$oBid = new bid();
$oBid->bidlist();

?>
