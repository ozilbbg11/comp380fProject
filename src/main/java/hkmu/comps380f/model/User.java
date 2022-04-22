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
public class User implements Serializable{
    
    private String username, passowrd, full_Name, phone_Number, address;

    public User(String username, String passowrd, String full_Name, String phone_Number, String address) {
        this.username = username;
        this.passowrd = "{noop}" + passowrd;
        this.full_Name = full_Name;
        this.phone_Number = phone_Number;
        this.address = address;
    }
    public User(){}
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassowrd() {
        return passowrd;
    }

    public void setPassowrd(String passowrd) {
        this.passowrd = passowrd;
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
