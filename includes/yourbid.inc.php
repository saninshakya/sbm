<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="page-title">Your BID History</div>
			<?php
			include("classes/bid.class.php");
			$obid = new bid();
			$obid->bidList();
			?>
		</div>
	</div>
</div>