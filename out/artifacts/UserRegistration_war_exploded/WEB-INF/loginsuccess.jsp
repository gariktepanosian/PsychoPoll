<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Successfully</title>
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
        <h1 style="color: #ffffff" align="center">You are logged in</h1>
        <table cellpadding="2" border="2" align="center">
            <tr>
                <td>First name</td>
                <td>Email</td>
                <td>Username</td>
                <td>Password</td>
                <td>Address</td>
                <td>Contact</td>
            </tr>
            <tr>
                <td><c:out value="${sessionScope.user.first_name }"/></td>
                <td><c:out value="${sessionScope.user.email }"/></td>
                <td><c:out value="${sessionScope.user.username }"/></td>
                <td><c:out value="${sessionScope.user.password }"/></td>
                <td><c:out value="${sessionScope.user.address }"/></td>
                <td><c:out value="${sessionScope.user.contact }"/></td>
            </tr>
        </table>
        <form action="<%= request.getContextPath() %>/poll" method="get" class="login100-form validate-form">
            <div class="container-login100-form-btn">
                <button type="submit" value="Poll" class="login100-form-btn">
                    Poll
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
