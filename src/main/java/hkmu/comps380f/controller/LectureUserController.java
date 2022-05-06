package hkmu.comps380f.controller;

import hkmu.comps380f.dao.CommentRepository;
import hkmu.comps380f.dao.LectureUserRepository;
import hkmu.comps380f.model.Comment;
import hkmu.comps380f.model.LectureUser;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
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
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        lectureUserRepo.save(user);
        return new RedirectView("/user/list", true);
    }
    

    @GetMapping("/delete/{username}")
    public View deleteLecture(@PathVariable("username") String username) {
        lectureUserRepo.delete(username);
        return new RedirectView("/user/list", true);
    }
}
