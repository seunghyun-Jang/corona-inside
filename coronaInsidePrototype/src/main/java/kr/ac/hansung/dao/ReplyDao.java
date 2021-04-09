package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Post;
import kr.ac.hansung.model.Reply;

@Repository
public class ReplyDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    	
    public int getRowCount() {
    	
    	String sqlStatement = "select count(*) from replies";
    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
    	
    }
    
    public Reply getReply(int replyId) {
    	String sqlStatement = "select * from replies where reply_id=?";
    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {replyId}, new RowMapper<Reply>() {
    		@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Reply reply = new Reply();
				
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setPostNo(rs.getInt("post_no"));
				reply.setGroupNo(rs.getInt("group_no"));
				reply.setParentId(rs.getInt("parent_id"));
				reply.setOrderNo(rs.getInt("order_no"));
				reply.setAuthor(rs.getString("author"));
				reply.setDate(rs.getString("date").toString());
				reply.setContent(rs.getString("content"));
				reply.setLike(rs.getInt("like"));
				reply.setUnlike(rs.getInt("unlike"));
				reply.setBest(rs.getBoolean("is_best"));
				
				return reply;
			}
    	});
    }
    
    // Return Replies
    public List<Reply> getReplies(int postNo) {
    	
    	String sqlStatement = "select * from replies where post_no=? order by order_no";
    	return jdbcTemplate.query(sqlStatement, new Object[] {postNo}, new RowMapper<Reply>() {

			@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Reply reply = new Reply();
				
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setPostNo(rs.getInt("post_no"));
				reply.setGroupNo(rs.getInt("group_no"));
				reply.setParentId(rs.getInt("parent_id"));
				reply.setOrderNo(rs.getInt("order_no"));
				reply.setAuthor(rs.getString("author"));
				reply.setDate(rs.getString("date").toString());
				reply.setContent(rs.getString("content"));
				reply.setLike(rs.getInt("like"));
				reply.setUnlike(rs.getInt("unlike"));
				reply.setBest(rs.getBoolean("is_best"));
				
				return reply;
			}
    		
    	});
    	
    }
    
    public List<Reply> getBestReplies(int postNo) {
    	String sqlStatement = "select * from replies where post_no=? and is_best=? order by replies.like desc";
    	return jdbcTemplate.query(sqlStatement, new Object[] {postNo, true}, new RowMapper<Reply>() {

			@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Reply reply = new Reply();
				
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setPostNo(rs.getInt("post_no"));
				reply.setGroupNo(rs.getInt("group_no"));
				reply.setParentId(rs.getInt("parent_id"));
				reply.setOrderNo(rs.getInt("order_no"));
				reply.setAuthor(rs.getString("author"));
				reply.setDate(rs.getString("date").toString());
				reply.setContent(rs.getString("content"));
				reply.setLike(rs.getInt("like"));
				reply.setUnlike(rs.getInt("unlike"));
				reply.setBest(rs.getBoolean("is_best"));
				
				return reply;
			}
    		
    	});
    }
    
    // Insert Data
    public boolean insert(Reply reply) {
    	
    	int postNo = reply.getPostNo();
    	int groupNo = reply.getGroupNo();
    	int parentId = reply.getParentId();
    	int orderNo = reply.getOrderNo();
    	String author = reply.getAuthor();
    	String content = reply.getContent();
    	
    	updateOrderNumbers(postNo, orderNo);
    	
    	String sqlStatement = 
    			"insert into replies (post_no, group_no, parent_id, order_no, author, content) values (?,?,?,?,?,?)";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, groupNo, parentId, orderNo, author, content}) == 1);
    }
    
 // Insert Data
    public boolean insertBest(Reply reply) {
    	
    	int postNo = reply.getPostNo();
    	int groupNo = reply.getGroupNo();
    	int parentId = reply.getParentId();
    	int orderNo = reply.getOrderNo();
    	String author = reply.getAuthor();
    	String content = reply.getContent();
    	int like = reply.getLike()+1;
    	int unlike = reply.getUnlike();
    	boolean isBest = true;
    	
    	updateOrderNumbers(postNo, orderNo);
    	
    	String sqlStatement = 
    			"insert into replies (post_no, group_no, parent_id, order_no, author, content, replies.like, unlike, is_best) values (?,?,?,?,?,?,?,?,?)";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, groupNo, parentId, orderNo, author, content, like, unlike, isBest}) == 1);
    }
    
    // Update order_num Data
    public boolean updateOrderNumbers(int postNo, int orderNo) {
    	
    	String sqlStatement = 
    			"update replies set order_no=order_no+1 where post_no=? and order_no>=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, orderNo}) == 1);
    }
    
    public boolean updateOrderNo(int replyId, int orderNo) {
    	
    	String sqlStatement = 
    			"update replies set order_no=? where reply_id=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {orderNo, replyId}) == 1);
    }
    
    // Delete Data
    public boolean delete(int replyId) {
    	
    	String sqlStatement = "update replies set content=? where reply_id=?";
    	
    	String deletedContent = "삭제된 댓글입니다.";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {deletedContent, replyId}) == 1);
    }
    
    public boolean like(Reply reply) {
    	int replyId = reply.getReplyId();
    	int like = reply.getLike()+1;
    	
    	String sqlStatement;
    	if(like >= 30 && !reply.isBest()) {
    		sqlStatement = "update replies set replies.like=?, is_best=? where reply_id=?";
    		return (jdbcTemplate.update(sqlStatement, new Object[] {like, true, replyId}) == 1);
    	} else {
    		sqlStatement = "update replies set replies.like=? where reply_id=?";
    		return (jdbcTemplate.update(sqlStatement, new Object[] {like, replyId}) == 1);
    	}
    }
    
    public boolean unlike(Reply reply) {
    	int replyId = reply.getReplyId();
    	int unlike = reply.getUnlike()+1;
    	
    	String sqlStatement =
    			"update replies set unlike=? where reply_id=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {unlike, replyId}) == 1);
    }
    
    public int getCurrentOrderNo(int postNo) {
    	String sqlStatement = "select max(order_no) from replies where post_no=?";
    	
    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, Integer.class);
    }
    
    public int getCurrentOrderNo(int postNo, int groupNo) {
    	String sqlStatement = "select max(order_no) from replies where post_no=? and group_no=?";
    	
    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo, groupNo}, Integer.class);
    }
    
    public int getCurrentGroupNo(int postNo) {
    	String sqlStatement = "select max(group_no) from replies where post_no=?";
    	
    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, Integer.class);
    }
    
}
