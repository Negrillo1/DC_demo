/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.SysUserOnlineLog;
import com.thinkgem.jeesite.modules.sys.dao.SysUserOnlineLogDao;

/**
 * 用户在线记录Service
 * @author ljk
 * @version 2019-04-08
 */
@Service
@Transactional(readOnly = true)
public class SysUserOnlineLogService extends CrudService<SysUserOnlineLogDao, SysUserOnlineLog> {
	
	@Autowired
	private SysUserOnlineLogDao sysUserOnlineLogDao;
	public SysUserOnlineLog get(String id) {
		return super.get(id);
	}
	
	public List<SysUserOnlineLog> findList(SysUserOnlineLog sysUserOnlineLog) {
		return super.findList(sysUserOnlineLog);
	}
	
	public Page<SysUserOnlineLog> findPage(Page<SysUserOnlineLog> page, SysUserOnlineLog sysUserOnlineLog) {
		return super.findPage(page, sysUserOnlineLog);
	}
	
	@Transactional(readOnly = false)
	public void save(SysUserOnlineLog sysUserOnlineLog) {
		super.save(sysUserOnlineLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysUserOnlineLog sysUserOnlineLog) {
		super.delete(sysUserOnlineLog);
	}
	@Transactional(readOnly = false)
	public SysUserOnlineLog findBy(SysUserOnlineLog sysUserOnlineLog) {
		return sysUserOnlineLogDao.findBy(sysUserOnlineLog);
	}
	
}