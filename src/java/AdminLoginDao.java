/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.AdminLoginBean;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author najlaa
 */
public class AdminLoginDao {
    
    public String authenticateUser(AdminLoginBean loginBean) {
        
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String usernameDB = "";
        String passwordDB = "";
        
        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select * from admin");
            
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
