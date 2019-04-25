package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.supcan.annotation.treelist.cols.SupCol;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
/**
 * @version: 
 * @Description:  用户地区实体类
 * @author: ljk  
 * @date: 2019年4月25日 下午1:30:22
 */
public class UserAddress extends  DataEntity<UserAddress>{

	private static final long serialVersionUID = 1L;
	private String userName;
	private String address;
	
	
	public UserAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserAddress(String id) {
		super(id);
		
	}
	
	public UserAddress(String userName, String address) {
		super();
		this.userName = userName;
		this.address = address;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@SupCol(isUnique="true", isHide="true")
	@ExcelField(title="ID", type=1, align=2, sort=1)
	public String getId() {
		return id;
	}
}
