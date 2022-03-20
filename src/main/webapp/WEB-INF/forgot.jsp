<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password or Username</title>
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
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <h1 style="color: #ffffff" align="center">Forgot your password or username?</h1>
        <form action="<%= request.getContextPath() %>/forgotUsername" method="get" class="login100-form validate-form">
            <div class="container-login100-form-btn">
                <button type="submit" value="Username" class="login100-form-btn">
                    Forgot Username
                </button>
            </div>
        </form>
        <form action="<%= request.getContextPath() %>/forgotPassword" method="get" class="login100-form validate-form">
            <div class="container-login100-form-btn">
                <button type="submit" value="Password" class="login100-form-btn">
                    Forgot Password
                </button>
            </div>
        </form>
    </div>
</div>
<style>
    td {
        border: 2px solid #ffffff;
        color: white;
        text-align: center;
    }

    table {
        margin: 120px;
    }
</style>
</body>
</html>
