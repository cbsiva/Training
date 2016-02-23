<%@page import="java.sql.*"%>
<%@page import="com.chargebee.Database"%>
<%
    if(session.getAttribute("email")==null)
        response.sendRedirect(request.getContextPath());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal - Space Portal</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href="css/style.css" />
    </head>
    <body>
        
        <%@include file="snip/header.jsp" %>
        
        <div class="portal">
            <h1 style="text-align: center">Welcome to the Space Portal</h1>
            <table>
                <tr>
                    <td class="label">NAME</td>
                    <td class="value"><%= session.getAttribute("fname") + " " + session.getAttribute("lname") %></td>
                </tr>
                <tr>
                    <td class="label">EMAIL</td>
                    <td class="value"><%= session.getAttribute("email") %></td>
                </tr>
                <tr>
                    <td class="label">ADDRESS</td>
                    <td class="value">
                        <% 
                            Connection conn = Database.getConnection();
                            String sql = "select * from user where email=?;";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ps.setString(1, request.getSession().getAttribute("email").toString());
                          
                            ResultSet rs = ps.executeQuery();
                            String addr="";
                            if(rs.next()){
                                addr = ((rs.getString("address1")!=null && !rs.getString("address1").equals(""))?rs.getString("address1")+"<br/>":"");
                                addr+= ((rs.getString("address2")!=null && !rs.getString("address2").equals(""))?rs.getString("address2")+"<br/>":"");
                                addr+= ((rs.getString("city")!=null && !rs.getString("city").equals(""))?rs.getString("city") + " - ":"") + ((rs.getString("zip")!=null && !rs.getString("zip").equals(""))?rs.getString("zip")+"<br/>":"");
                                addr+= ((rs.getString("state")!=null && !rs.getString("state").equals(""))?rs.getString("state")+", ":"") + ((rs.getString("country")!=null && !rs.getString("country").equals(""))?rs.getString("country"):"");              
                            }
                            
                            if(addr.equals(""))
                                out.print("--NA--");
                            else
                                out.print(addr);   

                        %>
                    </td>
                </tr>
            </table>
            <div colspan="2" style="text-align: center;margin-top: 20px;"><a class="btn" href="edit.jsp">Edit Details</a></div>
               
        </div>
        
    </body>
</html>
