package hkmu.comps380f.dao;

import hkmu.comps380f.model.CommentEntry;
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
public class CommentEntryRepositoryImpl implements CommentEntryRepository {

    private final JdbcOperations jdbcOp;

    @Autowired
    public CommentEntryRepositoryImpl(DataSource dataSource) {
        jdbcOp = new JdbcTemplate(dataSource);
    }

    public static Date toDate(Timestamp timestamp) {
        long milliseconds = timestamp.getTime() + (timestamp.getNanos() / 1000000);
        return new Date(milliseconds);
    }

    private static final class EntryRowMapper implements RowMapper<CommentEntry> {

        @Override
        public CommentEntry mapRow(ResultSet rs, int i) throws SQLException {
            CommentEntry entry = new CommentEntry();
            entry.setId(rs.getInt("id"));
            entry.setPollId(rs.getInt("poll_id"));
            entry.setName(rs.getString("name"));
            entry.setMessage(rs.getString("message"));
            entry.setDate(rs.getTimestamp("date"));
            return entry;
        }
    }

    private static final String SQL_INSERT_ENTRY
            = "insert into guestbook (poll_id, name, message, date) values (?, ?, ?, ?)";
    @Override
    public void addEntry(CommentEntry entry) {
        jdbcOp.update(SQL_INSERT_ENTRY,
                entry.getPollId(),
                entry.getName(),
                entry.getMessage(),
                new Timestamp(entry.getDate().getTime())
        );
    }

    private static final String SQL_UPDATE_ENTRY
            = "update guestbook set name = ?, message = ?, date = ? where id = ?";
    @Override
    public void updateEntry(CommentEntry entry) {
        jdbcOp.update(SQL_UPDATE_ENTRY,
                entry.getName(),
                entry.getMessage(),
                new Timestamp(entry.getDate().getTime()),
                entry.getId());
    }

    private static final String SQL_SELECT_ALL_ENTRY
            = "select id, poll_id, name, message, date from guestbook";
    @Override
    public List<CommentEntry> listEntries() {
        return jdbcOp.query(SQL_SELECT_ALL_ENTRY, new EntryRowMapper());
    }

    private static final String SQL_SELECT_ENTRY
            = "select id, poll_id, name, message, date from guestbook where id = ?";
    @Override
    public CommentEntry getEntryById(Integer id) {
        return jdbcOp.queryForObject(SQL_SELECT_ENTRY, new EntryRowMapper(), id);
    }

    private static final String SQL_DELETE_ENTRY
            = "delete from guestbook where id = ?";
    @Override
    public void removeEntryById(Integer id) {
        jdbcOp.update(SQL_DELETE_ENTRY, id);
    }
}
