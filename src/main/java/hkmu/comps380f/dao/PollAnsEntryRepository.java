
package hkmu.comps380f.dao;

import hkmu.comps380f.model.PollAnsEntry;
import java.util.List;

public interface PollAnsEntryRepository {
    public void addEntry(PollAnsEntry e);
    
    public void updateEntry(PollAnsEntry e);

    public List<PollAnsEntry> listEntries();
    
     public List<PollAnsEntry> getRntryByPollId(Integer id);
    
    public PollAnsEntry getEntryByPollIdName(Integer id, String name);
    
    public List<PollAnsEntry> answerList(Integer ans);
    
    public void deletePollAnd(int poll_id);
}
