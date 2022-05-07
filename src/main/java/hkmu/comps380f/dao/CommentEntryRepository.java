package hkmu.comps380f.dao;

import hkmu.comps380f.model.CommentEntry;
import java.util.List;

public interface CommentEntryRepository {

    public void addEntry(CommentEntry e);

    public void updateEntry(CommentEntry e);

    public List<CommentEntry> listEntries();

    public CommentEntry getEntryById(Integer id);

    public void removeEntryById(Integer id);

}
