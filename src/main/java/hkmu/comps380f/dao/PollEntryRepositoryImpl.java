
package hkmu.comps380f.dao;

import hkmu.comps380f.model.PollEntry;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class PollEntryRepositoryImpl implements PollEntryRepository {

    private final JdbcOperations jdbcOp;

    @Autowired
    public PollEntryRepositoryImpl(DataSource dataSource) {
        jdbcOp = new JdbcTemplate(dataSource);
    }

    private static final class EntryRowMapper implements RowMapper<PollEntry> {

        @Override
        public PollEntry mapRow(ResultSet rs, int i) throws SQLException {
            PollEntry entry = new PollEntry();
            entry.setId(rs.getInt("id"));
            entry.setQuestion(rs.getString("question"));
            entry.setChoice1(rs.getString("choice1"));
            entry.setChoice2(rs.getString("choice2"));
            entry.setChoice3(rs.getString("choice3"));
            entry.setChoice4(rs.getString("choice4"));
            return entry;
        }
    }

    private static final String SQL_INSERT_ENTRY
            = "insert into poll (question, choice1, choice2, choice3, choice4) values (?, ?, ?, ?, ?)";
    @Override
    public void addEntry(PollEntry entry) {
        jdbcOp.update(SQL_INSERT_ENTRY,
                entry.getQuestion(),
                entry.getChoice1(),
                entry.getChoice2(),
                entry.getChoice3(),
                entry.getChoice4()
        );
    }

    private static final String SQL_UPDATE_ENTRY
            = "update poll set question = ?, choice1 = ?, choice2 = ?, choice3 = ?, choice4 = ? where id = ?";
    @Override
    public void updateEntry(PollEntry entry) {
        jdbcOp.update(SQL_UPDATE_ENTRY,
                entry.getQuestion(),
                entry.getChoice1(),
                entry.getChoice2(),
                entry.getChoice3(),
                entry.getChoice4(),
                entry.getId());
    }

    private static final String SQL_SELECT_ALL_ENTRY
            = "select id, question, choice1, choice2, choice3, choice4 from poll";
    @Override
    public List<PollEntry> listEntries() {
        return jdbcOp.query(SQL_SELECT_ALL_ENTRY, new EntryRowMapper());
    }

    private static final String SQL_SELECT_ENTRY
            = "select id, question, choice1, choice2, choice3, choice4 from poll where id = ?";
    @Override
    public PollEntry getEntryById(Integer id) {
        return jdbcOp.queryForObject(SQL_SELECT_ENTRY, new EntryRowMapper(), id);
    }

    private static final String SQL_DELETE_ENTRY
            = "delete from poll where id = ?";
    private static final String SQL_DELETE_answer
            = "delete from ANSWER where poll_id = ?";
    private static final String SQL_DELETE_guestbook
            = "delete from guestbook where poll_id = ?";
    @Override
    public void removeEntryById(Integer id) {
        jdbcOp.update(SQL_DELETE_answer, id);
        jdbcOp.update(SQL_DELETE_guestbook, id);
        jdbcOp.update(SQL_DELETE_ENTRY, id);
    }
}
