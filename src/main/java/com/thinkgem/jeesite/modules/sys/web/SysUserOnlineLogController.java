/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.entity.SysUserOnlineLog;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SysUserOnlineLogService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

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
	@Autowired
	private SystemService systemService;
	
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
	/**
	 * 
	 * @version:  
	 * @Description: 在线时长List
	 * @author: ljk  
	 * @date: 2019年4月9日 下午2:31:29
	 * @param: @param sysUserOnlineLog
	 * @param: @param request
	 * @param: @param response
	 * @param: @param model
	 * @param: @return      
	 * @return: String
	 */
	@RequiresPermissions("sys:sysUserOnlineLog:view")
	@RequestMapping(value = "onlineTimeList")
	public String onlineTimeList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = systemService.findUser(new Page<User>(request, response), user);
		List<User> list = systemService.findUser(user);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		return "modules/sys/onlineTimeList";
	}
	/**
	 * @version: 
	 * @Description:  用户在线日志导出
	 * @author: ljk  
	 * @date: 2019年4月26日 下午11:10:44
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = "export", method=RequestMethod.POST)
	public String exportFile(SysUserOnlineLog sysUserOnlineLog, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			String fileName = "学生在线日志"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
			Page<SysUserOnlineLog> page = sysUserOnlineLogService.findPage(new Page<SysUserOnlineLog>(request, response,-1), sysUserOnlineLog);
			new ExportExcel("学生在线日志",SysUserOnlineLog.class).setDataList(page.getList()).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出用户失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/sys/sysUserOnlineLog?repage";
	}
}