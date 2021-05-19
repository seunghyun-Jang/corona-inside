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
	
//	private JdbcTemplate jdbcTemplate;
//
//	@Autowired
//    public void setDataSource(DataSource dataSource) {
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
//    }
//    	
//    public int getRowCount() {
//    	
//    	String sqlStatement = "select count(*) from posts";
//    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
//    	
//    }
	
	public Post getPost(int postNo) {
		
		Session session = sessionFactory.getCurrentSession();
		Post post = (Post) session.get(Post.class, postNo);
		
		return post;
	}
    
//    // Return 1 Post
//    public Post getPost(int postNo) {
//    	
//    	String sqlStatement = "select * from posts where post_no=?";
//    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, 
//    			new RowMapper<Post>() {
//
//			@Override
//			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Post post = new Post();
//				
//				post.setPostNo(rs.getInt("post_no"));
//				post.setTitle(rs.getString("title"));
//				post.setAuthor(rs.getString("author"));
//				post.setDate(rs.getDate("date").toString());
//				post.setContent(rs.getString("content"));
//				post.setLike(rs.getInt("like"));
//				post.setUnlike(rs.getInt("unlike"));
//				
//				return post;
//			}
//    		
//    	});
//    	
//    }
	
	public List<Post> getPosts() {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Post posts order by posts desc";
		
		Query<Post> query = session.createQuery(hql, Post.class);
		List<Post> posts = query.getResultList();
		
		return posts;
		
	}
    
//    // Return Posts
//    public List<Post> getPosts() {
//    	
//    	String sqlStatement = "select * from posts order by post_no desc";
//    	return jdbcTemplate.query(sqlStatement,	new RowMapper<Post>() {
//
//			@Override
//			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Post post = new Post();
//				
//				post.setPostNo(rs.getInt("post_no"));
//				post.setTitle(rs.getString("title"));
//				post.setAuthor(rs.getString("author"));
//				post.setDate(rs.getDate("date").toString());
//				post.setContent(rs.getString("content"));
//				post.setLike(rs.getInt("like"));
//				post.setUnlike(rs.getInt("unlike"));
//				
//				return post;
//			}
//    		
//    	});
//    	
//    }
	
	public List<Post> getBestPosts() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Post post where post.likeCount>=:count order by post.postNo desc";
		
		
		Query<Post> query = session.createQuery(hql, Post.class);
		query.setParameter("count", 30);
		List<Post> bestPosts = query.getResultList();
		
		return bestPosts;
	}
    
//	public List<Post> getBestPosts() {
//    	
//    	String sqlStatement = "select * from posts where posts.like>=? order by post_no desc";
//    	return jdbcTemplate.query(sqlStatement,	new Object[] {30},new RowMapper<Post>() {
//
//			@Override
//			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
//				
//				Post post = new Post();
//				
//				post.setPostNo(rs.getInt("post_no"));
//				post.setTitle(rs.getString("title"));
//				post.setAuthor(rs.getString("author"));
//				post.setDate(rs.getDate("date").toString());
//				post.setContent(rs.getString("content"));
//				post.setLike(rs.getInt("like"));
//				post.setUnlike(rs.getInt("unlike"));
//				
//				return post;
//			}
//    		
//    	});
//    	
//    }
	
	public void insert(Post post) {
		Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(post);
        session.flush();
	}
    
//    // Insert Data
//    public boolean insert(Post post) {
//    	
//    	String title = post.getTitle();
//    	String author = post.getAuthor();
//    	String content = post.getContent();
//    	
//    	String sqlStatement = 
//    			"insert into posts (title, author, content) values (?,?,?)";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {title, author, content}) == 1);
//    }
	
	public void update(Post post) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(post);
		session.flush();
	}
    
//    // Update Data
//    public boolean update(Post post) {
//    	
//    	int postNo = post.getPostNo();
//    	String content = post.getContent();
//    	
//    	String sqlStatement = 
//    			"update posts set content=? where post_no=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {content, postNo}) == 1);
//    }
	
	public void delete(Post post) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(post);
		session.flush();
	}
    
//    // Delete Data
//    public boolean delete(int postNo) {
//    	
//    	String sqlStatement = "delete from posts where post_no=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo}) == 1);
//    }
	
	public void like(Post post) {
		Session session = sessionFactory.getCurrentSession();
		post.setLikeCount(post.getLikeCount()+1);
		session.saveOrUpdate(post);
		session.flush();
	}
    
//    public boolean like(Post post) {
//    	int postNo = post.getPostNo();
//    	int like = post.getLike()+1;
//    	
//    	String sqlStatement =
//    			"update posts set posts.like=? where post_no=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {like, postNo}) == 1);
//    }
	
	public void unlike(Post post) {
		Session session = sessionFactory.getCurrentSession();
		post.setUnlikeCount(post.getUnlikeCount()+1);
		session.saveOrUpdate(post);
		session.flush();
	}
	
//    public boolean unlike(Post post) {
//    	int postNo = post.getPostNo();
//    	int unlike = post.getUnlike()+1;
//    	
//    	String sqlStatement =
//    			"update posts set unlike=? where post_no=?";
//    	
//    	return (jdbcTemplate.update(sqlStatement, new Object[] {unlike, postNo}) == 1);
//    }
	
	public int getCurrentPostNo() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select max(post.postNo) from Post post";
		
		Query<Integer> query = session.createQuery(hql, Integer.class);
		int currentPostNo = query.getFirstResult();
		
		return currentPostNo;
	}
    
//    public int getCurrentPostNo() {
//    	String sqlStatement =
//    			"select max(post_no) from posts";
//    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
//    }

}
