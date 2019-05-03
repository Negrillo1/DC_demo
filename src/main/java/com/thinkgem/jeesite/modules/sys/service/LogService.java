/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.dao.LogDao;
import com.thinkgem.jeesite.modules.sys.dto.LogDto;
import com.thinkgem.jeesite.modules.sys.entity.Log;

/**
 * 日志Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

	@Autowired
	private LogDao logDao;
	
	public Page<Log> findPage(Page<Log> page, Log log) {
		
		// 设置默认时间范围，默认当前月
		if (log.getBeginDate() == null){
			log.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (log.getEndDate() == null){
			log.setEndDate(DateUtils.addMonths(log.getBeginDate(), 1));
		}
		
		return super.findPage(page, log);
		
	}
	//查询登录记录
	public Page<LogDto> findLogin(Page<LogDto> pageDto, LogDto logDto) {
		//设置默认时间范围，默认当前月
		if (logDto.getBeginDate() == null){
			logDto.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (logDto.getEndDate() == null){
			logDto.setEndDate(DateUtils.addMonths(logDto.getBeginDate(), 1));
		}
		logDto.setPage(pageDto);
		pageDto.setList(logDao.findLogin(logDto));
		return pageDto;
	}
	/**
	 * @version: 
	 * @Description: 过去x天登录情况
	 * @author: ljk  
	 * @date: 2019年4月13日 上午12:46s:44
	 */
	public List<Map<String,Integer>> findLoginPast(int i) {
		// TODO Auto-generated method stub
		List<Map<String,Integer>> list = logDao.findLoginPast(i);	
		return list;
	}
	/**
	 * @version: 
	 * @Description: 根据时间段统计登录次数 
	 * @author: ljk  
	 * @date: 2019年5月3日 下午9:51:09
	 */
	public List<Map<String,Integer>> findLoginByTime(Log log) {
		if (log.getBeginDate() == null){
			log.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (log.getEndDate() == null){
			log.setEndDate(DateUtils.addMonths(log.getBeginDate(), 1));
		}
		List<Map<String,Integer>> list = logDao.findLoginByTime(log);
		return list;
	}
	/**
	 * @version: 
	 * @Description: 查询某天各时间段登录情况 
	 * @author: ljk  
	 * @date: 2019年4月15日 上午12:46:51
	 */
	public List<Map<String,String>> findLoginHor(String date) {
		// TODO Auto-generated method stub
		if(date == null) {
			Date d = new Date();
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			date=format.format(d).toString();
		}
		List map = logDao.findLoginHor(date);
		return map;
	}
	
}
