<!DOCTYPE html>
<html>
    <head>
        <title>COMP S380F</title>
    </head>
    <body class="d-flex flex-column h-100 vsc-initialized">

        <%@include file="../header.jsp" %>

        <div class="container-fluid p-3">
            <h1 class="display-1 " style="text-shadow: 2px 2px #8f8282;"><spring:message code="welcome" text="Default text"/></h1>
        </div>
        <div class="container-fluid p-3 ">
            <div class="row">

                <!--Poll function-->
                <div class="col-4">
                    <h1><spring:message code="pollPage.title" text="Default text"/></h1>


                    <c:if test="${fn:length(entries) == 0}">
                        <p><spring:message code="pollPage.pollMessage" text="Default text"/></p>
                    </c:if>
                    <c:if test="${fn:length(entries) > 0}">
                        <ul>
                            <c:forEach var="entry" items="${entries}">
                                <li>
                                    <a href="<c:url value="/guestbook/comment?id=${entry.id}" />"><c:out value="${entry.question}" escapeXml="true" /></a>


                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <security:authorize access="hasRole('ADMIN')">
                        <p><a href="<c:url value="/guestbook/addPoll" />"><spring:message code="pollPage.addPoll" text="Default text"/></a></p>
                        </security:authorize>
                </div>

                <!--List lecture function-->
                <div class="col-8 list-group ">
                    <c:choose>
                        <c:when test="${fn:length(lectureDatabase) == 0}">
                            <p class="h2"><spring:message code="list.title" text="Default text"/></p>
                        </c:when>
                        <c:otherwise>
                            <p class="h2"><spring:message code="list.title1" text="Default text"/></p>

                            <c:forEach items="${lectureDatabase}" var="lecture">
                                <div class="list-group-item list-group-item-action p-3 shadow">
                                    <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/lecture/view/${lecture.id}" />">
                                        <div class="d-flex w-100 justify-content-between ">
                                            <h5 class="mb-1"> ${lecture.subject}: <c:out value="${lecture.body}" /></h5> 
                                    </a>
                                </div>

                                <a class="list-group-item-action" style="text-decoration: none" href="<c:url value="/lecture/view/${lecture.id}" />">
                                    <small><p class="mb-1"><spring:message code="lecturer" text="Default text"/> <c:out value="${lecture.customerName}" /></p></small>

                                </a>
                            </div>
                        </c:forEach>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <%@include file="../footer.jsp" %>
</body>
</html>
