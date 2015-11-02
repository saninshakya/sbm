<?php
switch ($page)
{
	case 'login':
		include("includes/login.inc.php");
		break;

	case 'register':
		include("includes/register.inc.php");
		break;

	case 'logout':
		include("includes/logout.inc.php");
		break;

	case 'country':
		include("includes/country.inc.php");
		break;

	case 'league':
		include("includes/league.inc.php");
		break;

	case 'fixture':
		include("includes/fixture.inc.php");
		break;

	case 'team-position':
		include("includes/team-standing.inc.php");
		break;

	case 'team-info':
		include("includes/team-info.inc.php");
		break;

	case 'bid':
		include("includes/bid.inc.php");
		break;
	
	default:
		include("includes/main.inc.php");
		break;
}

?>