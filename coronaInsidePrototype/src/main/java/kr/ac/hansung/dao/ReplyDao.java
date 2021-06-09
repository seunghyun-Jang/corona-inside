package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.model.Reply;

@Repository
@Transactional
public class ReplyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Reply getReply(int replyId) {
		
		Session session = sessionFactory.getCurrentSession();
		Reply reply = (Reply) session.get(Reply.class, replyId);
		
		return reply;
	}
	
	public List<Reply> getReplies(int postNo) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Reply replies where replies.postNo=:postNo order by replies.orderNo";
		
		Query<Reply> query = session.createQuery(hql, Reply.class);
		query.setParameter("postNo", postNo);
		List<Reply> replies = query.getResultList();
		
		return replies;
		
	}
	
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
	
	public void insert(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(reply);
        session.flush();
	}
	
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
	
	public void like(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		int likeCount = reply.getLikeCount()+1;
		reply.setLikeCount(likeCount);
		
		session.saveOrUpdate(reply);
		session.flush();
	}
	
	public void unlike(Reply reply) {
		Session session = sessionFactory.getCurrentSession();
		reply.setUnlikeCount(reply.getUnlikeCount()+1);
		session.saveOrUpdate(reply);
		session.flush();
	}
	
	public int getCurrentOrderNo(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.orderNo) from Reply reply where reply.postNo=:postNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		List<Integer> results = query.getResultList();
		int currentOrderNo = results.get(0);
		
		return currentOrderNo;
	}
	
	public int getCurrentOrderNo(int postNo, int groupNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.orderNo) from Reply reply where reply.postNo=:postNo and reply.groupNo=:groupNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		query.setParameter("groupNo", groupNo);
		List<Integer> results = query.getResultList();
		int currentOrderNo = results.get(0);
		
		return currentOrderNo;
	}
	
	public int getCurrentGroupNo(int postNo) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(reply.groupNo) from Reply reply where reply.postNo=:postNo";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("postNo", postNo);
		List<Integer> results = query.getResultList();
		int currentGroupNo = results.get(0);
		
		return currentGroupNo;
	}

	public List<Reply> getListAfterOrderNo(int orderNo) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Reply reply where reply.orderNo>=:orderNo";
		
		Query<Reply> query = session.createQuery(hql, Reply.class);
		query.setParameter("orderNo", orderNo);
		List<Reply> resultList = query.getResultList();
		
		return resultList;
	}
    
}
