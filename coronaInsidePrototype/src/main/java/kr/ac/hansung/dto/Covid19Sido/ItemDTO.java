package kr.ac.hansung.dto.Covid19Sido;

import java.util.List;


public class ItemDTO {
	private String defCnt;

    private String isolClearCnt;

    private String localOccCnt;

    private String incDec;

    private String updateDt;

    private String createDt;

    private String gubun;

    private String gubunEn;

    private String deathCnt;

    private String stdDay;

    private String qurRate;

    private String overFlowCnt;

    private String gubunCn;

    private String isolIngCnt;

    private String seq;
  
	
	public ItemDTO() {
		super();
	}

	public ItemDTO(ItemDTO dto) {
		super();
		this.defCnt = dto.defCnt;
		this.isolClearCnt = dto.isolClearCnt;
		this.localOccCnt = dto.localOccCnt;
		this.incDec = dto.incDec;
		this.updateDt = dto.updateDt;
		this.createDt = dto.createDt;
		this.gubun = dto.gubun;
		this.gubunEn = dto.gubunEn;
		this.deathCnt = dto.deathCnt;
		this.stdDay = dto.stdDay;
		this.qurRate = dto.qurRate;
		this.overFlowCnt = dto.overFlowCnt;
		this.gubunCn = dto.gubunCn;
		this.isolIngCnt = dto.isolIngCnt;
		this.seq = dto.seq;
	}

	public String getDefCnt() {
		return defCnt;
	}

	public void setDefCnt(String defCnt) {
		this.defCnt = defCnt;
	}

	public String getIsolClearCnt() {
		return isolClearCnt;
	}

	public void setIsolClearCnt(String isolClearCnt) {
		this.isolClearCnt = isolClearCnt;
	}

	public String getLocalOccCnt() {
		return localOccCnt;
	}

	public void setLocalOccCnt(String localOccCnt) {
		this.localOccCnt = localOccCnt;
	}

	public String getIncDec() {
		return incDec;
	}

	public void setIncDec(String incDec) {
		this.incDec = incDec;
	}

	public String getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}

	public String getCreateDt() {
		return createDt;
	}

	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getGubunEn() {
		return gubunEn;
	}

	public void setGubunEn(String gubunEn) {
		this.gubunEn = gubunEn;
	}

	public String getDeathCnt() {
		return deathCnt;
	}

	public void setDeathCnt(String deathCnt) {
		this.deathCnt = deathCnt;
	}

	public String getStdDay() {
		return stdDay;
	}

	public void setStdDay(String stdDay) {
		this.stdDay = stdDay;
	}

	public String getQurRate() {
		return qurRate;
	}

	public void setQurRate(String qurRate) {
		this.qurRate = qurRate;
	}

	public String getOverFlowCnt() {
		return overFlowCnt;
	}

	public void setOverFlowCnt(String overFlowCnt) {
		this.overFlowCnt = overFlowCnt;
	}

	public String getGubunCn() {
		return gubunCn;
	}

	public void setGubunCn(String gubunCn) {
		this.gubunCn = gubunCn;
	}

	public String getIsolIngCnt() {
		return isolIngCnt;
	}

	public void setIsolIngCnt(String isolIngCnt) {
		this.isolIngCnt = isolIngCnt;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "ItemDTO [defCnt=" + defCnt + ", isolClearCnt=" + isolClearCnt + ", localOccCnt=" + localOccCnt
				+ ", incDec=" + incDec + ", updateDt=" + updateDt + ", createDt=" + createDt + ", gubun=" + gubun
				+ ", gubunEn=" + gubunEn + ", deathCnt=" + deathCnt + ", stdDay=" + stdDay + ", qurRate=" + qurRate
				+ ", overFlowCnt=" + overFlowCnt + ", gubunCn=" + gubunCn + ", isolIngCnt=" + isolIngCnt + ", seq="
				+ seq + "]";
	}

	
}
