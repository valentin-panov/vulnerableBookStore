<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= "BOOK" %>
    </title>
    <jsp:include page="blocks/meta.jsp"/>

</head>
<body>
<jsp:include page="blocks/header.jsp"/>
<h1>
    <%= "ABOUT: " + new java.util.Date() %>
</h1>
<br/>
<jsp:include page="blocks/footer.jsp"/>

</body>
</html>