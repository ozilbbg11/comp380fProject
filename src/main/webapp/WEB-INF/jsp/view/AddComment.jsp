<!DOCTYPE html>
<html>
    <head>
        <title>Add Comment</title>
    </head>
    <body>
    <h1>Add Comment</h1>
    <%@include file="../header.jsp" %>
    <form:form method="post">
        <form:label path="name">Name:</form:label> 
        <form:input type="text" path="name" /> <br />
        <form:textarea path="message"></form:textarea> <br />
        <input type="submit" name="add" value="Add" />
    </form:form>
    </body>
</html>
