<%@page import="java.sql.*"%>
<%@page import="com.chargebee.Database"%>

<%
    
    ResultSet rs = null;
            
    if(session.getAttribute("phone")==null)
        response.sendRedirect("index.jsp");
    else if(request.getParameter("id")==null || request.getParameter("id").equals("")){
        response.sendRedirect("list.jsp");
    }else{
        Connection conn = Database.getConnection();
        PreparedStatement ps = conn.prepareStatement("select * from directory where userPhone = ? and id = ?");
        ps.setString(1, session.getAttribute("phone").toString());
        ps.setString(2, request.getParameter("id"));
        
        rs = ps.executeQuery();
        rs.next();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit - Phone Directory</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href="css/style.css" />
    </head>
    <body>
         <%@include file="snip/header.jsp" %>
        
        <div class="edit">
            <h1 style="text-align: center">Edit Contact</h1>
            <form method="post" action="edit">
                <input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
                <table>

                    <tr>
                        <td class="label">NAME</td>
                        <td><input class="txb" type="textbox" name="fname" placeholder="First Name" value="<%=rs.getString("fname")%>"/></td>
                        <td><input class="txb" type="textbox" name="lname" placeholder="Last Name" value="<%=rs.getString("lname")%>"/></td>
                    </tr>
                    <tr>
                        <td class="label">ADDRESS</td>
                        <td colspan="2"><input class="txb" type="textbox" name="address1" placeholder="Address Line 1" value="<%= (rs.getString("address1")!=null)?rs.getString("address1"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2"><input class="txb" type="textbox" name="address2" placeholder="Address Line 2" value="<%= (rs.getString("address2")!=null)?rs.getString("address2"):"" %>"/></td>
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
                        <td class="label">Phone (Home)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="home" value="<%= (rs.getString("home")!=null)?rs.getString("home"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td class="label">Phone (Work)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="work" value="<%= (rs.getString("work")!=null)?rs.getString("work"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td class="label">Phone (Mobile)</td>
                        <td colspan="2"><input class="txb" type="textbox" name="mobile" value="<%= (rs.getString("mobile")!=null)?rs.getString("mobile"):"" %>"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <% if(request.getParameter("success")!=null) {%>
                                <div style="font-size:12px; color:#27ae60; text-align: center; padding: 10px;">Successfully Updated</div>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2" style="text-align: center;"><input class="btn" type="submit" name="submit" value="Save"/><a style="font-size: 12px;color:#AAA;padding-left: 10px" href="list.jsp">Discard</a></td>
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
