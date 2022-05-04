<!DOCTYPE html>
<%@ page session="false"%>
<html>
    <head>
        <title>Customer Support Login</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
    </head>
    
    <security:authorize access="hasAnyRole('USER','ADMIN')">
        <script>
            alert("you are logged!")
            history.back()
        </script>
    </security:authorize>
    
    <body>
        <%@include file="../header.jsp" %>
        <div class="wrapper">
            <c:if test="${param.error != null}">
                <p class="text-center mt-4 text-danger">wrong username or password! Please try again</p>
            </c:if>
            <c:if test="${param.logout != null}">
               <p class="text-center mt-4 text-danger">You have logged out.</p>
            </c:if>
               <a href="?language=en_US">English</a>
               <a href="?language=zh_CN">中文</a>
               <h1 class="text-center  mt-4 name"><spring:message code="loginPage.title" text="Default text"/> </h1>
            <form class="p-3 mt-3" action="cslogin" method="POST">
                <div class="form-field d-flex align-items-center"><span class="far fa-user"></span>
                    <input type="text" id="username" name="username" placeholder="<spring:message code="loginPage.username" text="Default text"/>"/><br/><br/></div>


                <div class="form-field d-flex align-items-center"><span class="fa-key"></span>
                    <input type="password" id="password" name="password" placeholder="<spring:message code="loginPage.password" text="Default text"/>" /><br/><br/></div>
                <input type="checkbox" id="remember-me" name="remember-me" />
                <label for="remember-me">Remember me</label><br/><br/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn mt-3" type="submit" value="<spring:message code="loginPage.submit" text="Default text"/>"/>
            </form>
                <a class="btn mt-3" href="<c:url value="/registration?"/><%=locale%>" /><spring:message code="loginPage.Sign_UP" text="Default text"/></a>
        </div>
    </body>
</html>

