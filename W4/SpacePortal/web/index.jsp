<%
    if(session.getAttribute("email")!=null)
        response.sendRedirect(request.getContextPath()+"/portal.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Space Portal</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href="css/style.css" />
    </head>
    <body>
        
        <div class="box">
            <div class="head">Space Portal</div>
            <dv class="body">
                <form action="login" method="post">
                    <input class="txb" type='text' name="email" placeholder="Email"/>
                    <input class="txb" type='password' name="password" placeholder="Password"/>
                    <% if(request.getParameter("err")!=null) {%>
                    <div style="font-size:12px; color:#e74c3c; text-align: center; padding: 10px;">Invalid Email or Password. <a href="#">Forget Password?</a></div>
                    <% } %>
                    <center><input class="btn" type='submit' name="submit" value="LOGIN"/></center>
                </form>
            </dv>
            <div class="foot">
                <a href="signup.jsp">New around here?</a>
            </div>
        </div>
            
    </body>
</html>
