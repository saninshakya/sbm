<?php
include("classes/league.class.php");
?>
    <form class="form-horizontal" method="post" action="<?php echo($_SERVER['PHP_SELF']."?page=login"); ?>">
        <div class="form-group">
          <label for="fixture" class="col-xs-2 control-label">Date Time:</label>
            <div class="col-xs-6">
                      <div id="datetimepicker2" class="input-append">
                      <input data-format="MM/dd/yyyy HH:mm:ss PP" type="text"></input>
                      <span class="add-on">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                      </span>
                    </div>
                  <script type="text/javascript">
                    $(function() {
                      $('#datetimepicker2').datetimepicker({
                        language: 'en',
                        pick12HourFormat: true
                      });
                    });
                  </script>  
              <span class="error"><?php echo($oForm->Error("date")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="gameweek" class="col-xs-2 control-label">GameWeek *</label>
            <div class="col-xs-9">
                <select class="form-control" name="gameweek">
                  <option value="">-- Select GameWeek --</option>
                  <option value="Gameweek1">GameWeek 1</option>
                  <option value="Gameweek2">GameWeek 2</option>
                  <option value="Gameweek3">GameWeek 3</option>
                  <option value="Gameweek4">GameWeek 4</option>
                  <option value="Gameweek5">GameWeek 5</option>
                  <option value="Gameweek6">GameWeek 5</option>
                  <option value="Gameweek7">GameWeek 5</option>
                  <option value="Gameweek8">GameWeek 5</option>
                  <option value="Gameweek8">GameWeek 5</option>
                  <option value="Gameweek10">GameWeek 5</option>
                  <option value="Gameweek11">GameWeek 5</option>
                  <option value="Gameweek12">GameWeek 5</option>
                  <option value="Gameweek13">GameWeek 5</option>
                  <option value="Gameweek14">GameWeek 5</option>
                  <option value="Gameweek15">GameWeek 5</option>
                  <option value="Gameweek16">GameWeek 5</option>
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
                <select class="form-control" name="home" id="hometeam">
                  <option value="">-- Select Team --</option>
                </select>
                <span class="error"><?php echo($oForm->Error("home")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="away" class="col-xs-2 control-label">Away Team *</label>
            <div class="col-xs-9">
                <select class="form-control" name="away" id="awayteam">
                  <option value="">-- Select Team --</option>
                </select>
                <span class="error"><?php echo($oForm->Error("away")); ?></span>
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

            <div class="col-sm-12 controls">
              <!-- <a id="btn-login" href="#" class="btn btn-success">Login  </a> -->
              <input type="submit" name="save" value="SAVE" class="btn btn-success" />
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
   