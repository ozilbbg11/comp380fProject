<!DOCTYPE html>
<html>
    <head>
        <title>Edit lecture</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/dropzone.css" />">
    </head>
    <body>

        <%@include file="../header.jsp" %>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <div  class="container-fluid p-3">

                                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><spring:message code="edit.editLec" text="Default text"/></h2>
                                        <form:form method="POST" enctype="multipart/form-data" 
                                                   modelAttribute="lectureForm" class="row g-3">
                                            <form:label path="subject"><spring:message code="week" text="Default text"/></form:label>
                                            <form:input class="form-control form-control-lg" type="text" path="subject" /><br/><br/>
                                            <form:label path="body"><spring:message code="body" text="Default text"/></form:label>
                                            <form:textarea class="form-control form-control-lg" path="body" rows="5" cols="50" /><br/><br/>
                                            <c:if test="${lecture.numberOfAttachments > 0}">
                                                <spring:message code="Attach" text="Default text"/>
                                                <ul class="list-group">
                                                    <c:forEach items="${lecture.attachments}" var="attachment">
                                                            <li class="list-group-item d-flex justify-content-between">
                                                                    <c:out value="${attachment.name}" />
                                                                <a class="btn btn-danger" href="<c:url value="/lecture/${lectureId}/delete/${attachment.name}" />"><spring:message code="delete" text="Default text"/></a>
                                                            </li>
                                                    </c:forEach>
                                                </ul>
                                            </c:if>
                                                </br>
                                            <spring:message code="addAttach" text="Default text"/>
                                            <div class=" files"><input type="file" name="attachments" class="form-control form-control-lg"  multiple placeholder="Attachments" /></div>
                                            
                                            <input type="submit" class="btn btn-primary btn-lg" value="Submit"/>
                                        </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../footer.jsp" %>

    </body>
</html> 