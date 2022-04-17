<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="btn btn-dark" href="/project/lecture">Home</a>
            </li>
            <c:url var="logoutUrl" value="/cslogout"/>
            <form  action="${logoutUrl}" method="post">
                <input class="btn btn-dark " type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </ul>
    </div>
</nav>