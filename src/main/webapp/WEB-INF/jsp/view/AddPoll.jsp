<!DOCTYPE html>
<html>
    <head>
        <title>Add Poll</title>
    </head>
    <body>
    <%@include file="../header.jsp" %>
    <form:form method="post">
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
        <input type="submit" question ="add"  value="Add" />
    </form:form>
    </body>
</html>
