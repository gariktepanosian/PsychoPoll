<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="css/question.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../css/util.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <title>Questions</title>
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <form action="${getContext.request.contextPath}/results" method="get">
            <c:forEach var="question" items="${question}">
                <input type="hidden" name="questionId" value="${question.id}">
                <p class="question">
                    <c:out value="${question.getId()}"/>
                    <c:out value="${question.getText()}"/>
                </p>
                <c:forEach var="answer" items="${answer}">
                    <c:if var="question.getId" test="${ question.getId() == answer.getQuestion_id()}">

                        <p class="answer">
                            <input type="radio" name="marked${question.id}" value="${answer.getId()}">
                                ${answer.getText()} ️
                        </p>
                    </c:if>
                </c:forEach>
            </c:forEach>
            <div class="container-login100-form-btn">
                <button type="submit" value="Check" class="login100-form-btn">
                    Check
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
