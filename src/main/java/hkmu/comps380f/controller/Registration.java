/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hkmu.comps380f.controller;

import hkmu.comps380f.dao.UserService;
import hkmu.comps380f.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author User
 */
@Controller
public class Registration {

    @Resource
    private UserService userSer;

    public static class Form {

        private String username;
        private String password;
        private String confirmPassword;
        private String full_Name;
        private String phone_Number;
        private String address;

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

        public String getConfirmPassword() {
            return confirmPassword;
        }

        public void setConfirmPassword(String confirmPassword) {
            this.confirmPassword = confirmPassword;
        }

    }

    @GetMapping({"/registration"})
    public ModelAndView create() {
        return new ModelAndView("registration", "user", new Form());
    }

    @PostMapping("/registration")
    public View create(Registration.Form form, HttpServletRequest req) throws ServletException, IOException {

        if (form.getUsername().equals("") || form.getPassword().equals("") || form.getConfirmPassword().equals("")
                || form.getFull_Name().equals("") || form.getPhone_Number().equals("") || form.getAddress().equals("")) {

            return new RedirectView("/registration?" + req.getQueryString(), true);
        }

        User user = new User(form.getUsername(),
                form.getPassword(), form.getFull_Name(), form.getPhone_Number(), form.getAddress()
        );
        userSer.save(user);
        return new RedirectView("/cslogin?" + req.getQueryString(), true);
    }
}
