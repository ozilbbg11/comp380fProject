
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditPoll</title>
    </head>
    <%@include file="../header.jsp" %>
        <form:form method="post" modelAttribute="entry">
            <form:label path="question">Question:</form:label> 
            <form:input type="text" path="question" /> <br />
            <form:label path="choice1">choice1:</form:label> 
            <form:input type="text" path="choice1" /> <br />
            <form:label path="choice2">choice2:</form:label> 
            <form:input type="text" path="choice2" /> <br />
            <form:label path="choice3">choice3:</form:label> 
            <form:input type="text" path="choice3" /> <br />
            <form:label path="choice4">choose4:</form:label> 
            <form:input type="text" path="choice4" /> <br />
            <input type="submit" value="Save" />
        </form:form>
</html>
