package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
				reply.setPostNo(rs.getInt("postNo"));
				reply.setGroupNo(rs.getInt("group_num"));
				reply.setParentId(rs.getInt("parent_id"));
				reply.setOrderNo(rs.getInt("order_num"));
				reply.setAuthor(rs.getString("author"));
				reply.setDate(rs.getString("date").toString());
				reply.setContent(rs.getString("content"));
				
				return reply;
			}
    	});
    }
    
    // Return Replies
    public List<Reply> getReplies(int postNo) {
    	
    	String sqlStatement = "select * from replies where postNo=? order by order_num";
    	return jdbcTemplate.query(sqlStatement, new Object[] {postNo}, new RowMapper<Reply>() {

			@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Reply reply = new Reply();
				
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setPostNo(rs.getInt("postNo"));
				reply.setGroupNo(rs.getInt("group_num"));
				reply.setParentId(rs.getInt("parent_id"));
				reply.setOrderNo(rs.getInt("order_num"));
				reply.setAuthor(rs.getString("author"));
				reply.setDate(rs.getString("date").toString());
				reply.setContent(rs.getString("content"));
				
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
    	
    	String sqlStatement = 
    			"insert into replies (postNo, group_num, parent_id, depth, order_num, author, content) values (?,?,?,?,?,?,?)";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, groupNo, parentId, orderNo, author, content}) == 1);
    }
    
    // Update order_num Data
    public boolean updateOrderNo(Reply reply) {
    	
    	int replyId = reply.getReplyId();
    	int orderNo = reply.getOrderNo();
    	
    	String sqlStatement = 
    			"update replies set order_num=? where reply_id=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {orderNo, replyId}) == 1);
    }
    
    // Delete Data
    public boolean delete(int replyId) {
    	
    	String sqlStatement = "update replies set content=? where reply_id=?";
    	
    	String deletedContent = "삭제된 댓글입니다.";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {deletedContent, replyId}) == 1);
    }
    
}
