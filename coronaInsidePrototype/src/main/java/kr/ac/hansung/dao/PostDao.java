package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.model.Post;

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
		int currentPostNo = query.getFirstResult();
		
		return currentPostNo;
	}

}
