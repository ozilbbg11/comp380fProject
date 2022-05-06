package hkmu.comps380f.dao;

import hkmu.comps380f.model.Comment;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CommentRepositoryImpl implements CommentRepository {

    private final JdbcOperations jdbcOp;

    @Autowired
    public CommentRepositoryImpl(DataSource dataSource) {
        jdbcOp = new JdbcTemplate(dataSource);
    }

    public static final class CommentRowMapper implements ResultSetExtractor<List<Comment>> {

        @Override
        public List<Comment> extractData(ResultSet rs) throws SQLException, DataAccessException {
            Map<Long, Comment> map = new HashMap<>();
            while (rs.next()) {
                Long id = rs.getLong("id");
                Comment comment = map.get(id);
                if (comment == null) {
                    comment = new Comment();
                    comment.setId(id);
                    comment.setContent(rs.getString("content"));
                    comment.setUsername(rs.getString("username"));
                    comment.setDatetime(rs.getTimestamp("datetime"));
                    comment.setLectureId(rs.getLong("lecture_Id"));
                    comment.setSubject(rs.getString("subject"));
                    comment.setBody(rs.getString("body"));
                    map.put(id, comment);
                }
            }
            return new ArrayList<>(map.values());
        }

    }

    @Override
    @Transactional
    public long createComment(final String content, final String username, final long lectureId) throws IOException {
        final String SQL_INSERT_COMMENT = "insert into comment (content, username, datetime,lecture_Id) values (?, ?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcOp.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection)
                    throws SQLException {
                long time = System.currentTimeMillis();
                PreparedStatement ps = connection.prepareStatement(SQL_INSERT_COMMENT,
                        new String[]{"id"});
                ps.setString(1, content);
                ps.setString(2, username);
                ps.setTimestamp(3, new Timestamp(time));
                ps.setLong(4, lectureId);
                return ps;
            }
        }, keyHolder);
        Long commentId = keyHolder.getKey().longValue();
        return commentId;
    }

    @Override
    @Transactional(readOnly = true)
    public Comment getComment(long id) {
        final String SQL_SELECT_comment = "select c.id, c.content, c.username, c.datetime, c.lecture_id, l.subject, l.body from comment c, lecture l where c.id=? and c.lecture_id = l.id";
        return jdbcOp.query(SQL_SELECT_comment, new CommentRowMapper(), id).get(0);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Comment> getCommentByUser(String username) {
        final String SQL_SELECT_commentSbyUser = "select c.id, c.content, c.username, c.datetime, c.lecture_id, l.subject, l.body from comment c, lecture l where c.username=? and c.lecture_id = l.id";
        return jdbcOp.query(SQL_SELECT_commentSbyUser, new CommentRowMapper(), username);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Comment> getCommentByLectureId(long lectureId) {
        final String SQL_SELECT_commentSbyLectureId = "select c.id, c.content, c.username, c.datetime, c.lecture_id, l.subject, l.body from comment c, lecture l where c.lecture_Id=? and c.lecture_id = l.id";
        return jdbcOp.query(SQL_SELECT_commentSbyLectureId, new CommentRowMapper(), lectureId);
    }

    @Override
    @Transactional
    public void deleteComment(long id) {
        final String SQL_DELETE_COMMENT = "delete from comment where id=?";
        jdbcOp.update(SQL_DELETE_COMMENT, id);
    }
}
