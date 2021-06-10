package kr.ac.hansung.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString

@Entity
@Table(name="posts")
public class Post {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="post_no")
	private int postNo;
	
	@Size(min=2, max=40, message="제목은 2자 이상, 40자 이하로 적어주세요.")
	@NotEmpty(message="제목을 입력해주세요")
	private String title;
	
	@Size(min=2, max=15, message="Author must be between 2 and 15 chars")
	@NotEmpty(message="The author cannot be empty")
	private String author;
	
	private String username;
	
	private Date date;
	
	@Transient
	private String datetime;
	
	@Size(min=2, max=500, message="내용은 2자 이상, 500자 이하로 적어주세요.")
	@NotEmpty(message="The content cannot be empty")
	private String content;
	
	@Column(name="like_count")
	private int likeCount;
	@Column(name="unlike_count")
	private int unlikeCount;

}
