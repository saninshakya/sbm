    <form class="form-horizontal" method="post" action="<?php echo($_SERVER['PHP_SELF']."?page=login"); ?>">
        <div class="form-group">
            <label for="date" class="col-xs-2 control-label">Fixture Date *</label>
            <div class="col-xs-9">
                <input type="text" id="date" class="form-control" name="date">
                <span class="error"><?php echo($oForm->Error("date")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="gameweek" class="col-xs-2 control-label">GameWeek *</label>
            <div class="col-xs-9">
                <select class="form-control" name="gameweek">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
                <span class="error"><?php echo($oForm->Error("gameweek")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="hometeam" class="col-xs-2 control-label">Home Team *</label>
            <div class="col-xs-9">
                <select class="form-control" name="hometeam">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
                <span class="error"><?php echo($oForm->Error("hometeam")); ?></span>
            </div>
        </div>
        <div class="form-group">
            <label for="awayteam" class="col-xs-2 control-label">Away Team *</label>
            <div class="col-xs-9">
                <select class="form-control" name="awayteam">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
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

            <div class="col-sm-12 controls">
              <!-- <a id="btn-login" href="#" class="btn btn-success">Login  </a> -->
              <input type="submit" name="save" value="SAVE" class="btn btn-success" />
              <!-- <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->

            </div>
        </div>
    </form>
