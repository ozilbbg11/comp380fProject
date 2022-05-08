<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #ecf0f3">
    <div class="container-fluid d-flex align-items-center">
        <ul class="navbar-nav p-1">
            <a class="navbar-brand fw-bolder " href="/project/lecture"><spring:message code="headerPage.index" text="Default text"/></a>
            <security:authorize access="hasRole('ADMIN')"> 
                <li class="nav-item"><a class="nav-link" href="<c:url value="/lecture/create" />"><spring:message code="add.createLec" text="Default text"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/user" />">Manage User Accounts</a> </li>
                </security:authorize>
                <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                <li class="nav-item"><a class="nav-link" href="<c:url value="/lecture/commentHistory" />"><spring:message code="commentHistry" text="Default text"/></a></li>
                </security:authorize>
                <security:authorize access="!hasAnyRole('USER','ADMIN')">
                <li class="nav-item"><a class="nav-link" href="<c:url value="/registration?"/><%=locale%>"><spring:message code="headerPage.createAccount" text="Default text"/></a> </li>
                </security:authorize>
        </ul>

        <ul class="navbar-nav p-1">
            <li class="nav-item"><a class="nav-link" id="locale_Eng" href="">English</a> </li>
            <li class="nav-item"><a class="nav-link" id="locale_Chi" href="">中文</a> </li>
                <security:authorize access="!hasAnyRole('USER','ADMIN')">
                <li class="nav-item"><a class="nav-link" href="<c:url value="/cslogin?" /><%=locale%>"><spring:message code="headerPage.login" text="Default text"/></a> </li>
                </security:authorize>
                <security:authorize access="hasAnyRole('USER','ADMIN')">
                    <c:url var="logoutUrl" value="/cslogout"/>
                <form  action="${logoutUrl}" method="post">
                    <input class="btn btn-danger ms-auto position-relative "     style="top: 8px;" type="submit" value="Logout" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </security:authorize>
        </ul>
    </div>
</nav>
<script>
    let locale_Eng = document.getElementById("locale_Eng")
    let locale_CN = document.getElementById("locale_Chi")
    let locale_Eng2 = ""
    let locale_CN2 = ""

    if (!locale_Eng.href.includes("comment")) {
        locale_Eng.href = "?language=en_US"
        locale_CN.href = "?language=zh_CN"
    }

    if (locale_Eng.href.includes("comment") && !locale_Eng.href.includes("language=en_US")) {
        locale_Eng2 = locale_Eng.href.split("&")[0]
        locale_Eng.href = locale_Eng2 + "&language=en_US"
    }
    if (locale_CN.href.includes("comment") && !locale_CN.href.includes("language=zh_CN")) {
        locale_CN2 = locale_CN.href.split("&")[0]
        locale_CN.href = locale_CN2 + "&language=zh_CN"
    }
</script>
