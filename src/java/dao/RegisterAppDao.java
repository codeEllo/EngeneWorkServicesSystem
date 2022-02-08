/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.RegisterAppBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

/**
 *
 * @author za
 */
public class RegisterAppDao {
     public String registerUser(RegisterAppBean registerBean)
    {
       String name = registerBean.getName();
       String dob = registerBean.getDob();
       String phone = registerBean.getPhone();
       String email = registerBean.getEmail();
       String ab = registerBean.getAb();
       String eb = registerBean.getEb();
       String password = registerBean.getPassword();
       
       Connection con = null;
       PreparedStatement preparedStatement = null;
       try
       {
           con = DBConnection.createConnection();
           String query= "insert into APPLICANT(AP_NAME, AP_DOB, AP_PHNUM, AP_EMAIL, AP_PASS, AP_AB, AP_EB ) values (?,?,?,?,?,?,?)";
           preparedStatement = con.prepareStatement(query);
           preparedStatement.setString(1, name);
           preparedStatement.setString(2, dob);
           preparedStatement.setString(3, phone);
           preparedStatement.setString(4, email);
           preparedStatement.setString(5, password);
           preparedStatement.setString(6, ab);
           preparedStatement.setString(7, eb);
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
