package admin.controller;


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
