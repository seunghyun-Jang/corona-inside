package kr.ac.hansung.dto.Covid19Sido;

import java.util.List;


public class HeaderDTO {
	
	
	private String resultCode;

	private String resultMsg;
	
	public HeaderDTO() {
		super();
	}

	public HeaderDTO(HeaderDTO dto) {
		super();
		this.resultCode = dto.resultCode;
		this.resultMsg = dto.resultMsg;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	@Override
	public String toString() {
		return "HeaderDTO [resultCode=" + resultCode + ", resultMsg=" + resultMsg + "]";
	}
	
}
