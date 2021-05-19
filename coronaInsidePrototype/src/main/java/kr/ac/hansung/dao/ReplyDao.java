package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.model.Post;
import kr.ac.hansung.model.Reply;

@Repository
@Transactional
public class ReplyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
//	private JdbcTemplate jdbcTemplate;
//
//	@Autowired
//    public void setDataSource(DataSource dataSource) {
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
//    }
//    	
//    public int getRowCount() {
//    	
//    	String sqlStatement = "select count(*) from replies";
//    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
//    	
//    }
	
	public Reply getReply(int replyId) {
		
		Session session = sessionFactory.getCurrentSession();
		Reply reply = (Reply) session.get(Reply.class, replyId);
		
		return reply;
	}
    
//    public Reply getReply(int replyId) {
//    	String sqlStatement = "select * from replies where reply_id=?";
//    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {replyId}, new RowMapper<Reply>() {
//    		@Override
//			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Reply reply = new Reply();
//				
//				reply.setReplyId(rs.getInt("reply_id"));
//				reply.setPostNo(rs.getInt("post_no"));
//				reply.setGroupNo(rs.getInt("group_no"));
//				reply.setParentId(rs.getInt("parent_id"));
//				reply.setOrderNo(rs.getInt("order_no"));
//				reply.setAuthor(rs.getString("author"));
//				reply.setDate(rs.getString("date").toString());
//				reply.setContent(rs.getString("content"));
//				reply.setLikeCount(rs.getInt("like_count"));
//				reply.setUnlikeCount(rs.getInt("unlike_count"));
//				reply.setBest(rs.getBoolean("is_best"));
//				
//				return reply;
//			}
//    	});
//    }
	
	public List<Reply> getReplies(int postNo) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Reply replies where replies.postNo=:postNo order by replies.orderNo";
		
		Query<Reply> query = session.createQuery(hql, Reply.class);
		query.setParameter("postNo", postNo);
		List<Reply> replies = query.getResultList();
		
		return replies;
		
	}
    
//    // Return Replies
//    public List<Reply> getReplies(int postNo) {
//    	
//    	String sqlStatement = "select * from replies where post_no=? order by order_no";
//    	return jdbcTemplate.query(sqlStatement, new Object[] {postNo}, new RowMapper<Reply>() {
//
//			@Override
//			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Reply reply = new Reply();
//				
//				reply.setReplyId(rs.getInt("reply_id"));
//				reply.setPostNo(rs.getInt("post_no"));
//				reply.setGroupNo(rs.getInt("group_no"));
//				reply.setParentId(rs.getInt("parent_id"));
//				reply.setOrderNo(rs.getInt("order_no"));
//				reply.setAuthor(rs.getString("author"));
//				reply.setDate(rs.getString("date").toString());
//				reply.setContent(rs.getString("content"));
//				reply.setLikeCount(rs.getInt("like_count"));
//				reply.setUnlikeCount(rs.getInt("unlike_count"));
//				reply.setBest(rs.getBoolean("is_best"));
//				
//				return reply;
//			}
//    		
//    	});
//    	
//    }
	
	public List<Reply> getBestReplies(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Reply replies where replies.postNo=:postNo and replies.isBest=:isBest order by replies.likeCount desc";
		
		
		Query<Reply> query = session.createQuery(hql, Reply.class);
		query.setParameter("postNo", postNo);
		query.setParameter("isBest", true);
		List<Reply> bestReplies = query.getResultList();
		
		return bestReplies;
	}
	
	public List<Reply> getLikeDescReplies(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Reply replies where replies.postNo=:postNo order by replies.likeCount desc";
		
		Query<Reply> query = session.createQuery(hql, Reply.class);
		query.setParameter("postNo", postNo);
		
		List<Reply> replyList = query.getResultList();
		
		return replyList;
	}
	
	
//    public List<Reply> getBestReplies(int postNo) {
//    	String sqlStatement = "select * from replies where post_no=? and is_best=? order by replies.like desc";
//    	return jdbcTemplate.query(sqlStatement, new Object[] {postNo, true}, new RowMapper<Reply>() {
//
//			@Override
//			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Reply reply = new Reply();
//				
//				reply.setReplyId(rs.getInt("reply_id"));
//				reply.setPostNo(rs.getInt("post_no"));
//				reply.setGroupNo(rs.getInt("group_no"));
//				reply.setParentId(rs.getInt("parent_id"));
//				reply.setOrderNo(rs.getInt("order_no"));
//				reply.setAuthor(rs.getString("author"));
//				reply.setDate(rs.getString("date").toString());
//				reply.setContent(rs.getString("content"));
//				reply.setLikeCount(rs.getInt("like_count"));
//				reply.setUnlikeCount(rs.getInt("unlike_count"));
//				reply.setBest(rs.getBoolean("is_best"));
//				
//				return reply;
//			}
//    		
//    	});
//    }
	
	public void insert(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(reply);
        session.flush();
	}
    
