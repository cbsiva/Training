<div class="header">
    <ul>
        <li><a href="<%= request.getContextPath() + "/portal.jsp" %>">Space Portal</a></li>
        <li class="right"><a href="<%= request.getContextPath() + "/logout" %>">Logout</a></li>
        <li class="right"><a href="<%= request.getContextPath() + "/deactivate" %>">Deactivate Account</a></li>
        <li class="right">Hi, <%= session.getAttribute("fname") %></li>
    </ul>
</div>