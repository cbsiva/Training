/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chargebee;

import java.sql.*;
/**
 *
 * @author cb-sivanantham
 */
public class Database  {
    
   final static String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final static String DB_URL = "jdbc:mysql://localhost/space_portal";
  
    public static Connection getConnection() throws Exception{
        Class.forName(JDBC_DRIVER); 
        return DriverManager.getConnection(DB_URL,"root","PlsOpen");
    } 
}
