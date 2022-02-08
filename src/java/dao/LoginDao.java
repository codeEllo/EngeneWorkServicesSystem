/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.LoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author User
 */
public class LoginDao 
{
    public String authenticateUser (LoginBean loginBean)
    {
        String name = loginBean.getName(); //Assign user entered values to temporary
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String nameDB = "";
        String emailDB = "";
        String passwordDB = "";
        
        try
        {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.createStatement(); //Statement is used to write queries
            resultSet = statement.executeQuery("select AD_NAME, AD_EMAIL, AD_PASS from ADMIN");
            while(resultSet.next())
            {
                nameDB = resultSet.getString("AD_NAME");
                emailDB = resultSet.getString("AD_EMAIL");
                passwordDB = resultSet.getString("AD_PASS");
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
