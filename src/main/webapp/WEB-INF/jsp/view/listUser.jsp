<!DOCTYPE html>
<html>
    <head><title>Customer Support User Management</title></head>
    <body class="d-flex flex-column h-100 vsc-initialized">
        <%@include file="../header.jsp" %>
        <c:url var="logoutUrl" value="/cslogout"/>
        <div class="container-fluid p-3">
            <h2><spring:message code="userFuncTitle" text="Default text"/></h2>
            <a class="btn btn-sm btn-primary"  href="<c:url value="/user/create" />"><spring:message code="userFuncCreate" text="Default text"/></a><br /><br />
            <c:choose>
                <c:when test="${fn:length(lectureUsers) == 0}">
                    <i>There are no users in the system.</i>
                </c:when>
                <c:otherwise>
                    <table class="table table-striped table-hover">
                        <tr>
                            <th><spring:message code="registragtionPage.username" text="Default text"/></th>
                            <th><spring:message code="registragtionPage.password" text="Default text"/></th>
                            <th><spring:message code="userFuncRoles" text="Default text"/></th>
                            <th><spring:message code="registragtionPage.fullName" text="Default text"/></th>
                            <th><spring:message code="registragtionPage.phone" text="Default text"/></th>
                            <th><spring:message code="registragtionPage.address" text="Default text"/></th>
                            <th><spring:message code="userFuncAction" text="Default text"/></th>
                        </tr>
                        <c:forEach items="${lectureUsers}" var="user">
                            <tr>
                                <td>${user.username}</td><td>${user.password.substring(6)}</td>
                                <td>
                                    <c:forEach items="${user.roles}" var="role" varStatus="status">
                                        <c:if test="${!status.first}">, </c:if>
                                        <c:if test="${role == 'ROLE_ADMIN'}">Lecturer</c:if>
                                        <c:if test="${role == 'ROLE_USER'}">User</c:if>
                                    </c:forEach>
                                </td>
                                <td>${user.full_Name}</td>
                                <td>${user.phone_Number}</td>
                                <td>${user.address}</td>
                                <td>

                                    <a class="btn btn-sm btn-success" href="<c:url value="/user/edit/${user.username}" />"><spring:message code="edit" text="Default text"/></a>

                                    <security:authorize access="principal.username!='${user.username}'"><a class="btn btn-sm btn-danger" href="<c:url value="/user/delete/${user.username}" />"><spring:message code="delete" text="Default text"/></a></security:authorize>
                                    </td>
                                </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>

