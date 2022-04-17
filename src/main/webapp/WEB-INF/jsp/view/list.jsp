<!DOCTYPE html>
<html>
<head>
    <title>COMP S380F</title>
</head>
<body>
<c:url var="logoutUrl" value="/cslogout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Lectures</h2>
<security:authorize access="hasRole('ADMIN')"> 
    <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
    <a href="<c:url value="/lecture/create" />">Create a Lecture</a><br /><br />
</security:authorize>

<c:choose>
    <c:when test="${fn:length(lectureDatabase) == 0}">
        <i>There are no lectures in the system.</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${lectureDatabase}" var="lecture">
            Lecture ${lecture.id}:
            <a href="<c:url value="/lecture/view/${lecture.id}" />">
                <c:out value="${lecture.subject}" /></a>
            (Lecturer <c:out value="${lecture.customerName}" />)
            <security:authorize access="hasRole('ADMIN') or
                                principal.username=='${lecture.customerName}'">
                [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
            </security:authorize>
            <br />
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>