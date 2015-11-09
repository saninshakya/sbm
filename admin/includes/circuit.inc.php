<?php
switch ($page)
{
	case 'logout':
		include("includes/logout.inc.php");
		break;

	case 'fixture':
		include("includes/fixture.inc.php");
		break;

	case 'bidding':
		include("includes/biding.inc.php");
		break;

	default:
		include("includes/main.inc.php");
		break;
}

?>