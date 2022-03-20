<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.epam.model.Employee" %><%--
  Created by IntelliJ IDEA.
  User: REDstore
  Date: 2/28/2022
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserData</title>
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

<%--<%--%>
<%--    Employee employees =(Employee) session.getAttribute("user");--%>

<%--%>--%>
<div class="limiter">
<div class="container-login100">
    <h1 style="color: #ffffff" align="center" >You are logged in</h1>
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
<%--        <td><%=employees.getEmail()%></td>--%>
<%--        <td><%=employees.getUsername()%></td>--%>
<%--        <td><%=employees.getPassword()%></td>--%>
<%--        <td><%=employees.getAddress()%></td>--%>
<%--        <td><%=employees.getContact()%></td>--%>
    </tr>
</table>
</div>
</div>
<style>
    td{
        border: 2px solid #ffffff;
        color: white;
        text-align: center;
    }
    table{
         margin: 120px;
     }
</style>
</body>
</html>
