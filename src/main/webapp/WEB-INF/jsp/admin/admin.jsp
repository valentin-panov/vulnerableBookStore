<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <jsp:include page="../blocks/meta.jsp"/>
</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">Administration section</h1>
            <p class="lead text-muted">A room without books is like a body without a soul.</p>
            <p>
                <a href="#" class="btn btn-primary my-2">Learn more</a>
                <%--                <a href="#" class="btn btn-secondary my-2">Secondary action</a>--%>
            </p>
        </div>
    </div>
</section>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>