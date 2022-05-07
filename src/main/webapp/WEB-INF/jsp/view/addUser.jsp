<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
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
                                    <h2 class="mb-4 pb-2 pb-md-0 mb-md-5"><spring:message code="userFuncCreate" text="Default text"/></h2>
                                    <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureUser" class="row g-3">
                                        <form:label path="username"><spring:message code="registragtionPage.username" text="Default text"/></form:label>
                                        <form:input type="text" class="form-control form-control-lg" required="required"  path="username" />
                                        <form:label path="password"><spring:message code="registragtionPage.password" text="Default text"/></form:label>
                                        <form:input type="text" class="form-control form-control-lg" required="required"  path="password" />
                                            <form:label path="roles"><spring:message code="userFuncRoles" text="Default text"/></form:label>
                                            <form:radiobutton  path="roles" class="btn-check"  id="radio1" checked="checked"  value="ROLE_USER" /><label class="btn btn-outline-success" for="radio1">User</label>
                                            <form:radiobutton  path="roles" class="btn-check"  id="radio2" value="ROLE_ADMIN" /><label class="btn btn-outline-success" for="radio2">Lecturer</label>
                                        
                                        <form:label path="full_Name"><spring:message code="registragtionPage.fullName" text="Default text"/></form:label>
                                        <form:input type="text" class="form-control form-control-lg" path="full_Name" />
                                        <form:label path="phone_Number"><spring:message code="registragtionPage.phone" text="Default text"/></form:label>
                                        <form:input type="number" class="form-control form-control-lg" path="phone_Number" />
                                        <form:label path="address"><spring:message code="registragtionPage.address" text="Default text"/></form:label>
                                        <form:input type="text" class="form-control form-control-lg" path="address" />
                                        <br /><br />
                                        <input class="btn btn-primary btn-lg"  type="submit" value="Add User"/>
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
