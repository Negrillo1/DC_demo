package com.thinkgem.jeesite.modules.sys.entity;

import java.sql.Timestamp;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;
/**
 * @version: 
 * @Description:  学生实体类
 * @author: ljk  
 * @date: 2019年4月25日 下午1:30:44
 */
public class SchoolUser extends DataEntity<SchoolUser>{
	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String password;
	private String sex;
	private int age;
	private Date createTime;
	private Date beginDate;
	private Date endDate;
	

	public SchoolUser(String userName, String password, String sex, int age, Date createTime) {
		super();
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.age = age;
		this.createTime = createTime;
	}
	
	public SchoolUser() {
		// TODO Auto-generated constructor stub
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
