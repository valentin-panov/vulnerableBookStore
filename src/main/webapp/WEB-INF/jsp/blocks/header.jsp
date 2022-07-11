<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                <use xlink:href="#bootstrap"></use>
            </svg>
        </a>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <jsp:include page="menu.jsp"/>
        </ul>

        <div class="row col-md-3">
            <% String userName = request.getRemoteUser(); %>
            <%
                if (userName == null) {
            %>
            <a href="/signin" class="col-md-5 btn btn-outline-primary me-2">Login</a>
            <a href="/users/new" class="col-md-5 btn btn-primary">Sign-up</a>
            <% } %>
            <%
                if (userName != null) {
            %>
            <a href="/account" class="col-md-5 btn btn-outline-primary me-2 text-truncate"><%=userName%>
            </a>
            <form action="/logout" method="post" class="col-md-5">
                <input class="btn btn-outline-primary me-2" type="submit" value="Sign Out"/>
            </form>
            <% } %>

        </div>
    </header>
</div>