/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface UserDao extends CrudDao<User> {
	
	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	public User getByLoginName(User user);

	/**
	 * 通过OfficeId获取用户列表，仅返回用户id和name（树查询用户时用）
	 * @param user
	 * @return
	 */
	public List<User> findUserByOfficeId(User user);
	
	/**
	 * 查询全部用户数目
	 * @return
	 */
	public long findAllCount(User user);
	
	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	public int updatePasswordById(User user);
	
	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(User user);

	/**
	 * 删除用户角色关联数据
	 * @param user
	 * @return
	 */
	public int deleteUserRole(User user);
	
	/**
	 * 插入用户角色关联数据
	 * @param user
	 * @return
	 */
	public int insertUserRole(User user);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);
	/**
	 * @version: 
	 * @Description: 禁用账号 
	 * @author: ljk  
	 * @date: 2019年3月29日 上午2:08:30
	 */
	public int disable(User user);
	/**
	 * @version: 
	 * @Description: 查询用户地区信息  
	 * @author: ljk  
	 * @date: 2019年4月14日 上午5:49:17
	 */
	public List getUserAddress();
	/**
	 * @version: 
	 * @Description: 统计用户性别 
	 * @author: ljk  
	 * @date: 2019年4月24日 上午3:18:19
	 */
	public List<Map<String,Integer>> findUserSex();
	/**
	 * @version: 
	 * @Description: 统计用户年龄 
	 * @author: ljk  
	 * @date: 2019年4月24日 上午4:01:08
	 */
	public List<Map<String, Integer>> findUserAge();

}
