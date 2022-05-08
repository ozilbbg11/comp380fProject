
package hkmu.comps380f.dao;

import hkmu.comps380f.model.PollAnsEntry;
import java.util.List;

public interface PollAnsEntryRepository {
    public void addEntry(PollAnsEntry e);
    
    public void updateEntry(PollAnsEntry e);

    public List<PollAnsEntry> listEntries();
    
    public PollAnsEntry getEntryByPollIdName(Integer id, String name);
}
