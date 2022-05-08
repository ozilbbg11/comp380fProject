/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hkmu.comps380f.dao;
import hkmu.comps380f.model.PollAnsEntry;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class PollAnsEntryRepositoryImpl implements PollAnsEntryRepository {
    private final JdbcOperations jdbcOp;

    @Autowired
    public PollAnsEntryRepositoryImpl(DataSource dataSource) {
        jdbcOp = new JdbcTemplate(dataSource);
    }

    public static Date toDate(Timestamp timestamp) {
        long milliseconds = timestamp.getTime() + (timestamp.getNanos() / 1000000);
        return new Date(milliseconds);
    }

    private static final class EntryRowMapper implements RowMapper<PollAnsEntry> {

        @Override
        public PollAnsEntry mapRow(ResultSet rs, int i) throws SQLException {
            PollAnsEntry entry = new PollAnsEntry();
            entry.setId(rs.getInt("id"));
            entry.setPollId(rs.getInt("poll_id"));
            entry.setName(rs.getString("name"));
            entry.setAns(rs.getInt("ans"));
            return entry;
        }
    }

    private static final String SQL_INSERT_ENTRY
            = "insert into answer (poll_id, name, ans) values (?, ?, ?)";
    @Override
    public void addEntry(PollAnsEntry entry) {
        jdbcOp.update(SQL_INSERT_ENTRY,
                entry.getPollId(),
                entry.getName(),
                entry.getAns()
        );
    }

    private static final String SQL_UPDATE_ENTRY
            = "update answer set ans = ? where poll_id = ? and name = ?";
    @Override
    public void updateEntry(PollAnsEntry entry) {
        jdbcOp.update(SQL_UPDATE_ENTRY,
                entry.getAns(),
                entry.getPollId(),
                entry.getName());
    }

    private static final String SQL_SELECT_ALL_ENTRY
            = "select id, poll_id, name, ans from answer";
    @Override
    public List<PollAnsEntry> listEntries() {
        return jdbcOp.query(SQL_SELECT_ALL_ENTRY, new EntryRowMapper());
    }
    
    private static final String SQL_SELECT_BY_
            = "select id, poll_id, name, ans from answer where poll_id=?";
    @Override
   public List<PollAnsEntry> getRntryByPollId(Integer id) {
        return jdbcOp.query(SQL_SELECT_ALL_ENTRY, new EntryRowMapper(),id);
    }

    private static final String SQL_SELECT_ENTRY
            = "select * from answer where poll_id = ? and name = ?";
    @Override
    public PollAnsEntry getEntryByPollIdName(Integer id, String name) {
        return jdbcOp.queryForObject(SQL_SELECT_ENTRY, new EntryRowMapper(), id, name);
    }
    private static final String SQL_ANSWER
            = "select * from answer where ans = ?";
    @Override
    public List<PollAnsEntry> answerList(Integer ans) {
        return jdbcOp.query(SQL_ANSWER, new EntryRowMapper(), ans);
    }
    private static final String SQL_DELETEANS_ENTRY
            = "delete from answer where poll_id=?";
    @Override
    public void deletePollAnd(int poll_id) {
        jdbcOp.update(SQL_DELETEANS_ENTRY,
                poll_id);
    }
}
