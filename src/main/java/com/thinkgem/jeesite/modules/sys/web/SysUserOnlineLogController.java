/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.SysUserOnlineLog;
import com.thinkgem.jeesite.modules.sys.service.SysUserOnlineLogService;

/**
 * 用户在线记录Controller
 * @author ljk
 * @version 2019-04-08
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysUserOnlineLog")
public class SysUserOnlineLogController extends BaseController {

	@Autowired
	private SysUserOnlineLogService sysUserOnlineLogService;
	
	@ModelAttribute
	public SysUserOnlineLog get(@RequestParam(required=false) String id) {
		SysUserOnlineLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysUserOnlineLogService.get(id);
		}
		if (entity == null){
			entity = new SysUserOnlineLog();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysUserOnlineLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysUserOnlineLog sysUserOnlineLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysUserOnlineLog> page = sysUserOnlineLogService.findPage(new Page<SysUserOnlineLog>(request, response), sysUserOnlineLog); 
		model.addAttribute("page", page);
		return "modules/sys/sysUserOnlineLogList";
	}

	@RequiresPermissions("sys:sysUserOnlineLog:view")
	@RequestMapping(value = "form")
	public String form(SysUserOnlineLog sysUserOnlineLog, Model model) {
		model.addAttribute("sysUserOnlineLog", sysUserOnlineLog);
		return "modules/sys/sysUserOnlineLogForm";
	}

	@RequiresPermissions("sys:sysUserOnlineLog:edit")
	@RequestMapping(value = "save")
	public String save(SysUserOnlineLog sysUserOnlineLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysUserOnlineLog)){
			return form(sysUserOnlineLog, model);
		}
		sysUserOnlineLogService.save(sysUserOnlineLog);
		addMessage(redirectAttributes, "保存保存&ldquo;用户在线日志表&rdquo;成功成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysUserOnlineLog/?repage";
	}
	
	@RequiresPermissions("sys:sysUserOnlineLog:edit")
	@RequestMapping(value = "delete")
	public String delete(SysUserOnlineLog sysUserOnlineLog, RedirectAttributes redirectAttributes) {
		sysUserOnlineLogService.delete(sysUserOnlineLog);
		addMessage(redirectAttributes, "删除保存&ldquo;用户在线日志表&rdquo;成功成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysUserOnlineLog/?repage";
	}

}