/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoUni;

import beanUni.LoginBeanUni;
import java.sql.*;
import utilUni.DBConnectionUni;

/**
 *
 * @author najlaa
 */
public class LoginDaoUni {
    
    public String authenticateUser(LoginBeanUni loginBean) {
        
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String usernameDB = "";
        String passwordDB = "";
        
        try {
            con = DBConnectionUni.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select * from campusClubDB");
            
            while (resultSet.next())
            {
                usernameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                if (username.equals(usernameDB) && password.equals(passwordDB)) {
                    return "SUCCESS";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
