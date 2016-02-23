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

/**
 *
 * @author cb-sivanantham
 */
public class signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            if(request.getParameter("password").equals(request.getParameter("cpassword"))){
                Connection conn = Database.getConnection();

                String sql = "Insert into user(phone,name,password) values(?,?,md5(?))";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, request.getParameter("phone"));
                ps.setString(2, request.getParameter("name"));
                ps.setString(3, request.getParameter("password"));

                ps.executeUpdate();

                response.sendRedirect("index.jsp");
            }else{
                response.sendRedirect("signup.jsp?err");
            }
            
        } catch (Exception ex) {
            
        }
    }

    
}
