<%@page import="java.sql.*"%>
<%@page import="com.chargebee.Database"%>
<%
    if(session.getAttribute("email")==null)
        response.sendRedirect(request.getContextPath());
    
    Connection conn = Database.getConnection();
    String sql = "select * from user where email=?;";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, request.getSession().getAttribute("email").toString());
                          
    ResultSet rs = ps.executeQuery();
    rs.next();
    

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
         <%@include file="snip/header.jsp" %>
        
        <div class="edit">
            <h1 style="text-align: center">Edit Details</h1>
            <form method="post" action="edit">
                <table>

                    <tr>
                        <td class="label">NAME</td>
                        <td><input class="txb" type="textbox" name="fname" placeholder="First Name" value="<%=rs.getString("fname")%>"/></td>
                        <td><input class="txb" type="textbox" name="lname" placeholder="Last Name" value="<%=rs.getString("lname")%>"/></td>
                    </tr>
                    <tr>
                        <td class="label">EMAIL</td>
                        <td colspan="2"><input class="txb" type="textbox" name="email" disabled="true" value="<%=rs.getString("email")%>"/></td>
                    </tr>
                    <tr>
                        <td class="label">ADDRESS</td>
                        <td colspan="2"><input class="txb" type="textbox" name="address1" placeholder="Address Line 1" value="<%= (rs.getString("address1")!=null)?rs.getString("address1"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2"><input class="txb" type="textbox" name="address2" placeholder="Address Line 2"value="<%= (rs.getString("address2")!=null)?rs.getString("address2"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="txb" type="textbox" name="city" placeholder="City" value="<%= (rs.getString("city")!=null)?rs.getString("city"):"" %>"/></td>
                        <td>
                            <select class="opt" name="state">
                                <option value="" disabled <%= (rs.getString("state")==null)?"selected":"" %>>State</option>
                                <option value="Tamil Nadu" <%= (rs.getString("state")!=null && rs.getString("state").equals("Tamil Nadu"))?"selected":"" %>>Tamil Nadu</option>
                                <option value="Kerala" <%= (rs.getString("state")!=null && rs.getString("state").equals("Kerala"))?"selected":"" %>>Kerala</option>
                                <option value="Karnataka" <%= (rs.getString("state")!=null && rs.getString("state").equals("Karnataka"))?"selected":"" %>>Karnataka</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="txb" type="textbox" name="zip" placeholder="Zip" value="<%= (rs.getString("zip")!=null)?rs.getString("zip"):"" %>"/></td>
                        <td>
                            <select class="opt" name="country" placeholder="Country">
                                <option value="" disabled <%= (rs.getString("country")==null)?"selected":"" %>>Country</option>
                                <option value="India" <%= (rs.getString("country")!=null && rs.getString("country").equals("India"))?"selected":"" %>>India</option>
                                <option value="USA" <%= (rs.getString("country")!=null && rs.getString("country").equals("USA"))?"selected":"" %>>USA</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <% if(request.getParameter("success")!=null) {%>
                                <div style="font-size:12px; color:#27ae60; text-align: center; padding: 10px;">Saved Successfully</div>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2" style="text-align: center;"><input class="btn" type="submit" name="submit" value="Save details"/><a style="font-size: 12px;color:#AAA;padding-left: 10px" href="portal.jsp">Discard</a></td>
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
