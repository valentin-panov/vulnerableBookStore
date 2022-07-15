<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <jsp:include page="../blocks/meta.jsp"/>
</head>
<body>
<jsp:include page="../blocks/header.jsp"/>
<section class="py-1 text-center container">
    <div class="row">
        <div class="col-lg-10 col-md-1 mx-auto">
            <c:if test="${success == true}">
                <div class="alert alert-success" role="alert">Your order was placed!</div>
            </c:if>
            <c:if test="${errors != null}">
                <div class="alert alert-danger" role="alert">${errors}</div>
            </c:if>
            <h1 class="fw-light pb-1">
                <c:if test="${details.size() == 0}">Your cart is empty</c:if>
                <c:if test="${details.size() > 0}">Your order</c:if>
            </h1>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:set var="total" scope="request" value="${0}"/>

                <c:forEach items="${details}" var="detail">
                    <c:set var="total" scope="request" value="${total + detail.price*detail.quantity}"/>
                    <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="card shadow-sm">
                            <div class="p-1 d-flex justify-content-center">
                                <a href="/catalog/${detail.product.id}">
                                    <img src="${detail.product.cover}" class="bd-placeholder-img card-img-center"
                                         width="145px"
                                         height="225px" alt="${detail.product.title}"/>
                                </a>
                            </div>

                            <form:form class="card-body" name="orderDetailUpdate" method="PATCH"
                                       action="/account/cart/patch/">
                                <input type="hidden" name="id" value="${detail.id}">
                                <input type="hidden" name="userName"
                                       value="<%=request.getUserPrincipal().getName()%>">
                                <div class="card-text p-1"><input type="number" name="quantity" min="0" class="w-100"
                                                                  value="${detail.quantity}"></div>
                                <div class="card-text p-1"><p>Price/unit: ${detail.price}</p></div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="submit"
                                                class="btn btn-sm btn-outline-secondary">UPDATE
                                        </button>
                                    </div>
                                    <small class="text-muted">Sum: <c:out
                                            value="${detail.price * detail.quantity}"/></small>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${details.size() > 0}">
                <jsp:include page="../blocks/formBlocks/paymentBlock.jsp">
                    <jsp:param name="total" value="${total}"/>
                    <jsp:param name="orderId" value="${order.id}"/>
                </jsp:include>
            </c:if>

        </div>
    </div>
</section>
<jsp:include page="../blocks/footer.jsp"/>

</body>
</html>