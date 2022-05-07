package hkmu.comps380f.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LectureUser implements Serializable {

    private String username;
    private String password;
    private List<String> roles = new ArrayList<>();
    private String full_Name;
    private String phone_Number;
    private String address;

    public LectureUser() {
    }

    public LectureUser(String username, String password, String[] roles, String full_Name, String phone_Number, String address) {
        this.username = username;
        this.password = "{noop}" + password;
        this.roles = new ArrayList<>(Arrays.asList(roles));
        this.full_Name = full_Name;
        this.phone_Number = phone_Number;
        this.address = address;
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
    

    // getters and setters of all properties
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

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}
