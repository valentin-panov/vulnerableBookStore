<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <jsp:include page="../blocks/meta.jsp"/>
    <style>.themed-grid-col {
        padding-top: .75rem;
        padding-bottom: .75rem;
        background-color: rgba(86, 61, 124, .15);
        border: 1px solid rgba(86, 61, 124, .2);
    }

    .themed-container {
        padding: .75rem;
        margin-bottom: 1.5rem;
        background-color: rgba(0, 123, 255, .15);
        border: 1px solid rgba(0, 123, 255, .2);
    }
    </style>
</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<section class="py-1 text-center container">
    <div class="row mb-3 align-items-center">
        <div class="col"><h2>${title}</h2></div>
        <div class="col"><a href="/users/new" class="btn btn-primary btn-md px-4 w-50">NEW USER</a></div>
    </div>
    <table class="container-fluid ">
        <tr>
            <td>id</td>
            <td>user name</td>
            <td>email</td>
            <td>user roles</td>
            <td>actions</td>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td class=" themed-grid-col">${user.id}</td>
                <td class=" themed-grid-col">${user.userName}</td>
                <td class=" themed-grid-col">${user.email}</td>
                <td class=" themed-grid-col">${user.roles}</td>
                <td class=" themed-grid-col">
                    <a href="/users/${user.id}/edit" class="btn btn-sm btn-outline-secondary">EDIT</a>
                    <a href="/users/${id}" class="btn btn-sm btn-outline-secondary">DELETE</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</section>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>