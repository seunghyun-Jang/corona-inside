package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Post;

@Repository
public class PostDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    	
    public int getRowCount() {
    	
    	String sqlStatement = "select count(*) from posts";
    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
    	
    }
    
    // Return 1 Post
    public Post getPost(int postNo) {
    	
    	String sqlStatement = "select * from posts where post_no=?";
    	return jdbcTemplate.queryForObject(sqlStatement, new Object[] {postNo}, 
    			new RowMapper<Post>() {

			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Post post = new Post();
				
				post.setPostNo(rs.getInt("post_no"));
				post.setTitle(rs.getString("title"));
				post.setAuthor(rs.getString("author"));
				post.setDate(rs.getDate("date").toString());
				post.setContent(rs.getString("content"));
				post.setLike(rs.getInt("like"));
				post.setUnlike(rs.getInt("unlike"));
				
				return post;
			}
    		
    	});
    	
    }
    
    // Return Posts
    public List<Post> getPosts() {
    	
    	String sqlStatement = "select * from posts order by post_no desc";
    	return jdbcTemplate.query(sqlStatement,	new RowMapper<Post>() {

			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Post post = new Post();
				
				post.setPostNo(rs.getInt("post_no"));
				post.setTitle(rs.getString("title"));
				post.setAuthor(rs.getString("author"));
				post.setDate(rs.getDate("date").toString());
				post.setContent(rs.getString("content"));
				post.setLike(rs.getInt("like"));
				post.setUnlike(rs.getInt("unlike"));
				
				return post;
			}
    		
    	});
    	
    }
    
public List<Post> getBestPosts() {
    	
    	String sqlStatement = "select * from posts where posts.like>=? order by post_no desc";
    	return jdbcTemplate.query(sqlStatement,	new Object[] {30},new RowMapper<Post>() {

			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Post post = new Post();
				
				post.setPostNo(rs.getInt("post_no"));
				post.setTitle(rs.getString("title"));
				post.setAuthor(rs.getString("author"));
				post.setDate(rs.getDate("date").toString());
				post.setContent(rs.getString("content"));
				post.setLike(rs.getInt("like"));
				post.setUnlike(rs.getInt("unlike"));
				
				return post;
			}
    		
    	});
    	
    }
    
    // Insert Data
    public boolean insert(Post post) {
    	
    	String title = post.getTitle();
    	String author = post.getAuthor();
    	String content = post.getContent();
    	
    	String sqlStatement = 
    			"insert into posts (title, author, content) values (?,?,?)";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {title, author, content}) == 1);
    }
    
    // Update Data
    public boolean update(Post post) {
    	
    	int postNo = post.getPostNo();
    	String content = post.getContent();
    	
    	String sqlStatement = 
    			"update posts set content=? where post_no=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {content, postNo}) == 1);
    }
    
    // Delete Data
    public boolean delete(int postNo) {
    	
    	String sqlStatement = "delete from posts where post_no=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {postNo}) == 1);
    }
    
    public boolean like(Post post) {
    	int postNo = post.getPostNo();
    	int like = post.getLike()+1;
    	
    	String sqlStatement =
    			"update posts set posts.like=? where post_no=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {like, postNo}) == 1);
    }
    
    public boolean unlike(Post post) {
    	int postNo = post.getPostNo();
    	int unlike = post.getUnlike()+1;
    	
    	String sqlStatement =
    			"update posts set unlike=? where post_no=?";
    	
    	return (jdbcTemplate.update(sqlStatement, new Object[] {unlike, postNo}) == 1);
    }
    
    public int getCurrentPostNo() {
    	String sqlStatement =
    			"select max(post_no) from posts";
    	return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
    }

}
