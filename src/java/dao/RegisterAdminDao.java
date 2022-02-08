/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.RegisterAdmin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

/**
 *
 * @author User
 */
public class RegisterAdminDao {
    
    public String registerUser(RegisterAdmin registerBean)
    {
       String name = registerBean.getName();
       String email = registerBean.getEmail();
       String password = registerBean.getPassword();
       
       Connection con = null;
       PreparedStatement preparedStatement = null;
       try
       {
           con = DBConnection.createConnection();
           String query= "insert into ADMIN(AD_NAME, AD_EMAIL, AD_PASS) values (?,?,?)";
           preparedStatement = con.prepareStatement(query);
           preparedStatement.setString(1, name);
           preparedStatement.setString(2, email);
           preparedStatement.setString(3, password);
           
           
           int i = preparedStatement.executeUpdate();
           
           if(i!=0)
               return "SUCCESS";
       }
       catch(SQLException e)
       {
       }
       return "Oops.. Something went wrong there..!";
    }
}
