<%@page import="java.sql.*"%>
<%@page import="com.chargebee.Database"%>


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
         <%@include file="snip/header.jsp" %>
        
        <div class="edit">
            <h1 style="text-align: center">Add New Contact</h1>
            <form method="post" action="add">
                <table>

                    <tr>
                        <td class="label">NAME</td>
                        <td><input class="txb" type="textbox" name="fname" placeholder="First Name" /></td>
                        <td><input class="txb" type="textbox" name="lname" placeholder="Last Name" /></td>
                    </tr>
                    <tr>
                        <td class="label">ADDRESS</td>
                        <td colspan="2"><input class="txb" type="textbox" name="address1" placeholder="Address Line 1"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2"><input class="txb" type="textbox" name="address2" placeholder="Address Line 2"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="txb" type="textbox" name="city" placeholder="City"/></td>
                        <td>
                            <select class="opt" name="state">
                                <option value="" disabled selected>State</option>
                                <option value="Tamil Nadu">Tamil Nadu</option>
                                <option value="Kerala">Kerala</option>
                                <option value="Karnataka">Karnataka</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="txb" type="textbox" name="zip" placeholder="Zip"/></td>
                        <td>
                            <select class="opt" name="country" placeholder="Country">
                                <option value="" disabled seleted>Country</option>
                                <option value="India">India</option>
                                <option value="USA">USA</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Phone (Home)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="home"/></td>
                    </tr>
                    <tr>
                        <td class="label">Phone (Work)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="work"/></td>
                    </tr>
                    <tr>
                        <td class="label">Phone (Mobile)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="mobile"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <% if(request.getParameter("success")!=null) {%>
                                <div style="font-size:12px; color:#27ae60; text-align: center; padding: 10px;">Successfully Added</div>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2" style="text-align: center;"><input class="btn" type="submit" name="submit" value="Add Contact"/><a style="font-size: 12px;color:#AAA;padding-left: 10px" href="list.jsp">Discard</a></td>
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
