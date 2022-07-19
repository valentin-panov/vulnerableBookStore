<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= "ABOUT" %>
    </title>
    <jsp:include page="blocks/meta.jsp"/>

</head>
<body>
<jsp:include page="blocks/header.jsp"/>
<section class="py-1 container">
    <div class="col-md-10 mx-auto">

        <div id="dnn_ctr10508_HtmlModule_lblContent" class="Normal">
            <p><strong><span
                    style="font-family: Arial; font-size: 24px;">PUBLIC COMMUNICATIONS - DOD PUBLIC AFFAIRS</span></strong>
            </p>

            <p><span style="font-size: 13px;">1400 Defense Pentagon</span><br>
                <span style="font-size: small;">Washington, DC 20301-1400</span><br>
                <span style="font-size: small;">Public Inquiries: 703-571-3343</span><br>
                <span style="font-size: small;">Press/Media: 703-697-5131</span></p>

        </div>
        <form:form
                action="/external"
                method="get">
            <input id="url" name="url" type="hidden"
                   value="http://jsonplaceholder.typicode.com/posts">
            <input id="component" name="component" type="hidden"
                   value="about">
            <button class="btn btn-primary" type="submit">GET EXTERNAL DATA</button>
        </form:form>

        <c:if test="${error != null}">
            <div class="alert alert-danger my-1" role="alert">${error}</div>
        </c:if>
        <c:if test="${data != null}">
            <div class="alert alert-info my-1" role="alert">
                <c:forEach items="${data}" var="post">
                    <div class="blog-post">
                        <h6 class="blog-post-title">Title: ${post.title}</h6>
                        <p>Body: ${post.body}</p>
                        <hr>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
</section>
<br/>
<jsp:include page="blocks/footer.jsp"/>

</body>
</html>