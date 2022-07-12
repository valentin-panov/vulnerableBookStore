<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form:form id="userForm" name="userForm"
           method="${method != null ? method : 'post'}"
           action="/admin/users/${user.id != null ? user.id : ''}">
    <div class="row g-3">

        <div class="col-12">
            <label for="username" class="form-label">Username</label>
            <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="userName" placeholder="Username"
                       required=""
                       value="${user.userName}">
                    <%--                <c:if test="${user.userName == null || user.userName== ''}">--%>
                    <%--                </c:if>--%>
                <div class="invalid-feedback">
                    <form:errors path="userName"/>
                </div>
            </div>
        </div>

        <div class="col-sm-6">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="">
            <div class="invalid-feedback">
                Password is required.
            </div>
        </div>
        <div class="col-sm-6">
            <label for="password_confirmation" class="form-label">Password confirmation</label>
            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation"
                   placeholder="">
            <div class="invalid-feedback">
                Passwords must match.
            </div>
        </div>

        <hr class="my-4">

        <div class="col-12">
            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com"
                   value="${user.email}">
            <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
            </div>
        </div>


        <div class="col-sm-6">
            <label for="firstName" class="form-label">First name <span class="text-muted">(Optional)</span></label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value=""
                   value="${user.firstName}">
            <div class="invalid-feedback">
                Valid first name is required.
            </div>
        </div>

        <div class="col-sm-6">
            <label for="lastName" class="form-label">Last name <span class="text-muted">(Optional)</span></label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value=""
                   value="${user.lastName}">
            <div class="invalid-feedback">
                Valid last name is required.
            </div>
        </div>

        <div class="col-12">
            <label for="address" class="form-label">Address <span class="text-muted">(Optional)</span></label>
            <input type="text" class="form-control" id="address" name="address" placeholder="1234 Main St"
                   value="${user.address}">
            <div class="invalid-feedback">
                Please enter your shipping address.
            </div>
        </div>


    </div>
    <c:if test="${method == null || method == 'post'}">
        <hr class="my-4">

        <div class="form-check py-2">
            <input type="checkbox" class="form-check-input" id="consent" required="">
            <label class="form-check-label" for="consent">I consent all the company policies</label>
        </div>
    </c:if>

    <div class="container d-flex justify-content-center">
        <button class="w-50 btn btn-primary btn-lg my-5" type="submit">
            <c:if test="${method == null || method == 'post'}">
                Register
            </c:if>
            <c:if test="${method == 'patch'}">
                Save
            </c:if>
        </button>
    </div>
</form:form>
