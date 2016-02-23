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
public class add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = Database.getConnection();
            HttpSession session = request.getSession();
            
            String sql = "insert into directory(userPhone, fname, lname, address1,address2, city, state, zip,country, home, work, mobile) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, session.getAttribute("phone").toString());
            ps.setString(2, request.getParameter("fname"));
            ps.setString(3, request.getParameter("lname"));
            ps.setString(4, request.getParameter("address1"));
            ps.setString(5, request.getParameter("address2"));
            ps.setString(6, request.getParameter("city"));
            ps.setString(7, request.getParameter("state"));
            ps.setString(8, request.getParameter("zip"));
            ps.setString(9, request.getParameter("country"));
            ps.setString(10, request.getParameter("home"));
            ps.setString(11, request.getParameter("work"));
            ps.setString(12, request.getParameter("mobile"));
            
            ps.executeUpdate();
            
            response.sendRedirect("add.jsp?success");
            
        } catch (Exception ex) {
            response.sendRedirect("add.jsp?failed");
        }
    }

    
}
