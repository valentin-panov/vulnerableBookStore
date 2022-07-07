<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Not found</title>
    <jsp:include page="blocks/meta.jsp"/>
</head>
<body>
<jsp:include page="blocks/header.jsp"/>
<section class="py-1 container">
    <div class="col-md-6 mx-auto">
        <div class="h-100 p-5 ">
            <h2>Error 404</h2>
            <p>We cannot find anything on your query.</p>
            <a class="btn btn-outline-secondary" href="/">Home page</a>
        </div>
    </div>
</section>
<jsp:include page="blocks/footer.jsp"/>

</body>
</html>