<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="ISO-8859-1">--%>
<%--    <title>User Registration page</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div align="center">--%>
<%--    <h1>User Register Form</h1>--%>
<%--    <form action="<%= request.getContextPath() %>/register" method="post">--%>
<%--        <table style="with: 80%">--%>
<%--            <tr>--%>
<%--                <td>First Name</td>--%>
<%--                <td><input type="text" name="first_name" /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Email</td>--%>
<%--                <td><input type="text" name="email" /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Username</td>--%>
<%--                <td><input type="text" name="username" /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Password</td>--%>
<%--                <td><input type="password" name="password" /></td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>Address</td>--%>
<%--                <td><input type="text" name="address" /></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Contact</td>--%>
<%--                <td><input type="text" name="contact" /></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--        <input type="submit" value="Register" />--%>
<%--    </form>--%>
<%--    <form action="<%= request.getContextPath() %>/index.jsp" method="post">--%>
<%--        <input type="submit" value="Login" />--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="images/img-01.png" alt="IMG">
            </div>
            <form action="<%= request.getContextPath() %>/register" method="post" class="login100-form validate-form">
					<span class="login100-form-title">
						Register
					</span>

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" name="first_name" id="first_name" placeholder="first name">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user-secret" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="email" id="email" placeholder="email">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                </div>


                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" name="username" id="username" placeholder="username">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input class="input100" type="password" name="password" id="password" placeholder="password">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" name="address" id="address" placeholder="address">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-location-arrow" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" name="contact" id="contact" placeholder="contact">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-phone" aria-hidden="true"></i>
						</span>
                </div>

                <div class="container-login100-form-btn">

                    <button type="submit" class="login100-form-btn">
                        Register
                    </button>
                </div>
                <div class="text-center p-t-136">
                </div>
            </form>
            <form action="<%= request.getContextPath() %>/index.jsp" method="post" class="login100-form validate-form">
                <div class="container-login100-form-btn">
                    <button type="submit" value="Login" class="login100-form-btn">
                        Login
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>



<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/tilt/tilt.jquery.min.js"></script>
<script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>