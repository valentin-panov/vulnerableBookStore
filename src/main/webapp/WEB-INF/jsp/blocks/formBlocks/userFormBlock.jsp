<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<form class="needs-validation" novalidate="" method="post" action="/users">
    <input type="hidden" name="_method" value="${method}">
    <div class="row g-3">

        <div class="col-12">
            <label for="username" class="form-label">Username</label>
            <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="Username" required="">
                <c:if test="${user.name == null || user.name== ''}">
                    <div class="invalid-feedback">
                        Your username is required.
                    </div>
                </c:if>
            </div>
        </div>

        <div class="col-sm-6">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" placeholder="">
            <div class="invalid-feedback">
                Password is required.
            </div>
        </div>
        <div class="col-sm-6">
            <label for="password_confirmation" class="form-label">Password confirmation</label>
            <input type="password" class="form-control" id="password_confirmation" placeholder="">
            <div class="invalid-feedback">
                Passwords must match.
            </div>
        </div>

        <div class="col-12">
            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
            <input type="email" class="form-control" id="email" placeholder="you@example.com">
            <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
            </div>
        </div>

        <hr class="my-4">

        <div class="col-sm-6">
            <label for="firstName" class="form-label">First name</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
            <div class="invalid-feedback">
                Valid first name is required.
            </div>
        </div>

        <div class="col-sm-6">
            <label for="lastName" class="form-label">Last name</label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
            <div class="invalid-feedback">
                Valid last name is required.
            </div>
        </div>

        <div class="col-12">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
            <div class="invalid-feedback">
                Please enter your shipping address.
            </div>
        </div>

        <div class="col-md-5">
            <label for="country" class="form-label">Country</label>
            <select class="form-select" id="country" required="">
                <option value="">Choose...</option>
                <option>United States</option>
            </select>
            <div class="invalid-feedback">
                Please select a valid country.
            </div>
        </div>

        <div class="col-md-4">
            <label for="state" class="form-label">State</label>
            <select class="form-select" id="state" required="">
                <option value="">Choose...</option>
                <option>California</option>
            </select>
            <div class="invalid-feedback">
                Please provide a valid state.
            </div>
        </div>

        <div class="col-md-3">
            <label for="zip" class="form-label">Zip</label>
            <input type="text" class="form-control" id="zip" placeholder="" required="">
            <div class="invalid-feedback">
                Zip code required.
            </div>
        </div>
    </div>

    <div class="form-check py-2">
        <input type="checkbox" class="form-check-input" id="consent">
        <label class="form-check-label" for="consent">I consent all the company policies</label>
    </div>

    <div class="container d-flex justify-content-center">
        <button class="w-50 btn btn-primary btn-lg" type="submit">Register</button>
    </div>
</form>
