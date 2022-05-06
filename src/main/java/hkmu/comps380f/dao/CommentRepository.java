package hkmu.comps380f.dao;

import hkmu.comps380f.model.Comment;
import java.io.IOException;
import java.util.List;

public interface CommentRepository {
    public long createComment(String content, String username, long lectureId) throws IOException;
    
    public Comment getComment(long id);
    
    public List<Comment> getCommentByUser(String username);
    
    public List<Comment> getCommentByLectureId(long lectureId);
    
    
    public void deleteComment(long id);
    
}
