package kr.ac.hansung.model;

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
public class Reply {
	
	private int replyId;
	
	private int postNo;
	private int groupNo;
	private int parentId;
	private int orderNo;
	private int like;
	private int unlike;
	
	private String author;
	private String date;
	private String parentAuthor;
	
	@Size(min=2, max=200, message="내용은 2자 이상, 200자 이하로 적어주세요.")
	@NotEmpty(message="The content cannot be empty")
	private String content;

}
