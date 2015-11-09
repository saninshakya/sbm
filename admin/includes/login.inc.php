<?php
// session_start();
include("classes/user.class.php");
$oLogin=new user();
// for user login
if (isset($_POST['login']))
{
    $oLogin->user = $_POST['username'];
    $oLogin->pass= $_POST['password'];
    switch($oLogin->check_user())
    {
        case 'SUCCESS':
            $_SESSION['success_message']="Login Successfully!";
            echo ("<script type=\"text/javascript\">window.location=\"index.php\"</script>");
            break;
                    
        case 'INVALID':
            $_SESSION['error_message']="Invalid Username / Password!";
            echo ("<script type=\"text/javascript\">window.location=\"index.php?page=login\"</script>");
            break;
            
        case 'FILL_THIS_FIELD':
            if ($oLogin->user=="")
                $oForm->setError('username','Please Fill the Username');
            elseif ($oLogin->pass=="")
                $oForm->setError('password','Please Fill the Password');
            break;
            
        default:
            $_SESSION['error_message']="Error occured while login!";
            echo ("<script type=\"text/javascript\">window.location=\"index.php?page=login\"</script>");
    }
}

?>
     <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
        <div class="panel panel-info" >
            <div class="panel-heading">
                <div class="panel-title">WELCOME TO ADMIN PANEL</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
            </div>     

            <div style="padding-top:30px" class="panel-body" >

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                    
                <form class="form-horizontal" method="post" action="<?php echo($_SERVER['PHP_SELF']."?page=login"); ?>">
                    <span class="error"><?php echo($oForm->Error("username")); ?></span>    
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="username" type="text" class="form-control" name="username" value="" placeholder="username or email">                                        
                    </div>
                    <span class="error"><?php echo($oForm->Error("password")); ?></span>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control" name="password" placeholder="password">
                    </div>
                            

                        
                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                              <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                            </label>
                        </div>
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                          <!-- <a id="btn-login" href="#" class="btn btn-success">Login  </a> -->
                          <input type="submit" name="login" value="Login" class="btn btn-success" />
                          <!-- <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->

                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                Don't have an account! 
                            <a href="<?php echo($_SERVER['PHP_SELF']."?page=register"); ?>">
                                Sign Up Here
                            </a>
                            </div>
                        </div>
                    </div>    
                </form>     
                </div>                     
            </div>  
        </div>
    </div>





       
    