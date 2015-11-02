<?php
// session_start();
include("classes/bid.class.php");
$obid=new bid();
if (isset($_POST['bid-submit'])){
	$obid->amount = $_POST['amount'];
	$obid->odd = $_POST['odd'];
	$obid->weeklyoddid = $_POST['weeklyoddid'];
	switch($obid->userweeklybid())
	{
		case 'SUCCESS':
			$_SESSION['success_message']="Your Bid has been Successfully Place. Thank you.";
			echo ("<script type=\"text/javascript\">window.location=\"index.php?page=bid\"</script>");
			break;
                    
        case 'TRY_AGAIN':
            $_SESSION['error_message']="Error Occured Please Try Again Later!";
            echo ("<script type=\"text/javascript\">window.location=\"index.php?page=bid\"</script>");
            break;

        default:
            $_SESSION['error_message']="Error Occured Please Try Again Later!";
            echo ("<script type=\"text/javascript\">window.location=\"index.php?page=bid\"</script>");
            break;

	}
}

?>

