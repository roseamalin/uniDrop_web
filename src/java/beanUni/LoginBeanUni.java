//ADMIN
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author najlaa
 */
public class AdminLoginBean implements java.io.Serializable {
    
    public String username;
    public String password;

    public AdminLoginBean(String username, String password) {
        this.username = username;
        this.password = password;
    }
    

    public AdminLoginBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}



//CUSTOMER
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author najlaa
 */
public class CustLoginBean implements java.io.Serializable {
    
    public String username;
    public String password;

    public CustLoginBean(String username, String password) {
        this.username = username;
        this.password = password;
    }
    

    public CustLoginBean() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
}
