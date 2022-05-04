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
            ul {
                list-style: none;
                color: red;
                font-size: small;
            }

            ul li.checked {
                color: green;
            }

            ul li.checked::before {
                content: '✓ ';
                color: green;
            }

            ul li::before {
                content: '✗ ';
            }
        </style>
    </head>
    <body>
        <h2>Create a User</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="user" onsubmit="checkAllInfo()">
            <form:label path="username"><spring:message code="registragtionPage.username" text="Default text" /></form:label><br/>
            <form:input type="text" path="username" /><br/><br/>
            <form:label path="password"><spring:message code="registragtionPage.password" text="Default text" /></form:label><br/>
            <form:input type="password" path="password" oninput="validPassword()" /><br/><br/>
            <div id="passwordHint" class="font-weight-lighter">
                <ul>
                    <li id="rule1"><spring:message code="registragtionPage.password_log" text="Default text" /></li>
                    <li id="rule2"><spring:message code="registragtionPage.password_log2" text="Default text" /></li>
                </ul>
            </div>
            <form:label path="confirmPassword"><spring:message code="registragtionPage.confirmPassword" text="Default text" /></form:label><br>
            <form:input type="password" path="confirmPassword" oninput="checkSamePassword()"></form:input><br><br>
                <div id="confirmPasswordHint" class="font-weight-lighter d-none">
                    <ul>
                        <li><spring:message code="registragtionPage.confirmPassword_log" text="Default text" /></li>
                    </ul>
                </div>
            <form:label path="full_Name"><spring:message code="registragtionPage.fullName" text="Default text" /></form:label><br>
            <form:input type="text" path="full_Name"></form:input><br><br>
            <form:label path="phone_Number"><spring:message code="registragtionPage.phone" text="Default text" /></form:label><br>
            <form:input type="text" path="phone_Number" oninput="onlyDigit(this)"></form:input><br><br>
            <form:label path="address"><spring:message code="registragtionPage.address" text="Default text" /></form:label>
            <form:textarea path="address"></form:textarea>
            <input type="submit" value="Add User" id="submit" />
        </form:form>

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

    const onlyDigit = (status) =>{
        status.value = status.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1')
    }
    
    const checkAllInfo = () =>{
        if(document.getElementById("username").value == "" || document.getElementById("password").value == "" ||
                document.getElementById("confirmPassword").value == "" || document.getElementById("full_Name").value == "" ||
                document.getElementById("phone_Number").value == "" || document.getElementById("address").value == ""){
            alert("Please enter all content")
            return false
        }
        return true
    }
</script>
