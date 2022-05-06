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

                                    <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.customerName}'">
                                        <a class="btn btn-outline-light btn-sm rounded-pill mx-1" style="border:none;color:#495057"  href="<c:url value="/lecture/edit/${lecture.id}" />" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                            <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"></path>
                                            </svg><spring:message code="edit" text="Default text"/> </a>
                                        </security:authorize>
                                        <security:authorize access="hasRole('ADMIN')">
                                        <a class="btn btn-outline-light btn-sm rounded-pill " style="border:none;color:#495057"  href="<c:url value="/lecture/delete/${lecture.id}" />" >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-archive-fill" viewBox="0 0 16 16">
                                            <path d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z"></path>
                                            </svg><spring:message code="delete" text="Default text"/> </a>
                                        </security:authorize>
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