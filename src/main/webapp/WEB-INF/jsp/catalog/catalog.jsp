<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Look through our book catalog
    </title>
    <jsp:include page="../blocks/meta.jsp"/>

</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<main>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach items="${books}" var="book">
                    <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="card shadow-sm">
                            <div class="p-1 d-flex justify-content-center">
                                <a href="/catalog/${book.id}">
                                    <img src="${book.cover}" class="bd-placeholder-img card-img-center" width="145px"
                                         height="225px" alt="${book.title}"/>
                                </a>
                            </div>
                                <%--                            fallback--%>
                                <%--                            <svg --%>
                                <%--                                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
                                <%--                                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
                                <%--                                <rect width="100%" height="100%" fill="#55595c"></rect>--%>
                                <%--                                <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>--%>
                                <%--                            </svg>--%>

                            <div class="card-body">
                                <div class="card-text mh-100 p-1 text-truncate"><c:out value="${book.summary}"/></div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="/catalog/${book.id}" class="btn btn-sm btn-outline-secondary">View</a>
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Buy</button>
                                    </div>
                                    <small class="text-muted"><c:out value="${book.price}"/></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>

</main>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>