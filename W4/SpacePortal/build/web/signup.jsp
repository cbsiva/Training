<%
    if(session.getAttribute("email")!=null)
        response.sendRedirect(request.getContextPath()+"/portal.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up - Space Portal</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href="css/style.css" />
    </head>
    <body>
        
        <div class="signup">
            <form method="post" action="signup">
                <table>
                    <tr><td colspan="2" style="text-align: center;"><div style="font-size: 14px">Register to</div><div style="font-size: 32px">Space Portal</div></td></tr>
                    <tr>
                        <td><input class="txb" type="textbox" name="fname" placeholder="First Name"/></td>
                        <td><input class="txb" type="textbox" name="lname" placeholder="Last Name"/></td>
                    </tr>
                    <tr>
                        <td><input class="txb"type="email" name="email" placeholder="Email"/></td>
                        <td><input class="txb" type="email" name="cemail" placeholder="Confirm Email"/></td>
                    </tr>
                    <tr>
                        <td><input class="txb" type="password" name="password" placeholder="Password"/></td>
                        <td><input class="txb" type="password" name="cpassword" placeholder="Confirm Password"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <% if(request.getParameter("err")!=null) {%>
                                <div style="font-size:12px; color:#e74c3c; text-align: center; padding: 10px;">Email or Password was mismatched</div>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;"><input class="btn" type="submit" name="submit" value="Create an account"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;"><a style="font-size: 12px;color:#AAA" href="index.jsp">Have an account already?</a></td>
                    </tr>

                </table>
            </form>
        </div>
        
    </body>
</html>
