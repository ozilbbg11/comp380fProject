/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hkmu.comps380f.model;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class UserDetail implements Serializable{
    private String username;
    private String password;
    private String full_Name;
    private String phone_Number;
    private String address;

    public UserDetail(String username, String password, String full_Name, String phone_Number, String address) {
        this.username = username;
        this.password = "{noop}" +password;
        this.full_Name = full_Name;
        this.phone_Number = phone_Number;
        this.address = address;
    }

    public UserDetail() {
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

    public String getFull_Name() {
        return full_Name;
    }

    public void setFull_Name(String full_Name) {
        this.full_Name = full_Name;
    }

    public String getPhone_Number() {
        return phone_Number;
    }

    public void setPhone_Number(String phone_Number) {
        this.phone_Number = phone_Number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
