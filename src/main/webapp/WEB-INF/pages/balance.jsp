<%--
  Created by IntelliJ IDEA.
  User: Airin
  Date: 08/12/2015
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> ATM </title>
    <link type="text/css" href="/resources/css/bootstrap.css" rel="stylesheet"/>
    <link type="text/css" href="/resources/css/common.css" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <div id="interface">
        <div id="header">
            <img src="/resources/img/logo.png">

            <div id="callCenter">
                <h5>Контакт-центр<span> с 8.00 до 20.00<br>в будние дни</span></h5>

                <p>
                    <strong> +375 (17) 215-61-15 <br></strong>
                    <strong> 205 <span>— МТС, Life:), Velcom</span></strong>
                </p>
            </div>
        </div>
        <div class="screen">
            <h2> Ваш баланс составляет ${balance}</h2>
            <form action="/operations" method="post" >
                <input type="hidden" name="cardNum" value="${cardNum}">
                <button type="submit" class="btn btn-default"> Ок </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
