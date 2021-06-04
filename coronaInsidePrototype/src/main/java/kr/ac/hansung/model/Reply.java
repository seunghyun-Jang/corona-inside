package kr.ac.hansung.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
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
@Table(name="replies")
public class Reply {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="reply_id")
	private int replyId;
	
	@Column(name="post_no")
	private int postNo;
	@Column(name="group_no")
	private int groupNo;
	@Column(name="parent_id")
	private int parentId;
	@Column(name="order_no")
	private int orderNo;
	@Column(name="like_count")
	private int likeCount;
	@Column(name="unlike_count")
	private int unlikeCount;
	
	private String author;
	private String date;
	private String parentAuthor;
	
	@Size(min=2, max=200, message="내용은 2자 이상, 200자 이하로 적어주세요.")
	@NotEmpty(message="The content cannot be empty")
	private String content;
	
	@Column(name="is_best")
	private boolean isBest;

}
