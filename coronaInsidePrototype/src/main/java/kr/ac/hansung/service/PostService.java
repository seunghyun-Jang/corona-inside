package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.PostDao;
import kr.ac.hansung.identifier.SearchTarget;
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
	
	public List<Post> searchPost(String target, String keyword) {
		
		List<Post> result = null;
		
		if(target.equals("title_content")) 
			result = postDao.searchPost(SearchTarget.TITLE_CONTENT, keyword);
		else if(target.equals("title"))
			result = postDao.searchPost(SearchTarget.TITLE, keyword);
		else if(target.equals("content"))
			result = postDao.searchPost(SearchTarget.CONTENT, keyword);
		else if(target.equals("comment"))
			result = postDao.searchPost(SearchTarget.COMMENT, keyword);
		else if(target.equals("nickname"))
			result = postDao.searchPost(SearchTarget.NICKANME, keyword);
		
		return result;
	}

	public void insert(Post post) {
		postDao.insert(post);
	}
	
	public void update(Post post) {
		postDao.update(post);
	}
	
	public void delete(Post post) {
		postDao.delete(post);
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
