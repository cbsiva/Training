/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chargebee;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cb-sivanantham
 */
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            
            Connection conn = Database.getConnection();
            String sql = "select * from user where email=? and password=md5(?);";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getParameter("email"));
            ps.setString(2, request.getParameter("password"));

            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                HttpSession session = request.getSession();
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("fname", rs.getString("fname"));
                session.setAttribute("lname", rs.getString("lname"));              
                
                response.sendRedirect("portal.jsp");
            }else{
                 response.sendRedirect("index.jsp?err");
            }
            
        }catch(Exception ex){
           
        }
    }


}
