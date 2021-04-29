package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.PostDao;
import kr.ac.hansung.model.Post;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	public List<Post> getCurrent() {
		return postDao.getPosts();
	}
	
	public List<Post> getBestPosts() {
		return postDao.getBestPosts();
	}
	
	public Post getPost(int postNo) {
		return postDao.getPost(postNo);
	}

	public void insert(Post post) {
		postDao.insert(post);
	}
	
	public void update(Post post) {
		postDao.update(post);
	}
	
	public void delete(int postNo) {
		postDao.delete(postNo);
	}
	
	public void like(Post post) {
		postDao.like(post);
	}
	
	public void unlike(Post post) {
		postDao.unlike(post);
	}
	
	public int getCurrentPostNo() {
		return postDao.getCurrentPostNo();
	}

}
