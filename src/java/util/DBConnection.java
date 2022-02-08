/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author za
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {
    public static Connection createConnection(){
    Connection con =  null;
    String url = "jdbc:derby://localhost:1527/engene;create=true;";
    String username = "eng";
    String password = "eng";
    
    try{
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }catch(ClassNotFoundException e){
        }
        con = DriverManager.getConnection(url, username, password);
        System.out.println("Printing Connection object" + con);
    }catch(SQLException e){
    
    }
    return con;
}
}

