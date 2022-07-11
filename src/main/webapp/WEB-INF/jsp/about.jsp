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
        <h6>
            <%= "Timestamp: " + new java.util.Date() %>
        </h6>
    </div>
</section>
<br/>
<jsp:include page="blocks/footer.jsp"/>

</body>
</html>