package kr.ac.hansung.dto.Covid19Sido;

import java.util.List;


public class ResponseDTO {
	
	
	private HeaderDTO header;

    private BodyDTO body;
	
	public ResponseDTO() {
		super();
	}

	public ResponseDTO(ResponseDTO dto) {
		super();
		this.header = dto.header;
		this.body = dto.body;
	}

	public HeaderDTO getHeader() {
		return header;
	}

	public void setHeader(HeaderDTO header) {
		this.header = header;
	}

	public BodyDTO getBody() {
		return body;
	}

	public void setBody(BodyDTO body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "ResponseDTO [header=" + header + ", body=" + body + "]";
	}

	
}
