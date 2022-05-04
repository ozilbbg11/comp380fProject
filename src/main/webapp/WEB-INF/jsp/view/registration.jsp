<%-- 
    Document   : registration
    Created on : 2022/4/20, 下午 03:22:44
    Author     : User
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            .wrong_message {
                list-style: none;
                color: red;
                font-size: small;
            }

            .wrong_message li.checked {
                color: green;
            }

            .wrong_message li.checked::before {
                content: '✓ ';
                color: green;
            }

            .wrong_message li::before {
                content: '✗ ';
            }
        </style>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                                <form:form method="POST" enctype="multipart/form-data" modelAttribute="user" onsubmit="checkAllInfo()">

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <form:label path="username" cssClass="form-label" ><spring:message code="registragtionPage.username" text="Default text" /></form:label>
                                                <form:input type="text" path="username" cssClass="form-control form-control-lg" />

                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <form:label path="full_Name" cssClass="form-label"><spring:message code="registragtionPage.fullName" text="Default text" /></form:label>
                                                <form:input type="text" path="full_Name" cssClass="form-control form-control-lg" />

                                            </div>
                                        </div>        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <form:label path="password" cssClass="form-label"><spring:message code="registragtionPage.password" text="Default text" /></form:label>
                                                <form:input type="password" path="password" oninput="validPassword()" cssClass="form-control form-control-lg" /><br>
                                                <div id="passwordHint" class="font-weight-lighter">
                                                    <ul class="wrong_message">
                                                        <li id="rule1"><spring:message code="registragtionPage.password_log" text="Default text" /></li>
                                                        <li id="rule2"><spring:message code="registragtionPage.password_log2" text="Default text" /></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <form:label path="confirmPassword" cssClass="form-label"><spring:message code="registragtionPage.confirmPassword" text="Default text" /></form:label>
                                                <form:input type="password" path="confirmPassword" oninput="checkSamePassword()" cssClass="form-control form-control-lg" />
                                                <div id="confirmPasswordHint" class="font-weight-lighter d-none">
                                                    <ul class="wrong_message">
                                                        <li><spring:message code="registragtionPage.confirmPassword_log" text="Default text" /></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">
                                            <div class="form-outline">
                                                <form:label path="phone_Number" cssClass="form-label"><spring:message code="registragtionPage.phone" text="Default text" /></form:label>
                                                <form:input type="text" path="phone_Number" oninput="onlyDigit(this)" cssClass="form-control form-control-lg" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">

                                            <div class="col-md-6 mb-4 pb-2">
                                                <div class="form-outline">
                                                    <form:label path="address" cssClass="form-label"><spring:message code="registragtionPage.address" text="Default text" /></form:label>
                                                    <form:textarea path="address" cssClass="form-control form-control-lg"></form:textarea>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="mt-4 pt-2">
                                            <input class="btn btn-primary btn-lg" type="submit" value="<spring:message code="registragtionPage.button" text="Default text" />" id="submit" />
                                        </div>

                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
<script>
    const validPassword = () => {
        if (document.getElementById("password").value.length >= 8) {
            document.getElementById("rule1").classList.add("checked")
        } else {
            document.getElementById("rule1").classList.remove("checked");
        }
        if (/\d/.test(document.getElementById("password").value)) {
            document.getElementById("rule2").classList.add("checked");
        } else {
            document.getElementById("rule2").classList.remove("checked");
        }
    }

    const checkSamePassword = () => {
        if (document.getElementById("password").value === document.getElementById("confirmPassword").value) {
            document.getElementById("confirmPasswordHint").classList.remove("d-block");
            document.getElementById("confirmPasswordHint").classList.add("d-none");

        } else {
            document.getElementById("confirmPasswordHint").classList.remove("d-none");
            document.getElementById("confirmPasswordHint").classList.add("d-block");

        }
    }

    const onlyDigit = (status) => {
        status.value = status.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1')
    }

    const checkAllInfo = () => {
        if (document.getElementById("username").value == "" || document.getElementById("password").value == "" ||
                document.getElementById("confirmPassword").value == "" || document.getElementById("full_Name").value == "" ||
                document.getElementById("phone_Number").value == "" || document.getElementById("address").value == "") {
            alert("Please enter all content")
            return false
        }
        return true
    }


</script>
