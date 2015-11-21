<?php
$id = $oFixture->id = $_GET['id'];
$oFixture->fixture_detail();
$hometeam = $_GET['hometeam'];
$awayteam = $_GET['awayteam'];
if (isset($_POST['save']))
{
	$oFixture->hometeamid = $_GET['hometeam'];
	$oFixture->awayteamid = $_GET['awayteam'];
	$oFixture->home_goalscore = $_POST['home_goalscore'];
	$oFixture->home_redcard = $_POST['home_redcard'];
	$oFixture->home_yellowcard = $_POST['home_yellowcard'];
	$oFixture->home_result = $_POST['home_result'];
	$oFixture->away_goalscore = $_POST['away_goalscore'];
	$oFixture->away_redcard = $_POST['away_redcard'];
	$oFixture->away_yellowcard = $_POST['away_yellowcard'];
	$oFixture->away_result = $_POST['away_result'];
    switch($oFixture->insert_fixture_result())
    {
        case 'SUCCESS':
            $_SESSION['success_message']="Fixture Result Added Successfully!";
            echo ("<script type=\"text/javascript\">window.location=\"home.php?page=fixture\"</script>");
            break;
                    
        case 'ERROR':
            $_SESSION['error_message']="Error Occured. Please Try Again!";
            echo ("<script type=\"text/javascript\">window.location=\"home.php?page=fixture\"</script>");
            break;
            
        // case 'FILL_THIS_FIELD':
        //     if ($oLogin->user=="")
        //         $oForm->setError('username','Please Fill the Username');
        //     elseif ($oLogin->pass=="")
        //         $oForm->setError('password','Please Fill the Password');
        //     break;
            
        default:
            $_SESSION['error_message']="Error Occured. Please Try Again!";
            echo ("<script type=\"text/javascript\">window.location=\"home.php?page=fixture\"</script>");
    }
}
?>
<div class="small-page-title">Add Result</div>

<form style="width:90%;" class="form-horizontal" method="post" action="<?php echo($_SERVER['PHP_SELF']."?page=fixture&action=result&id=$id&hometeam=$hometeam&awayteam=$awayteam"); ?>">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Home Team</h3>
		</div>
		<div class="panel-body">
			<div class="form-group">
	            <label for="home_goalscore" class="col-xs-2 control-label">Goal Score *</label>
	            <div class="col-xs-9">
	                <input type="text" id="home_goalscore" class="form-control" name="home_goalscore" >
	                <span class="error"><?php echo($oForm->Error("home_goalscore")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="home_redcard" class="col-xs-2 control-label">Red Card</label>
	            <div class="col-xs-9">
	                <input type="text" id="home_redcard" class="form-control" name="home_redcard" >
	                <span class="error"><?php echo($oForm->Error("home_redcard")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="home_yellowcard" class="col-xs-2 control-label">Yellow Card</label>
	            <div class="col-xs-9">
	                <input type="text" id="home_yellowcard" class="form-control" name="home_yellowcard" >
	                <span class="error"><?php echo($oForm->Error("home_yellowcard")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="home_result" class="col-xs-2 control-label">Result *</label>
	            <div class="col-xs-9">
					<select class="form-control" name="home_result" id ="home_result">
					<option value="">-- Select Result --</option>
					<option value="w">Win</option>
					<option value="d">Draw</option>
					<option value="l">Loss</option>
					</select>
	                <span class="error"><?php echo($oForm->Error("home_result")); ?></span>
	            </div>
	        </div>
		</div>
		<br/>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Away Team</h3>
		</div>
		<div class="panel-body">
			<div class="form-group">
	            <label for="away_goalscore" class="col-xs-2 control-label">Goal Score *</label>
	            <div class="col-xs-9">
	                <input type="text" id="away_goalscore" class="form-control" name="away_goalscore" >
	                <span class="error"><?php echo($oForm->Error("away_goalscore")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="away_redcard" class="col-xs-2 control-label">Red Card</label>
	            <div class="col-xs-9">
	                <input type="text" id="away_redcard" class="form-control" name="away_redcard" >
	                <span class="error"><?php echo($oForm->Error("away_redcard")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="away_yellowcard" class="col-xs-2 control-label">Yellow Card</label>
	            <div class="col-xs-9">
	                <input type="text" id="away_yellowcard" class="form-control" name="away_yellowcard" >
	                <span class="error"><?php echo($oForm->Error("away_yellowcard")); ?></span>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="away_result" class="col-xs-2 control-label">Result *</label>
	            <div class="col-xs-9">
					<select class="form-control" name="away_result" id ="away_result">
					<option value="">-- Select Result --</option>
					<option value="w">Win</option>
					<option value="d">Draw</option>
					<option value="l">Loss</option>
					</select>
	                <span class="error"><?php echo($oForm->Error("away_result")); ?></span>
	            </div>
	        </div>
		</div>
	</div>
    <div style="margin-top:10px" class="form-group">
        <div class="col-sm-12 controls">
          <input type="submit" name="save" value="SAVE" class="btn btn-success pull-right" />
        </div>
    </div>
</form>
