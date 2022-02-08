/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.LoginAppBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;


public class LoginAppDao {
     public String authenticateUser (LoginAppBean loginAppBean)
    {
        String name = loginAppBean.getName();
        String email = loginAppBean.getEmail();
        String password = loginAppBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Integer idDB = 0;
        String nameDB = "";
        String emailDB = "";
        String passwordDB = "";
        
        try
        {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.createStatement(); //Statement is used to write queries
            resultSet = statement.executeQuery("select AP_ID,AP_NAME, AP_EMAIL, AP_PASS from APPLICANT");
            while(resultSet.next())
            {   
                idDB = resultSet.getInt("AP_ID");
                nameDB = resultSet.getString("AP_NAME");
                emailDB = resultSet.getString("AP_EMAIL");
                passwordDB = resultSet.getString("AP_PASS");
                if(name.equals(nameDB) && email.equals(emailDB) && password.equals(passwordDB))
                {
                    return "SUCCESS";
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return "Wrong Email and Password";
    }
}
