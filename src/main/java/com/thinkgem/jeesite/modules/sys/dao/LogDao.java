/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.dto.LogDto;
import com.thinkgem.jeesite.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

	/**
	 * @version: 
	 * @Description:查询登录记录
	 * @author: ljk  
	 * @date: 2019年3月21日 上午10:57:05
	 */
	public List<LogDto> findLogin(LogDto logDto);
	/**
	 * @version: 
	 * @Description:  查询过去x天的登录次数
	 * @author: ljk  
	 * @date: 2019年4月13日 上午1:05:43
	 */
	public List<Map<String,Integer>> findLoginPast(int day);
	/**
	 * @version: 
	 * @Description: 查询某天各时间段登录情况 
	 * @author: ljk  
	 * @date: 2019年4月15日 上午12:48:16
	 */
	public List findLoginHor(@Param("date")String date);
	/**
	 * @version: 
	 * @Description: 根据时间段统计登录次数
	 * @author: ljk  
	 * @date: 2019年5月3日 下午9:48:26
	 */
	public List<Map<String,Integer>> findLoginByTime(Log log);
}
