/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author za
 */
public class LoginAppBean implements java.io.Serializable {
    //private Integer id;
    private String name;
    private String email;
    private String password;

    public LoginAppBean() {
    }


    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public LoginAppBean(String name, String email, String password) {
        //this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }


    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}
