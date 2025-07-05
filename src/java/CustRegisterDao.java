
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.CustRegisterBean;
import java.sql.*;
import util.DBConnection;

/**
 *
 * @author Nuradibah Maisarah
 */
public class CustRegisterDao {
    
    public String registerUser (CustRegisterBean registerBean) {
        
        String name = registerBean.getName();
        String username = registerBean.getUsername();
        String password = registerBean.getPassword();
        String phoneNum = registerBean.getPhoneNum();
        String email = registerBean.getEmail();
        String address = registerBean.getAddress();
        String membership = registerBean.getMembership();
        
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnection.createConnection();

            pstmt = con.prepareStatement("INSERT INTO USERS (custName, custPhone, custEmail, custAddress, username, password, membership) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)") ;
            
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, phoneNum);
            pstmt.setString(5, email);
            pstmt.setString(6, address);
            pstmt.setString(7, membership);
            int rowsInserted = pstmt.executeUpdate();
            con.close();
            
            if (rowsInserted > 0) {
                return "SUCCESS";
            } else {
                return "FAILED";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return "FAILED";
        }
 
    }
    
}
