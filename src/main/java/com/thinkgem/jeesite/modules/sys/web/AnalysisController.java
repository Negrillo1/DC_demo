package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Log;
import com.thinkgem.jeesite.modules.sys.service.LogService;

/**
 * @version: 
 * @Description:  用户行为分析Controller
 * @author: ljk  
 * @date: 2019年3月20日 下午5:18:07
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/analysis")
public class AnalysisController extends BaseController{
	
	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"index"})
	public String index(Log log, Model model){
		return "modules/sys/analysisIndex";
	}
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Log> page = logService.findLogin(new Page<Log>(request, response), log);
        model.addAttribute("page", page);
		return "modules/sys/analysisList";
	}
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"charts"})
	public String charts(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/analysisCharts";
	}
}
