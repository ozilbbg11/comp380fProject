<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support Login</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
    </head>
    <body>
        <div class="wrapper">
            <c:if test="${param.error != null}">
                <p class="text-center mt-4 text-danger">Login failed.</p>
            </c:if>
            <c:if test="${param.logout != null}">
               <p class="text-center mt-4 text-danger">You have logged out.</p>
            </c:if>
            <h1 class="text-center  mt-4 name">Login to the system</h1>
            <form class="p-3 mt-3" action="cslogin" method="POST">
                <div class="form-field d-flex align-items-center"><span class="far fa-user"></span>
                    <input type="text" id="username" name="username" placeholder="Username"/><br/><br/></div>


                <div class="form-field d-flex align-items-center"><span class="fa-key"></span>
                    <input type="password" id="password" name="password" placeholder="Password" /><br/><br/></div>
                <input type="checkbox" id="remember-me" name="remember-me" />
                <label for="remember-me">Remember me</label><br/><br/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn mt-3" type="submit" value="Log In"/>
            </form>
        </div>
    </body>
</html>
