<%@ page import="com.example.demo.models.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<li class="nav-item"><a href="/"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("index.jsp") ? "link-dark" : "link-secondary" %>">Home
</a></li>
<li class="nav-item"><a href="/news"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("news.jsp") ? "link-dark" : "link-secondary" %>">News</a>
</li>
<li class="nav-item"><a href="/catalog"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("catalog.jsp") ? "link-dark" : "link-secondary" %>">Catalog</a>
</li>
<li class="nav-item"><a href="/about"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("about.jsp") ? "link-dark" : "link-secondary" %>">Contact</a>
</li>
<% String userName = request.getRemoteUser();
%>
<%
    if (userName != null) {
        boolean isAdmin = request.getUserPrincipal().toString().contains("ADMIN");
%>
<%
    if (isAdmin) {
%>
<li class="nav-item"><a href="/admin/users/"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("userList.jsp") ? "link-dark" : "link-secondary" %>">Users</a>
</li>
<li class="nav-item"><a href="/admin/books/"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("bookList.jsp") ? "link-dark" : "link-secondary" %>">Books</a>
</li>
<% } %>
<li class="nav-item"><a href="/account/cart/<%=request.getUserPrincipal().getName()%>"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("cart.jsp") ? "link-dark" : "link-secondary" %>">My
    order
</a>
</li>
<li class="nav-item"><a href="/account"
                        class="nav-link px-2 <%= request.getRequestURI().endsWith("user.jsp") ? "link-dark" : "link-secondary" %>">My
    account [<%=userName%>]</a>
</li>
<% } %>
