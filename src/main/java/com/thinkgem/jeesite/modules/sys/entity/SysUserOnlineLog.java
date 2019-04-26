/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 用户在线记录Entity
 * @author ljk
 * @version 2019-04-08
 */
public class SysUserOnlineLog extends DataEntity<SysUserOnlineLog> {
	
	private static final long serialVersionUID = 1L;
	private String loginName;		// login_name
	private long loginTime;		// login_time
	private long logoutTime;		// logout_time
	private Date upadteDate;		// upadte_date
	private Double onlineHours;		// online_hours
	
	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期
	
	public SysUserOnlineLog() {
		super();
	}

	public SysUserOnlineLog(String id){
		super(id);
	}

	@Length(min=1, max=100, message="login_name长度必须介于 1 和 100 之间")
	@ExcelField(title="登录名", align=2, sort=10)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	
	public long getLoginTime() {
		return loginTime;
	}
	@ExcelField(title="登录时间", type=0, align=1, sort=20)
	public Date getFLoginTime() {
		Date d = new Date();
		d.setTime(loginTime);
		return d;
	}

	public void setLoginTime(long loginTime) {
		this.loginTime = loginTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	
	public long getLogoutTime() {
		return logoutTime;
	}
	@ExcelField(title="退出时间", type=0, align=1, sort=30)
	public Date getFLogoutTime() {
		Date d = new Date();
		d.setTime(logoutTime);
		return d;
	}
	public void setLogoutTime(long logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpadteDate() {
		return upadteDate;
	}

	public void setUpadteDate(Date upadteDate) {
		this.upadteDate = upadteDate;
	}
	@ExcelField(title="在线时长", align=2, sort=10)
	public Double getOnlineHours() {
		return onlineHours;
	}

	public void setOnlineHours(Double onlineHours) {
		this.onlineHours = onlineHours;
	}

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
	
}