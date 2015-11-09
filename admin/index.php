<?php
session_start();
require_once("../config.php");
if (!empty($_REQUEST['page']))
    $page = $_GET['page'];
else {
    $page = false;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Soccer Betway Management Admin Panel</title>
        <link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
        <link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
        <link rel="stylesheet" type="text/css" href="../css/bootstrap/css/bootstrap.css" />

        <link rel="stylesheet" href="../css/formValidation.css"/>
        
        <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        
        <link href='https://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <!-- For login and signin form -->
 
        <link rel="shortcut icon" href="../images/favicon.png"/>
        <script type="text/javascript" src="../js/formValidation.js"></script>
        <script type="text/javascript" src="../js/framework/bootstrap.js"></script>
        <script type="text/javascript">$(function () { $("[data-toggle = 'tooltip']").tooltip(); });</script>

    </head>

    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="admin/index.php">
                                <img alt="Soccer Betway Management" src="../images/logo.png"> <div class="site-name">Soccer Betway Management ADMIN PANEL</div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="user-info">
                            <?php
                            if (isset($_SESSION['sbm_user']))
                                echo("Welcome " . $_SESSION['sbm_adminuser']);
                            else
                                echo("Welcome Anonymous");
                            echo("&nbsp;&nbsp;&nbsp;&nbsp;");
                            
                            if ((isset($_SESSION['sbm_adminuser'])) && (isset($_SESSION['sbm_adminuser_id']))) {
                                if (isset($_SESSION['chk']) == true) {
                                    echo("<a href=\"index.php?page=logout\"><button type=\"button\" class=\"btn btn btn-primary btn-xs navbar-btn\">Logout</button></a>");
                                }
                            } else {
                                echo("<a href=\"index.php?page=login\"><button type=\"button\" class=\"btn btn btn-primary btn-xs navbar-btn\">Sign in</button></a>");
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div id="container-fluid">
            <?php
            if (isset($_SESSION['success_message'])) { //If message is set then display the message
                echo("<div class=\"success_message\">");
                echo($_SESSION['success_message']);
                unset($_SESSION['success_message']);
                echo("</div>");
            }

            if (isset($_SESSION['error_message'])) { //If message is set then display the message
                echo("<div class=\"error_message\">");
                echo($_SESSION['error_message']);
                unset($_SESSION['error_message']);
                echo("</div>");
            }
            ?>
        </div><!--end container-->  
        <?php
        if ((!isset($_SESSION['sbm_adminuser'])) && (!isset($_SESSION['sbm_adminuser_id']))) {
            if (!isset($_SESSION['chk'])){
                include("includes/login.inc.php");
            }
        }
        else
        {
        ?>
        <div class="row">
          <div class="col-sm-3">
            <div class="sidebar-nav">
              <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <!-- <span class="visible-xs navbar-brand">Sidebar menu</span> -->
                </div>
                <div class="navbar-collapse collapse sidebar-navbar-collapse">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="index.php?page=fixture">Fixture</a></li>
                    <li><a href="index.php?page=bidding">Bidding</a></li>
                  </ul>
                </div><!--/.nav-collapse -->
              </div>
            </div>
          </div>
          <div class="col-sm-9">
           <?php include("includes/circuit.inc.php"); ?>
          </div>
        </div>
            
        <?php
        }
            
        ?>
        
    </body>
</html>
