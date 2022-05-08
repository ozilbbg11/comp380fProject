<!DOCTYPE html>
<html>
    <head>
        <title>COMP S380F</title>
    </head>
    <body class="d-flex flex-column h-100 vsc-initialized">
        <%@include file="../header.jsp" %>
        <c:url var="logoutUrl" value="/cslogout"/>
        <div class="container-fluid p-3">
            <h2 class="display-4">  <c:out value="${lecture.subject}" /> : <c:out value="${lecture.body}" /></h2>
            <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.customerName}'">
                <a class="btn btn-success" href="<c:url value="/lecture/edit/${lectureId}" />"><spring:message code="edit" text="Default text"/></a>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <a class="btn btn-danger" href="<c:url value="/lecture/delete/${lectureId}" />"><spring:message code="delete" text="Default text"/></a>
            </security:authorize>

            <table class="table table-striped table-hover">
                <tr>
                    <td><spring:message code="lecturer" text="Default text"/></td> 
                    <td><c:out value="${lecture.customerName}" /></td>
                </tr>
                <c:if test="${lecture.numberOfAttachments > 0}">
                    <tr>
                        <td><spring:message code="Attach" text="Default text"/></td>
                        <td><c:forEach items="${lecture.attachments}" var="attachment"
                                   varStatus="status">
                            <c:if test="${!status.first}">, </c:if>
                        <a href="<c:url value="/lecture/${lectureId}/attachment/${attachment.name}" />">
                            <c:out value="${attachment.name}" /></a>
                        </c:forEach></td>
                    </tr>
                </c:if>

            </table>

            <h2><spring:message code="view.commentField" text="Default text"/></h2>
            <p><spring:message code="view.commentField1" text="Default text"/></p>
            <div class="row g-3">
                <form:form method="POST" modelAttribute="commentForm" action="/project/lecture/addComment"   class="row g-3">
                    <div class="col-md-11">
                        <form:input type="text"  required = "required" path="content" class="form-control" placeholder="Type your comment..."   /></div>
                    <div class="col-md-1">
                        <form:input type="hidden" path="lectureId" value="${lectureId}"/>
                        <input type="submit" class="btn btn-primary rounded-pill" value="Submit"/>
                    </div>
                </form:form>
            </div>

            <div class="container-fluid">
                <%--<c:if test="!${comments.isEmpty()}">--%>
                <c:forEach items="${comments}" var="comment">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${comment.username}</h5><h6 class="card-subtitle mb-2 text-muted">${comment.datetime}</h6>
                            <p class="card-text"> ${comment.content}</p>

                            <security:authorize access="hasRole('ADMIN')">
                                <a class="btn btn-danger btn-sm rounded-pill " style="border:none;" href="<c:url value="/lecture/deleteComment/${comment.id}/${lectureId}" />"><spring:message code="delete" text="Default text"/></a>
                            </security:authorize>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <%--</c:if>--%>
    </div>

    <%@include file="../footer.jsp" %>
</body>
</html>