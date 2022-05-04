<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #ecf0f3">
    <div class="container-fluid d-flex align-items-center">
        <ul class="navbar-nav p-1">
            <a class="navbar-brand fw-bolder " href="/project/lecture"><spring:message code="headerPage.index" text="Default text"/></a>
            <security:authorize access="hasRole('ADMIN')"> 
                <li class="nav-item"><a class="nav-link" href="<c:url value="/lecture/create" />">Create a Lecture</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/user" />">Manage User Accounts</a> </li>
                </security:authorize>
                <security:authorize access="!hasAnyRole('USER','ADMIN')">
                <li class="nav-item"><a class="nav-link" href="<c:url value="/registration?"/><%=locale%>">Create Accounts</a> </li>
                </security:authorize>
        </ul>

        <ul class="navbar-nav p-1">
            <li class="nav-item"><a class="nav-link" id="locale_Eng" href="?language=en_US">English</a> </li>
            <li class="nav-item"><a class="nav-link" id="locale_Chi" href="?language=zh_CN">中文</a> </li>
                <security:authorize access="!hasAnyRole('USER','ADMIN')">
                <li class="nav-item"><a class="nav-link" href="<c:url value="/cslogin?" /><%=locale%>"><spring:message code="headerPage.login" text="Default text"/></a> </li>
                </security:authorize>
                <security:authorize access="hasAnyRole('USER','ADMIN')">
                    <c:url var="logoutUrl" value="/cslogout"/>
                <form  action="${logoutUrl}" method="post">
                    <input class="btn btn-danger ms-auto position-relative " style="top: 8px;" type="submit" value="Logout" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </security:authorize>
        </ul>
    </div>
</nav>
