
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditPoll</title>
    </head>
    <%@include file="../header.jsp" %>
        <form:form method="post" modelAttribute="entry">
            <form:label path="question"><spring:message code="editPollPage.question" text="Default text"/></form:label> 
            <form:input type="text" path="question" /> <br />
            <form:label path="choice1"><spring:message code="editPollPage.choice1" text="Default text"/></form:label> 
            <form:input type="text" path="choice1" /> <br />
            <form:label path="choice2"><spring:message code="editPollPage.choice2" text="Default text"/></form:label> 
            <form:input type="text" path="choice2" /> <br />
            <form:label path="choice3"><spring:message code="editPollPage.choice3" text="Default text"/></form:label> 
            <form:input type="text" path="choice3" /> <br />
            <form:label path="choice4"><spring:message code="editPollPage.choice4" text="Default text"/></form:label> 
            <form:input type="text" path="choice4" /> <br />
            <input type="submit" value="<spring:message code="editPollPage.save" text="Default text"/>" />
        </form:form>
</html>
