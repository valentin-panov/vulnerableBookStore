<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<hr class="my-4">
<form:form class="container text-start" method="post" name="paymentRequest" action="/account/cart/pay/">
    <input type="hidden" name="userName"
           value="<%=request.getUserPrincipal().getName()%>">
    <input type="hidden" name="total"
           value="<c:out value="${param.total}"/>">
    <input type="hidden" name="id"
           value="<c:out value="${param.orderId}"/>">
    <h4 class="mb-3">Total: <c:out value="${param.total}"/> EUR</h4>

    <div class="my-3 ">
        <div class="form-check">
            <input id="credit" value="credit" name="paymentMethod" type="radio" class="form-check-input" checked=""
                   required="">
            <label class="form-check-label" for="credit">Credit card</label>
        </div>
        <div class="form-check">
            <input id="debit" value="debit" name="paymentMethod" type="radio" class="form-check-input" required="">
            <label class="form-check-label" for="debit">Debit card</label>
        </div>
    </div>

    <div class="row gy-3">
        <div class="col-md-6">
            <label for="cc-name" class="form-label">Name on card</label>
            <input type="text" class="form-control" id="cc-name" name="cardHolder" placeholder="John Doe" required="">
            <small class="text-muted">Full name as displayed on card</small>

        </div>

        <div class="col-md-6">
            <label for="cc-number" class="form-label">Credit card number</label>
            <input id="cc-number" name="cardNumber" class="form-control" type="tel" inputmode="numeric"
                   pattern="[0-9\s]{13,19}"
                   required="" autocomplete="cc-number" maxlength="19" placeholder="xxxx xxxx xxxx xxxx">


        </div>

        <div class="col-md-3">
            <label for="cc-expiration" class="form-label">Expiration</label>
            <input type="tel" inputmode="numeric" class="form-control" id="cc-expiration" name="cardExpiry"
                   placeholder="MM/YY"
                   required="">

        </div>

        <div class="col-md-3">
            <label for="cc-cvv" class="form-label">CVV</label>
            <input id="cc-cvv" name="cardCVV" class="form-control" type="tel" inputmode="numeric" pattern="[0-9\s]{3,5}"
                   required="" autocomplete="cc-cvv" maxlength="5" placeholder="xxx">
        </div>
        <div class="col-md-6 d-flex align-items-end">
            <button type="submit" class="form-control btn btn-lg btn-primary">Pay</button>

        </div>


    </div>
</form:form>
<hr class="my-4">