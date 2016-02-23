<%@page import="java.sql.*"%>
<%@page import="com.chargebee.Database"%>
<%
    //if(session.getAttribute("email")==null)
        //response.sendRedirect(request.getContextPath());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List - Phone Directory</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link rel='stylesheet' href="css/style.css" />
    </head>
    <body>
        
        <%@include file="snip/header.jsp" %>
        
        <table class="list">

            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>  
                <th>Action</th>
            </tr>
            
            <%
            
                try {
                    Connection conn = Database.getConnection();
                  
                    String sql = "select * from directory where userPhone = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, session.getAttribute("phone").toString());
               
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()){
                        String name,addr,phone, action;
                        
                        name=rs.getString("fname") + " " + rs.getString("lname");
                        
                        addr = ((rs.getString("address1")!=null && !rs.getString("address1").equals(""))?rs.getString("address1")+", ":"");
                        addr+= ((rs.getString("address2")!=null && !rs.getString("address2").equals(""))?rs.getString("address2")+", ":"");
                        addr+= ((rs.getString("city")!=null && !rs.getString("city").equals(""))?rs.getString("city") + " - ":"") + ((rs.getString("zip")!=null && !rs.getString("zip").equals(""))?rs.getString("zip")+", ":"");
                        addr+= ((rs.getString("state")!=null && !rs.getString("state").equals(""))?rs.getString("state")+", ":"") + ((rs.getString("country")!=null && !rs.getString("country").equals(""))?rs.getString("country"):"");              
                           
                        phone = ((rs.getString("home")!=null && !rs.getString("home").equals(""))?rs.getString("home")+ " (HOME)":"");
                        phone+= ((rs.getString("work")!=null && !rs.getString("work").equals(""))?" | "+rs.getString("work")+ " (WORK)":"");
                        phone+= ((rs.getString("mobile")!=null && !rs.getString("mobile").equals(""))?" | "+rs.getString("mobile")+ " (MOBILE)":"");
                        
                        action = "<a href=\"edit.jsp?id="+rs.getString("id")+"\">Edit</a> | ";
                        action+= "<a href=\"delete?id="+rs.getString("id")+"\">Delete</a>";
                        
                        out.print("<tr><td>"+name+"</td><td>"+addr+"</td><td>"+phone+"</td><td>"+action+"</td></tr>");
                    }
                    
                } catch (Exception ex) {
                    response.sendRedirect("list.jsp");
                }
            
            %>



        </table>
     

        
    </body>
</html>
