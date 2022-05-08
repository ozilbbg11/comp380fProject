<!DOCTYPE html>
<html>
    <head>
        <title>Add Comment</title>
    </head>
    <body>
    
    <%@include file="../header.jsp" %>
    <h1>Add Comment</h1>
    <form:form method="post">
        <form:textarea path="message" required="required" placeholder="leave some message" cols="50" rows="10"></form:textarea> <br />
        <input type="submit" name="add" value="Add" />
    </form:form>
    </body>
</html>
