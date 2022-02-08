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
public class RegisterAppBean {
    private String name;
    private String dob;
    private String phone;
    private String email;
    private String password;
    private String ab;
    private String eb;

    public RegisterAppBean() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAb(String ab) {
        this.ab = ab;
    }

    public void setEb(String eb) {
        this.eb = eb;
    }

    public String getName() {
        return name;
    }

    public String getDob() {
        return dob;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAb() {
        return ab;
    }

    public String getEb() {
        return eb;
    }

    
}
