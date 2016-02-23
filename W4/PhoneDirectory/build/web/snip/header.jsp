<div class="header">
    <ul>
        <li><a href="<%= request.getContextPath() + "/list.jsp" %>">Phone Directory</a></li>
        <li class="right"><a href="<%= request.getContextPath() + "/logout" %>">Logout</a></li>
        <li class="right"><a href="<%= request.getContextPath() + "/add.jsp" %>">Add New</a></li>
        <li class="right">Hi, <%= session.getAttribute("name") %></li>
    </ul>
</div>