<?php
// session_start();
$_SESSION['chk'] = false;
unset($_SESSION['sbm_user']);
unset($_SESSION['sbm_user_id']);
unset($_SESSION['currentURL']);
echo ("<script type=\"text/javascript\">window.location=\"\index.php\"</script>");
?>
