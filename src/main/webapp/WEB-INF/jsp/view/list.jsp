<!DOCTYPE html>
<html>
    <head>
        <title>COMP S380F</title>
    </head>
    <body class="d-flex flex-column min-vh-100">

        <%@include file="../header.jsp" %>

        <h2>COMP S380F</h2>
            <security:authorize access="hasRole('ADMIN')"> 
                <div class="row">
                    <a class="btn btn-outline-info" href="<c:url value="/user" />">Manage User Accounts</a></div>
                <div class="row"> <a class="btn btn-outline-info" href="<c:url value="/lecture/create" />">Create a Lecture</a></div>
            </security:authorize>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lectures in the system.</i>
            </c:when>
            <c:otherwise>
                <table class="table table-info table-striped">
                    <thead>
                        <tr class="table-info"><th>#</th><th>Name</th><th>Lecturer</th></tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lectureDatabase}" var="lecture">
                            <tr class="table-info">

                                <td class="table-info"> ${lecture.id}</td>
                                <td class="table-info"><a href="<c:url value="/lecture/view/${lecture.id}" />">
                                        <c:out value="${lecture.subject}" /></a></td>
                                <td class="table-info">
                                    <c:out value="${lecture.customerName}" /> 
                                    <security:authorize access="hasRole('ADMIN') or
                                                        principal.username=='${lecture.customerName}'">
                                        <a class="btn btn-outline-success btn-sm" href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>
                                    </security:authorize>
                                    <security:authorize access="hasRole('ADMIN')">
                                        <a class="btn btn-outline-danger btn-sm" href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>
                                    </security:authorize>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <%@include file="../footer.jsp" %>
    </body>
</html>