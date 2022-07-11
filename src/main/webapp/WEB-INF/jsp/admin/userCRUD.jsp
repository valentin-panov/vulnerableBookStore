<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}
    </title>
    <jsp:include page="../blocks/meta.jsp"/>

</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<section class="py-1 container">
    <h1>
        User CRUD form
    </h1>
    <jsp:include page="../blocks/formBlocks/userFormBlock.jsp"/>

</section>
<br/>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>