<?php
if (!empty($_POST)) {
    $data = @$_POST;
    $firstname = $data['firstname'];
    $lastname = $data['lastname'];
    $email = $data['email'];
    $country = $data['country'];
    $dob = $data['dob'];
    $username = $data['username'];
    $password = $data['password'];
    $code = $data['code'];
    $contact_no = $data['contact'];

    $qry = " INSERT INTO sbm_user(firstname,lastname, username, PASSWORD,dob,	address,country, contact_no, email, security_code, role_id
)
VALUES 	('$firstname','$lastname','$username', MD5('" . $password . "'),'$dob','Kathmandu','$country','$contact_no','$email',
		'$code',2) ";
    $rslt = mysql_query($qry);
    if ($rslt > 0) {
        echo '<script type= "text/javascript>alert(2);</script>"';
        echo ("<script type=\"text/javascript\">window.location=\"\index.php\"</script>");
    } else {
        echo "Not succesfull";
    }
}
?>
<div id="signupbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">Sign Up</div>
            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="<?php echo($_SERVER['PHP_SELF'] . "?page=login"); ?>">Sign In</a></div>
        </div> 
        <div class="panel-body" >
            <form class="form-horizontal" id="defaultForm" method="post" action="<?php echo($_SERVER['PHP_SELF'] . "?page=register"); ?>">
                <div class="form-group">
                    <label for="firstname" class="col-md-3 control-label">First Name *</label>
                    <div class="col-md-9">
                        <input type="text" id="firstname" class="form-control" name="firstname" placeholder="First Name">
                        <span class="error"><?php echo($oForm->Error("firstname")); ?></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-md-3 control-label">Last Name *</label>
                    <div class="col-md-9">
                        <input type="text" id="lastname" class="form-control" name="lastname" placeholder="Last Name">
                        <span class="error"><?php echo($oForm->Error("lastname")); ?></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-md-3 control-label">Email *</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="email" placeholder="Email Address">
                        <span class="error"><?php echo($oForm->Error("email")); ?></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Country *</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="country">
                            <option value="">-- Select a country --</option>
                            <option value="thailand">Thailand</option>
                            <option value="france">France</option>
                            <option value="nepal">Nepal</option>
                            <option value="germany">Germany</option>
                            <option value="italy">Italy</option>
                            <option value="japan">Japan</option>
                            <option value="russia">Russia</option>
                            <option value="united kingdom">United Kingdom</option>
                            <option value="united states">United State</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Date of Birth</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control datepicker" name="dob" placeholder="Date of Birth" data-date-format="yyyy-mm-dd">
                        <span class="error"><?php echo($oForm->Error("dob")); ?></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Phone number</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="contact" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">Username *</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="username" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Password *</label>
                    <div class="col-lg-9">
                        <input type="password" class="form-control" name="password" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Retype password *</label>
                    <div class="col-lg-9">
                        <input type="password" class="form-control" name="confirmPassword" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="code" class="col-md-3 control-label">Security Code *</label>
                    <div class="col-md-9">
                        <input type="text" id="code" class="form-control" name="code" placeholder="4-digit security code">
                        <span class="error"><?php echo($oForm->Error("code")); ?></span>
                    </div>
                </div>

                <div class="form-group">
                    <!-- Button -->                                        
                    <div class="col-md-offset-3 col-md-9">
                        <input type="submit" name="register" value="SignUp" class="btn btn-success" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('.datepicker').datepicker();
        $('#defaultForm').formValidation({
            message: 'This value is not valid',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstname: {
                    message: 'The firstname is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The firstname is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The firstname must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z]+$/,
                            message: 'The firstname can only consist of alphabetical'
                        }
                    }
                },
                lastname: {
                    message: 'The lastname is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The lastname is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The lastname must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z]+$/,
                            message: 'The firstname can only consist of alphabetical'
                        }
                    }
                },
                username: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The username is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The username must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        }
                    }
                },
                country: {
                    validators: {
                        notEmpty: {
                            message: 'The country is required and can\'t be empty'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email address is required and can\'t be empty'
                        },
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        },
                        identical: {
                            field: 'password',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: 'The confirm password is required and can\'t be empty'
                        },
                        identical: {
                            field: 'password',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                },
                code: {
                    message: 'The firstname is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The security code is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 4,
                            max: 4,
                            message: 'The security code must be 4 digit long'
                        },
                        regexp: {
                            regexp: /^(0|[1-9][0-9]*)+$/,
                            message: 'The security code can only consist of alphabetical'
                        }
                    }
                }
            }
        })
                .on('success.form.fv', function(e) {
            e.preventDefault();

            $.post('<?php echo($_SERVER['PHP_SELF'] . "?page=register"); ?>', $(this).serialize(), function(data) {
            }, 'json');
        });
    });
</script>


