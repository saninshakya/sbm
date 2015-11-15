<div class="container-fluid">
	<div class="row">

<?php
if (isset($_GET['action']))
	$action=$_GET['action'];
else
	$action="";
include("classes/fixture.class.php");
$oFixture=new fixture();
?>
	<div class="col-xs-12 col-sm-6 col-md-8 title">Fixture</div>
	<div class="col-xs-6 col-md-4 icons">
<?php
if (($action=='new') || ($action=='result'))
	{
?>
		<div class="cancel pull-right"><a href="home.php?page=fixture&action=cancel">Cancel</a></div><!--end delete-->
<?php
	}
else
	{
?>
		<div class="new pull-right"><a href="home.php?page=fixture&action=new">Add New Fixture</a></div><!--end new-->
<?php
	}
?>
		</div>
	</div>
</div>
<div class="content_desc">
<?php 
if(isset($_SESSION['message'])) //If message is set then display the message
{
	echo("<div class=\"message\">");
	echo($_SESSION['message']); 
	unset($_SESSION['message']);
	echo("</div>");
}
?>

<?php
	switch ($action)
	{
		case'new':
			include("fixture_new.inc.php");
			break;
		//end new case
		
		case 'delete':
			$oCategory->id=$_GET['id'];
			$check=$oCategory->delete_fixture();
			
				switch($check)
				{
					case 'SUCCESS':
						$_SESSION['message']="Category deleted successfully!";
						echo("<script>location.href='home.php?page=fixture'</script>");
						return;
						break;
						
					case 'TRY_AGAIN':
						$_SESSION['message']="Error occured while deleting. Try again.";
						echo("<script>location.href='home.php?page=fixture'</script>");
						return;
						break;
						
					default:
						$_SESSION['message']="Error occured while deleting. Try again.";
						echo("<script>location.href='home.php?page=fixture'</script>");
						return;
				}							
			break;
		//end delete case
		
		case 'result':
			include("fixture_result.inc.php");
			break;
		// end edit case
		
	 	 
		default :
			$oFixture->display_fixture();
		
}//end switch case
?>
</div><!--end content_desc-->