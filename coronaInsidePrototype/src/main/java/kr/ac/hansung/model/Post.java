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
public class Post {
	
	private int postNo;
	
	@NotEmpty(message="제목을 입력해주세요")
	private String title;
	
	@Size(min=2, max=15, message="Author must be between 2 and 15 chars")
	@NotEmpty(message="The author cannot be empty")
	private String author;
	
	private String date;
	
	@Size(min=2, max=500, message="내용은 2자 이상, 500자 이하로 적어주세요.")
	@NotEmpty(message="The content cannot be empty")
	private String content;
	
	private int like;
	private int unlike;

}
