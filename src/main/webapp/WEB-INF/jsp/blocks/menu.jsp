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
