<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${book.title}
    </title>
    <jsp:include page="../blocks/meta.jsp"/>
</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<main>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="col-md-6">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-primary">World</strong>
                        <h3 class="mb-0">${book.title}</h3>
                        <div class="mb-1 text-muted">Nov 12</div>
                        <p class="card-text mb-auto">${book.summary}</p>
                        <a href="#" class="stretched-link">Continue reading</a>
                    </div>
                    <div class="col-auto d-none d-lg-block">
                        <img src="${book.cover}" class="bd-placeholder-img card-img-center" width="145px"
                             height="225px" alt="${book.title}"/>

                    </div>
                </div>
            </div>

        </div>
    </div>

</main>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>