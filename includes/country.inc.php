			<?php
			include("classes/country.class.php");
			$oCountry = new country();
			$oCountry->continent= $_GET['continent'];
			$oCountry->countryList();
			?>
		<div class="col-sm-9">
			<?php
			// Default League of England
			include("classes/league.class.php");
			$oLeague = new league();
			$country = $oCountry->getCountry();
			$oLeague->country= $country;
			$oLeague->leagueList();

			?>
		</div>
<!-- 	</div>
</div> -->