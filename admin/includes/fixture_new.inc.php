<?php
include("classes/league.class.php");
if (isset($_POST['save']))
{
    $oFixture = new fixture();
    $oFixture->datetime = $_POST['datetimepicker2'];
    $oFixture->gameweek = $_POST['gameweek'];
    $oFixture->league = $_POST['league'];
    $oFixture->hometeam = $_POST['hometeam'];
    $oFixture->awayteam = $_POST['awayteam'];
    $oFixture->oddhome = $_POST['oddhome'];
    $oFixture->odddraw = $_POST['odddraw'];
    $oFixture->oddaway = $_POST['oddaway'];
    switch($oFixture->insert_fixture())
    {
        case 'SUCCESS':
            $_SESSION['success_message']="Fixture Added Successfully!";
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
    <form class="form-horizontal" method="post" action="<?php echo($_SERVER['PHP_SELF']."?page=fixture&action=new"); ?>">
        <div class="form-group">
          <label for="fixture" class="col-xs-2 control-label">Date Time:</label>
            <div class="col-xs-6">
                      <div id="datetimepicker2" class="input-append">
                      <input data-format="yyyy-MM-dd HH:mm:ss" type="text" name="datetimepicker2"></input>
                      <span class="add-on">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                      </span>
                    </div>
                  <script type="text/javascript">
                    $(function() {
                      $('#datetimepicker2').datetimepicker({
                        language: 'en',
                        pick12HourFormat: false
                      });
                    });
                  </script>  
              <span class="error"><?php echo($oForm->Error("date")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="gameweek" class="col-xs-2 control-label">GameWeek *</label>
            <div class="col-xs-9">
                <select class="form-control" name="gameweek" id ="gameweek">
                  <option value="">-- Select GameWeek --</option>
                  <option value="Gameweek1">GameWeek 1</option>
                  <option value="Gameweek2">GameWeek 2</option>
                  <option value="Gameweek3">GameWeek 3</option>
                  <option value="Gameweek4">GameWeek 4</option>
                  <option value="Gameweek5">GameWeek 5</option>
                  <option value="Gameweek6">GameWeek 6</option>
                  <option value="Gameweek7">GameWeek 7</option>
                  <option value="Gameweek8">GameWeek 8</option>
                  <option value="Gameweek8">GameWeek 9</option>
                  <option value="Gameweek10">GameWeek 10</option>
                  <option value="Gameweek11">GameWeek 11</option>
                  <option value="Gameweek12">GameWeek 12</option>
                  <option value="Gameweek13">GameWeek 13</option>
                  <option value="Gameweek14">GameWeek 14</option>
                  <option value="Gameweek15">GameWeek 15</option>
                  <option value="Gameweek16">GameWeek 16</option>
                </select>
                <span class="error"><?php echo($oForm->Error("gameweek")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="league" class="col-xs-2 control-label">League *</label>
            <div class="col-xs-9">
                <select class="form-control" name="league"  onchange="getTeam(this.value)">
                  <option value="">-- Select League --</option>
                  <?php 
                  $oLeague = new league();
                  $league = $oLeague->leagueName();
                  foreach($league as $key => $values) 
                    foreach($values as $value)
                      echo("<option value='".$key."'>".$value."</option>");
                    
                  ?>
                </select>
                <span class="error"><?php echo($oForm->Error("league")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="home" class="col-xs-2 control-label">Home Team *</label>
            <div class="col-xs-9">
                <select class="form-control" name="hometeam" id="hometeam">
                  <option value="">-- Select Team --</option>
                </select>
                <span class="error"><?php echo($oForm->Error("hometeam")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="away" class="col-xs-2 control-label">Away Team *</label>
            <div class="col-xs-9">
                <select class="form-control" name="awayteam" id="awayteam">
                  <option value="">-- Select Team --</option>
                </select>
                <span class="error"><?php echo($oForm->Error("awayteam")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="oddhome" class="col-xs-2 control-label">Odd Home *</label>
            <div class="col-xs-9">
                <input type="text" id="oddhome" class="form-control" name="oddhome" >
                <span class="error"><?php echo($oForm->Error("oddhome")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="odddraw" class="col-xs-2 control-label">Odd Draw *</label>
            <div class="col-xs-9">
                <input type="text" id="odddraw" class="form-control" name="odddraw" >
                <span class="error"><?php echo($oForm->Error("odddraw")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="oddaway" class="col-xs-2 control-label">Odd Away *</label>
            <div class="col-xs-9">
                <input type="text" id="oddaway" class="form-control" name="oddaway" >
                <span class="error"><?php echo($oForm->Error("oddaway")); ?></span>
            </div>
        </div>
                

        <div style="margin-top:10px" class="form-group">
            <!-- Button -->

            <div class="col-sm-11 controls">
              <!-- <a id="btn-login" href="#" class="btn btn-success">Login  </a> -->
              <input type="submit" name="save" value="SAVE" class="btn btn-success pull-right" />
              <!-- <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->

            </div>
        </div>
    </form>


<script  type="text/javascript">
function getTeam(val) {
  // alert(val);
  $.ajax({
  type: "POST",
  url: "bizLayer/get_Team.php",
  data:'league_id='+val,
  success: function(data){
    // alert(data);
    $("#hometeam").html(data);
    $("#awayteam").html(data);
  }
  });
}

</script>
 
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.pt-BR.js"></script>
   