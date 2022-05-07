
package hkmu.comps380f.dao;

import hkmu.comps380f.model.PollEntry;
import java.util.List;

public interface PollEntryRepository {
    public void addEntry(PollEntry e);

    public void updateEntry(PollEntry e);

    public List<PollEntry> listEntries();

    public PollEntry getEntryById(Integer id);

    public void removeEntryById(Integer id);
}
