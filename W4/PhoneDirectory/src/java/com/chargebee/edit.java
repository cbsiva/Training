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
import javax.servlet.http.HttpSession;

/**
 *
 * @author cb-sivanantham
 */
public class edit extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = Database.getConnection();
            HttpSession session = request.getSession();
            
            String sql = "Update directory set fname = ?, lname = ? , address1 = ?, address2 = ?, city = ?, state =  ?, zip = ?, country = ?, home = ?, work = ?, mobile = ? where userPhone = ? and id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getParameter("fname"));
            ps.setString(2, request.getParameter("lname"));
            ps.setString(3, request.getParameter("address1"));
            ps.setString(4, request.getParameter("address2"));
            ps.setString(5, request.getParameter("city"));
            ps.setString(6, request.getParameter("state"));
            ps.setString(7, request.getParameter("zip"));
            ps.setString(8, request.getParameter("country"));
            ps.setString(9, request.getParameter("home"));
            ps.setString(10, request.getParameter("work"));
            ps.setString(11, request.getParameter("mobile"));
            ps.setString(12, session.getAttribute("phone").toString());
            ps.setString(13, request.getParameter("id"));
            
            ps.executeUpdate();
            
            response.sendRedirect("edit.jsp?success&id="+request.getParameter("id"));
            
        } catch (Exception ex) {
            response.sendRedirect("edit.jsp?failed&id="+request.getParameter("id"));
        }
    }
        
}
