/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chargebee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cb-sivanantham
 */
public class deactivate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = Database.getConnection();
            
            String sql = "Delete from user where email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getSession().getAttribute("email").toString());
            ps.executeUpdate();
            
            response.sendRedirect("logout");
            
        } catch (Exception ex) {
            
        }
    }

  
    
}
