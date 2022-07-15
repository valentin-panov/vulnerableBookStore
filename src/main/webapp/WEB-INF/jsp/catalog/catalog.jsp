<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

                            <div class="card-body">
                                <div class="card-text mh-100 p-1 text-truncate"><c:out value="${book.summary}"/></div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                                        <a href="/catalog/${book.id}"
                                           class="btn btn-secondary btn-sm px-4 gap-3">View</a>
                                        <form:form name="addBook"
                                                   method="post"
                                                   action="/account/cart/add/"
                                                   class="btn btn-outline-primary btn-sm p-0">
                                            <input type="hidden" name="bookId" value="${book.id}">
                                            <input type="hidden" name="userName"
                                                   value="<%=request.getUserPrincipal() != null ? request.getUserPrincipal().getName() : ""%>">
                                            <button type="submit"
                                                    class="btn btn-outline-primary btn-sm px-4">Buy
                                            </button>
                                        </form:form>
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