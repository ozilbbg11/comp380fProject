<!DOCTYPE html>
<html>
    <head>
        <title>COMP S380F</title>
    </head>
    <body class="d-flex flex-column h-100 vsc-initialized">

        <%@include file="../header.jsp" %>

        <div class="container-fluid p-3 ">
            <h1><spring:message code="commentHistry" text="Default text"/></h1>
        </div>

        <div class="container-fluid p-3 ">
            <c:choose>
                <c:when test="${fn:length(comments) == 0}">
                    <p class="h2"><spring:message code="commentHistry1" text="Default text"/></p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${comments}" var="comment">
                        <div class="list-group-item list-group-item-action p-3 shadow">
                            <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/lecture/view/${comment.lectureId}" />">
                                <div class="d-flex w-100 justify-content-between ">
                                    <h5 class="mb-1"> ${comment.subject}: <c:out value="${comment.body}" /> <small><p class="mb-1"> <c:out value="${comment.datetime}" /></p></small></h5>
                                    <h5 class="mb-1"> </br><c:out value="${comment.content}" /></h5> 
                            </a>
                        </div>
                        <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/lecture/view/${comment.lectureId}" />">


                        </a>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
        
        <div class="container-fluid p-3 ">
            <h1>Comment history of poll</h1>
        </div>
        
        <div class="container-fluid p-3 ">
            <c:choose>
                <c:when test="${fn:length(commentPolls) == 0}">
                    <p class="h2"><spring:message code="commentHistry1" text="Default text"/></p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${commentPolls}" var="commentPoll">
                        <div class="list-group-item list-group-item-action p-3 shadow">
                            <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/guestbook/comment?id=${commentPoll.pollId}" />">
                                <div class="d-flex w-100 justify-content-between ">
                                    <h5 class="mb-1"><c:out value="${commentPoll.pollId}" /> <small><p class="mb-1"> <c:out value="${commentPoll.date}" /></p></small></h5>
                                    <h5 class="mb-1"> </br><c:out value="${commentPoll.message}" /></h5> 
                            </a>
                        </div>
                        <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/guestbook/comment?id=${commentPoll.pollId}" />">


                        </a>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
        

    <%@include file="../footer.jsp" %>
</body>
</html>