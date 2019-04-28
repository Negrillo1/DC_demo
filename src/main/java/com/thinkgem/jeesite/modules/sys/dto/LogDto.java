package com.thinkgem.jeesite.modules.sys.dto;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

public class LogDto extends DataEntity<LogDto>{
	private static final long serialVersionUID = 1L;
	private String loginName;
	private Date createDate;
	private String remoteAddr;
	
	private Date beginDate;
	private Date endDate;
	
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@ExcelField(title="登录名", align=2, sort=10)
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@ExcelField(title="登录时间", type=0, align=1, sort=20)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@ExcelField(title="登录IP", align=2, sort=30)
	public String getRemoteAddr() {
		return remoteAddr;
	}
	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	public LogDto(String loginName, Date createDate, String remoteAddr) {
		super();
		this.loginName = loginName;
		this.createDate = createDate;
		this.remoteAddr = remoteAddr;
	}
	public LogDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LogDto(String id) {
		super(id);
		// TODO Auto-generated constructor stub
	} 
}
