<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #ecf0f3">
    <div class="container-fluid">
        <ul class="navbar-nav p-1">
                <a class="navbar-brand" href="/project/lecture">Home</a>
            <security:authorize access="hasRole('ADMIN')"> 
                <li class="nav-item"><a class="nav-link" href="<c:url value="/lecture/create" />">Create a Lecture</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/user" />">Manage User Accounts</a> </li>
            </security:authorize>
            <c:url var="logoutUrl" value="/cslogout"/>
            <form  action="${logoutUrl}" method="post">
                <input class="btn btn-danger position-absolute end-0 rounded-pill" type="submit" value="Logout" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </ul>
    </div>
</nav>