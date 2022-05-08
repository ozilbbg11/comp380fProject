package hkmu.comps380f.controller;

import hkmu.comps380f.dao.PollEntryRepository;
import hkmu.comps380f.model.CommentEntry;
import hkmu.comps380f.model.PollEntry;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import hkmu.comps380f.dao.CommentEntryRepository;
import hkmu.comps380f.dao.PollAnsEntryRepository;
import hkmu.comps380f.model.PollAnsEntry;
import java.io.IOException;
import java.security.Principal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/guestbook")
public class PollpageController  {
    
    @Resource
    private PollEntryRepository pEntryRepo;
    @Resource
    private CommentEntryRepository gbEntryRepo;
    @Resource
    private PollAnsEntryRepository paEntryRepo;

    @GetMapping({"", "/view"})
    public String index(ModelMap model) {
        model.addAttribute("entries", pEntryRepo.listEntries());
        return "GuestBook";
    }
    
    @GetMapping("/addPoll")
    public ModelAndView addPollForm() {
        return new ModelAndView("AddPoll", "command", new PollEntry());
    }
    
    @PostMapping("/addPoll")
    public View addPollHandle(PollEntry entry) {
        pEntryRepo.addEntry(entry);
        return new RedirectView("/lecture", true);
    }
    
    @GetMapping("/editPoll")
    public String editPollForm(@RequestParam("id") Integer entryId, ModelMap model) {
        PollEntry entry = pEntryRepo.getEntryById(entryId);
        model.addAttribute("entry", entry);
        return "EditPoll";
    }
    
    @PostMapping("/editPoll")
    public View editPollHandle(PollEntry entry, HttpServletRequest req) throws ServletException, IOException {
        pEntryRepo.updateEntry(entry);
        return new RedirectView("/guestbook/comment?id=" + entry.getId() + "&" + req.getQueryString(), true);
    }

    @GetMapping("/delete")
    public String deletePollEntry(@RequestParam("id") Integer entryId) {
        pEntryRepo.removeEntryById(entryId);
        return "redirect:/";
    }

    @GetMapping("/comment")
    public String pollPage(@RequestParam("id") Integer entryId, ModelMap model, Principal principal) {
        PollEntry entry = pEntryRepo.getEntryById(entryId);
        model.addAttribute("name", principal.getName());
        model.addAttribute("ans",paEntryRepo.listEntries());
        model.addAttribute("entries", gbEntryRepo.listEntries());
        model.addAttribute("entry", entry);
        return "CommentPage";
    }

    @GetMapping("/comment/vote")
    public View voteHandle(@RequestParam("id") Integer entryId, @RequestParam("ans") Integer ans, ModelMap model, Principal principal) {
        try{
            PollAnsEntry paEntry = paEntryRepo.getEntryByPollIdName(entryId, principal.getName());
            paEntry.setAns(ans);
            paEntryRepo.updateEntry(paEntry);
        }catch(Exception e){
            PollAnsEntry paEntry = new PollAnsEntry();
            paEntry.setPollId(entryId);
            paEntry.setName(principal.getName());
            paEntry.setAns(ans);
            paEntryRepo.addEntry(paEntry);
        }
        return new RedirectView("/guestbook/comment?id=" + entryId, true);
    }   
    @GetMapping("/comment/add")
    public ModelAndView addCommentForm(@RequestParam("id") Integer entryId, ModelMap model) {
        PollEntry entry = pEntryRepo.getEntryById(entryId);
        model.addAttribute("entry", entry);
        return new ModelAndView("AddComment", "command", new CommentEntry());
    }
    
    @PostMapping("/comment/add")
    public View addCommentHandle(@RequestParam("id") Integer entryId, CommentEntry entry, Principal principal) {
        entry.setPollId(entryId);
        entry.setName(principal.getName());
        entry.setDate(new Date());
        gbEntryRepo.addEntry(entry);
        return new RedirectView("/guestbook/comment?id=" + entryId, true);
    }
    @GetMapping("/comment/delete")
    public String deleteCommentEntry(@RequestParam("id") Integer entryId) {
        CommentEntry entry = gbEntryRepo.getEntryById(entryId);
        Integer pollId = entry.getPollId();
        gbEntryRepo.removeEntryById(entryId);
        return "redirect:/guestbook/comment?id=" + pollId;
    }
}
