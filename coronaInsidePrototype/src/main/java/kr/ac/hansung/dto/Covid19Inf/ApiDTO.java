package kr.ac.hansung.dto.Covid19Inf;

import java.util.Arrays;
import java.util.List;


public class ApiDTO {
	
	
	private ResponseDTO response;
	
	public ApiDTO() {
		super();
	}

	public ApiDTO(ApiDTO dto) {
		super();
		this.response = dto.response;
	}

	public ResponseDTO getResponse() {
		return response;
	}

	public void setResponse(ResponseDTO response) {
		this.response = response;
	}

	@Override
	public String toString() {
		return "ApiDTO [response=" + response + "]";
	}

	
	
}
