<!DOCTYPE html>
<html>
    <head>
        <title>Create lecture</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/dropzone.css" />">

    </head>
    <body class="d-flex flex-column h-100 vsc-initialized">
        <%@include file="../header.jsp" %>
        <div  class="container-fluid p-3">
            <h2>Create Lecture</h2>
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm"   class="row g-3">
                <div class="col-md-3">
                    <form:input type="text" path="subject" class="form-control" placeholder="Subject"   />
                </div>
                <div class="col-md-3">
                    <form:input  type="text"  path="body"  class="form-control" placeholder="Title"   />
                </div>
                <div class=" col-md-3 files"><input type="file" name="attachments" class="form-control"  multiple placeholder="Attachments" /></div>
                <div class="col-md-1"><input type="submit" class="btn btn-primary rounded-pill" value="Submit"/></div>
                </form:form>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
