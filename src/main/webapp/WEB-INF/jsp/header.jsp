<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #ecf0f3">
    <div class="container-fluid d-flex align-items-center">
        <ul class="navbar-nav p-1">
                <a class="navbar-brand fw-bolder " href="/project/lecture">Home</a>
            <security:authorize access="hasRole('ADMIN')"> 
                <li class="nav-item"><a class="nav-link" href="<c:url value="/lecture/create" />">Create a Lecture</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/user" />">Manage User Accounts</a> </li>
            </security:authorize>
                </ul>
            <c:url var="logoutUrl" value="/cslogout"/>
            <form  action="${logoutUrl}" method="post">
                <input class="btn btn-danger ms-auto position-relative " style="top: 8px;" type="submit" value="Logout" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
    </div>
</nav>