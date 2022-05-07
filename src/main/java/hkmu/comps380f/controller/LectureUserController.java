package hkmu.comps380f.controller;

import hkmu.comps380f.dao.CommentRepository;
import hkmu.comps380f.dao.LectureUserRepository;
import hkmu.comps380f.model.Comment;
import hkmu.comps380f.model.LectureUser;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/user")
public class LectureUserController {

    @Resource
    private LectureUserRepository lectureUserRepo;

    @Autowired
    private CommentRepository commentRepo;

    @GetMapping({"", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureUsers", lectureUserRepo.findAll());
        return "listUser";
    }

    public static class Form {

        private String username;
        private String password;
        private String[] roles;
        private String full_Name;
        private String phone_Number;
        private String address;

        // ... getters and setters for each of the properties
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

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
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

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(),
                form.getPassword(), form.getRoles(), form.getFull_Name(), form.getPhone_Number(), form.getAddress()
        );
        lectureUserRepo.save(user);
        return new RedirectView("/user/list", true);
    }

    @GetMapping("/delete/{username}")
    public View deleteLecture(@PathVariable("username") String username) {
        lectureUserRepo.delete(username);
        return new RedirectView("/user/list", true);
    }

    @GetMapping("/edit/{username}")
    public ModelAndView showEdit(@PathVariable("username") String username) {
        List<LectureUser> users = lectureUserRepo.findById(username);
        if (users.isEmpty()) {
            return new ModelAndView(new RedirectView("/user/list", true));
        }
        LectureUser user = users.get(0);
        ModelAndView modelAndView = new ModelAndView("editUser");
        modelAndView.addObject("user", user);
        Form userForm = new Form();
        userForm.setUsername(user.getUsername());
        userForm.setPassword(user.getPassword().substring(6));
        userForm.setFull_Name(user.getFull_Name());
        userForm.setPhone_Number(user.getPhone_Number());
        String [] arr = user.getRoles().toArray(new String[user.getRoles().size()]);
        userForm.setRoles(arr);
        userForm.setAddress(user.getAddress());
        modelAndView.addObject("userForm", userForm);
        return modelAndView;
    }

    @PostMapping("/edit/{username}")
    public View editUser(@PathVariable("username") String username, Form form) {
        LectureUser user = new LectureUser(form.getUsername(),
                form.getPassword(), form.getRoles(), form.getFull_Name(), form.getPhone_Number(), form.getAddress()
        );
        lectureUserRepo.edit(user);
        return new RedirectView("/user/list", true);
    }
}
