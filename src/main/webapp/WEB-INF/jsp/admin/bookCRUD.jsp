<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h2>
        BOOK CRUD FORM
    </h2>
    <hr class="mt-4">
    <form:form method="${method != null? method : post}" id="bookForm" name="book"
               action="/admin/books/${book.id != null ? book.id : ''}">
        <div class="row g-3">

            <div class="col-sm-4">
                <label for="isbn" class="form-label">ISBN</label>
                <div class="input-group has-validation">
                    <input type="number" class="form-control" id="isbn" name="isbn" placeholder="ISBN" required=""
                           value="${book.isbn}">
                    <div class="invalid-feedback">
                        <form:errors path="isbn"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <label for="title" class="form-label">Title</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="title" name="title" placeholder="Title" required=""
                           value="${book.title}">
                    <div class="invalid-feedback">
                        <form:errors path="title"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <label for="author" class="form-label">Author</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="author" name="author" placeholder="Author" required=""
                           value="${book.author}">
                    <div class="invalid-feedback">
                        <form:errors path="author"/>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <label for="summary" class="form-label">Summary</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="summary" name="summary" placeholder="Summary"
                           required=""
                           value="${book.summary}">
                    <div class="invalid-feedback">
                        <form:errors path="summary"/>
                    </div>
                </div>
            </div>


            <div class="col-sm-6">
                <label for="cover" class="form-label">Cover link</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="cover" name="cover" placeholder="http://" required=""
                           value="${book.cover}">
                    <div class="invalid-feedback">
                        <form:errors path="cover"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <label for="price" class="form-label">Price</label>
                <div class="input-group has-validation">
                    <input type="number" class="form-control" id="price" name="price" placeholder="Price" required=""
                           value="${book.price}">
                    <div class="invalid-feedback">
                        <form:errors path="price"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <label for="currency" class="form-label">Currency</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="currency" name="currency" placeholder="EUR" required=""
                           value="${book.currency == null ? "EUR" : book.currency}">
                    <div class="invalid-feedback">
                        <form:errors path="currency"/>
                    </div>
                </div>
            </div>
        </div>

        <hr class="mt-4">

        <div class="container d-flex justify-content-center">
            <button class="w-50 btn btn-primary btn-lg" type="submit">
                <c:if test="${method == null || method == 'post'}">
                    Add
                </c:if>
                <c:if test="${method == 'patch'}">
                    Save
                </c:if>
            </button>
        </div>
    </form:form>
</section>
<br/>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>