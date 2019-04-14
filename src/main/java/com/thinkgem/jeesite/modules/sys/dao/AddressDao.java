package com.thinkgem.jeesite.modules.sys.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface AddressDao {
	/**
	 * @version: 
	 * @Description: 根据用户  
	 * @author: ljk  
	 * @date: 2019年4月14日 下午4:43:19
	 */
	public String getAddress(String username);
	/**
	 * @version: 
	 * @Description: 更新用户地址 
	 * @author: ljk  
	 * @date: 2019年4月14日 下午6:04:31
	 */
	public int updateAddress(@Param("username") String username,@Param("address")  String address);
	/**
	 * @version: 
	 * @Description: 保存用户地址  
	 * @author: ljk  
	 * @date: 2019年4月14日 下午6:20:51
	 */
	public int insertAddress(@Param("username") String username,@Param("address") String address);
}