//    // Insert Data
//    public boolean insert(Reply reply) {
//    	
//    	int postNo = reply.getPostNo();
//    	int groupNo = reply.getGroupNo();
//    	int parentId = reply.getParentId();
//    	int orderNo = reply.getOrderNo();
//    	String author = reply.getAuthor();
//    	String content = reply.getContent();
//    	
//    	updateOrderNumbers(postNo, orderNo);
//    	
//    	String sqlStatement = 
//    			"insert into replies (post_no, group_no, parent_id, order_no, author, content) values (?,?,?,?,?,?)";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, groupNo, parentId, orderNo, author, content}) == 1);
//    }
    
// // Insert Data
//    public boolean insertBest(Reply reply) {
//    	
//    	int postNo = reply.getPostNo();
//    	int groupNo = reply.getGroupNo();
//    	int parentId = reply.getParentId();
//    	int orderNo = reply.getOrderNo();
//    	String author = reply.getAuthor();
//    	String content = reply.getContent();
//    	int likeCount = reply.getLikeCount()+1;
//    	int unlikeCount = reply.getUnlikeCount();
//    	boolean isBest = true;
//    	
//    	updateOrderNumbers(postNo, orderNo);
//    	
//    	String sqlStatement = 
//    			"insert into replies (post_no, group_no, parent_id, order_no, author, content, like_count, unlike_count, is_best) values (?,?,?,?,?,?,?,?,?)";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, groupNo, parentId, orderNo, author, content, likeCount, unlikeCount, isBest}) == 1);
//    }
    
//    // Update order_num Data
//    public boolean updateOrderNumbers(int postNo, int orderNo) {
//    	
//    	String sqlStatement = 
//    			"update replies set order_no=order_no+1 where post_no=? and order_no>=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo, orderNo}) == 1);
//    }
//    
//    public boolean updateOrderNo(int replyId, int orderNo) {
//    	
//    	String sqlStatement = 
//    			"update replies set order_no=? where reply_id=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {orderNo, replyId}) == 1);
//    }
	
	public void update(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(reply);
		session.flush();
	}
	
	public void delete(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		reply.setContent("삭제된 댓글입니다.");
		session.saveOrUpdate(reply);
		session.flush();
	}
    
//    // Delete Data
//    public boolean delete(int replyId) {
//    	
//    	String sqlStatement = "update replies set content=? where reply_id=?";
//    	
//    	String deletedContent = "삭제된 댓글입니다.";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {deletedContent, replyId}) == 1);
//    }
	
	public void like(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		int likeCount = reply.getLikeCount()+1;
		reply.setLikeCount(likeCount);
		
		session.saveOrUpdate(reply);
		session.flush();
	}
    
//    public boolean like(Reply reply) {
//    	int replyId = reply.getReplyId();
//    	int likeCount = reply.getLikeCount()+1;
//    	
//    	String sqlStatement;
//    	if(likeCount >= 30 && !reply.isBest()) {
//    		sqlStatement = "update replies set like_count=?, is_best=? where reply_id=?";
//    		return (jdbcTemplate.update(sqlStatement, new Object[] {likeCount, true, replyId}) == 1);
//    	} else {
//    		sqlStatement = "update replies set like_count=? where reply_id=?";
//    		return (jdbcTemplate.update(sqlStatement, new Object[] {likeCount, replyId}) == 1);
//    	}
//    }
	
	public void unlike(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		reply.setUnlikeCount(reply.getUnlikeCount()+1);
		session.saveOrUpdate(reply);
		session.flush();
	}
    
//    public boolean unlike(Reply reply) {
//    	int replyId = reply.getReplyId();
//    	int unlikeCount = reply.getUnlikeCount()+1;
//    	
//    	String sqlStatement =
//    			"update replies set unlike_count=? where reply_id=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {unlikeCount, replyId}) == 1);
//    }
	
	public int getCurrentOrderNo(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.orderNo) from Reply reply where reply.postNo=:postNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		int currentPostNo = query.getFirstResult();
		
		return currentPostNo;
	}
    
//    public int getCurrentOrderNo(int postNo) {
//    	String sqlStatement = "select max(order_no) from replies where post_no=?";
//    	
//    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, Integer.class);
//    }
	
	public int getCurrentOrderNo(int postNo, int groupNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.orderNo) from Reply reply where reply.postNo=:postNo and reply.groupNo=:groupNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		query.setParameter("groupNo", groupNo);
		int currentPostNo = query.getFirstResult();
		
		return currentPostNo;
	}
    
//    public int getCurrentOrderNo(int postNo, int groupNo) {
//    	String sqlStatement = "select max(order_no) from replies where post_no=? and group_no=?";
//    	
//    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo, groupNo}, Integer.class);
//    }
	
	public int getCurrentGroupNo(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.groupNo) from Reply reply where reply.postNo=:postNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		int currentPostNo = query.getFirstResult();
		
		return currentPostNo;
	}
    
//    public int getCurrentGroupNo(int postNo) {
//    	String sqlStatement = "select max(group_no) from replies where post_no=?";
//    	
//    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, Integer.class);
//    }
    
}
