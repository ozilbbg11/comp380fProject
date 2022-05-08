

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll Page</title>
    </head>
    <body>

        <%@include file="../header.jsp" %>
        <div class="container-fluid">
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/guestbook/editPoll?id=${entry.id}" />"><spring:message code="pollPage.edit" text="Default text"/></a>] 
                [<a href="<c:url value="/guestbook/delete?id=${entry.id}" />"><spring:message code="pollPage.delete" text="Default text"/></a>]
            </security:authorize>
            <p >Question: </p><p class="display-4"><c:out value="${entry.question}" escapeXml="true" /></p>
            <div class="p-2">Option 1: <a class="btn btn-danger" href="<c:url value="/guestbook/comment/vote?id=${entry.id}&ans=1" />"><c:out value="${entry.choice1}" escapeXml="true" /></a>
             Option 2: <a class="btn btn-danger" href="<c:url value="/guestbook/comment/vote?id=${entry.id}&ans=2" />"><c:out value="${entry.choice2}" escapeXml="true" /></a>
             Option 3:<a class="btn btn-danger" href="<c:url value="/guestbook/comment/vote?id=${entry.id}&ans=3" />"><c:out value="${entry.choice3}" escapeXml="true" /></a>
             Option 4:<a class="btn btn-danger" href="<c:url value="/guestbook/comment/vote?id=${entry.id}&ans=4" />"><c:out value="${entry.choice4}" escapeXml="true" /></a></div>
            <c:forEach var="answer" items="${ans}"> 
                <c:if test="${entry.id == answer.pollId}">
                    <c:if test="${name == answer.name}">
                        <c:if test="${not empty answer.ans}">
                            <p>Your last selection is choice <c:out value="${answer.ans}" escapeXml="true" /></p>
                            <p>There are ${choice1} people choose choice 1.</p>
                            <p>There are ${choice2} people choose choice 2.</p>
                            <p>There are ${choice3} people choose choice 3.</p>
                            <p>There are ${choice4} people choose choice 4.</p>
                        </c:if>
                    </c:if>
                </c:if>
            </c:forEach> 
            <h2>Comment area</h2>
            <hr>
            <c:if test="${fn:length(entries) == 0}">
                <p><spring:message code="commentPage.message" text="Default text"/></p>
            </c:if>
            <c:if test="${fn:length(entries) > 0}">
                <ul>
                    <c:forEach var="comment" items="${entries}">
                        <c:if test="${entry.id == comment.pollId}">
                            <li>
                                ${comment.name} ${comment.date}: 
                                <security:authorize access="hasRole('ADMIN')"> 
                                    [<a href="<c:url value="/guestbook/comment/delete?id=${comment.id}" />"><spring:message code="commentPage.delete" text="Default text"/></a>]
                                </security:authorize>

                                <br> <c:out value="${comment.message}" escapeXml="true" />
                            </li>
                            <hr>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <p><a href="<c:url value="/guestbook/comment/add?id=${entry.id}" />"><spring:message code="commentPage.addComment" text="Default text"/></a></p>
        </div>
    </body>
</html>
