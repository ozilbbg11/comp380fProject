

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll Page</title>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/guestbook/editPoll?id=${entry.id}" />"><spring:message code="pollPage.edit" text="Default text"/></a>] 
            [<a href="<c:url value="/guestbook/delete?id=${entry.id}" />"><spring:message code="pollPage.delete" text="Default text"/></a>]
        </security:authorize>
        <form:form method="post" modelAttribute="entry">
            <c:out value="${entry.question}" escapeXml="true" /><br />
            <c:out value="${entry.choice1}" escapeXml="true" /><br />
            <c:out value="${entry.choice2}" escapeXml="true" /><br />
            <c:out value="${entry.choice3}" escapeXml="true" /><br />
            <c:out value="${entry.choice4}" escapeXml="true" /><br />
            <input type="submit" value="<spring:message code="commentPage.save" text="Default text"/>" />
        </form:form>

        <c:if test="${fn:length(entries) == 0}">
            <p><spring:message code="commentPage.message" text="Default text"/></p>
        </c:if>
        <c:if test="${fn:length(entries) > 0}">
            <ul>
                <c:forEach var="comment" items="${entries}">
                    <li>
                        ${comment.name} (<fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd" />): 
                        <security:authorize access="hasRole('ADMIN')"> 
                        [<a href="<c:url value="/guestbook/comment/delete?id=${comment.id}" />"><spring:message code="commentPage.delete" text="Default text"/></a>]
                    </security:authorize>
                    <br />
                    <c:out value="${comment.message}" escapeXml="true" /><br />
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <p><a href="<c:url value="/guestbook/comment/add?id=${entry.id}" />"><spring:message code="commentPage.addComment" text="Default text"/></a></p>

</body>
</html>
