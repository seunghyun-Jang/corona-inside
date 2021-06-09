package kr.ac.hansung.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.identifier.SearchTarget;
import kr.ac.hansung.model.Post;
import kr.ac.hansung.model.PostLikeUser;
import kr.ac.hansung.model.Reply;

@Repository
@Transactional
public class PostDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Post getPost(int postNo) {
		
		Session session = sessionFactory.getCurrentSession();
		Post post = (Post) session.get(Post.class, postNo);
		
		return post;
	}
	
	public List<Post> getPosts() {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Post posts order by posts desc";
		
		Query<Post> query = session.createQuery(hql, Post.class);
		List<Post> posts = query.getResultList();
		
		return posts;
		
	}
	
	public List<Post> getBestPosts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Post post where post.likeCount>=:count order by post.postNo desc";
		
		
		Query<Post> query = session.createQuery(hql, Post.class);
		query.setParameter("count", 30);
		List<Post> bestPosts = query.getResultList();
		
		return bestPosts;
	}
	
	public List<Post> searchPost(SearchTarget target, String keyword) {
		Session session = sessionFactory.getCurrentSession();
		
		List<Post> result = null;
		
		String hql = null;
		if(target.equals(SearchTarget.COMMENT)) {
			hql = "from Reply reply where reply.content like :keyword";
			Query<Reply> replyQuery = session.createQuery(hql, Reply.class);
			replyQuery.setParameter("keyword", "%" + keyword + "%");
			List<Reply> searchedList = replyQuery.getResultList();
			if(!searchedList.isEmpty()) {
				HashSet<Integer> resultHashSet = new HashSet<>();
				for(Reply reply : searchedList) {
					resultHashSet.add(reply.getPostNo());
				}
				List<Integer> resultPostNoList = new ArrayList<>(resultHashSet);
				Collections.sort(resultPostNoList, Collections.reverseOrder());
				result = new ArrayList<>();
				for(int index : resultPostNoList) {
					result.add(getPost(index));
				}
			}
		} else {
			if(target.equals(SearchTarget.TITLE_CONTENT))
				hql = "from Post post where post.title like :keyword or post.content like :keyword order by post.postNo desc";
			else if(target.equals(SearchTarget.TITLE))
				hql = "from Post post where post.title like :keyword order by post.postNo desc";
			else if(target.equals(SearchTarget.CONTENT))
				hql = "from Post post where post.content like :keyword order by post.postNo desc";
			else if(target.equals(SearchTarget.NICKNAME))
				hql = "from Post post where post.author like :keyword order by post.postNo desc";
			Query<Post> query = session.createQuery(hql, Post.class);
			query.setParameter("keyword", "%" + keyword + "%");
			result = query.getResultList();
		}
		
		return result;
	}
	
	public void insert(Post post) {
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(post);
        session.flush();
	}
	
	public void update(Post post) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(post);
		session.flush();
	}
	
	public void delete(Post post) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(post);
		session.flush();
	}
	
	public void like(Post post) {
		Session session = sessionFactory.getCurrentSession();
		post.setLikeCount(post.getLikeCount()+1);
		session.saveOrUpdate(post);
		session.flush();
	}
	
	public void unlike(Post post) {
		Session session = sessionFactory.getCurrentSession();
		post.setUnlikeCount(post.getUnlikeCount()+1);
		session.saveOrUpdate(post);
		session.flush();
	}
	
	public int getCurrentPostNo() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(post.postNo) from Post post";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		
		List<Integer> results = query.getResultList();
		if (!results.isEmpty()) {
			int currentPostNo = (int) results.get(0);
			return currentPostNo;
		}
		
		return 0;
	}

	public boolean isAlreadyLiked(int userId, int postNo) {

		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from PostLikeUser plu where plu.postNo=:postNo and plu.userId=:userId";
		
		Query<Long> query = session.createQuery(hql, Long.class);
		query.setParameter("userId", userId);
		query.setParameter("postNo", postNo);
		long resultList = query.getSingleResult();
		
		if(resultList == 0) return false;
		else return true;
	}

	public void insertPostLikeUser(int userId, int postNo, boolean isLike) {
		PostLikeUser pul = new PostLikeUser();
		pul.setPostNo(postNo);
		pul.setUserId(userId);
		pul.setLike(isLike);
		
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(pul);
        session.flush();
	}

}
