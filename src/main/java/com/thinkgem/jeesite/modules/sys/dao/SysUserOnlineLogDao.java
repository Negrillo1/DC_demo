/**
\ * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysUserOnlineLog;

/**
 * 用户在线记录DAO接口
 * @author ljk
 * @version 2019-04-08
 */
@MyBatisDao
public interface SysUserOnlineLogDao extends CrudDao<SysUserOnlineLog> {

	/**
	 * 
	 * @version:  
	 * @Description: 条件查询
	 * @author: ljk  
	 * @date: 2019年4月8日 下午4:10:25
	 * @param:       
	 * @return: void
	 */
	SysUserOnlineLog findBy(SysUserOnlineLog sysUserOnlineLog);
	
}