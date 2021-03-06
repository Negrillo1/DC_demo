package com.thinkgem.jeesite.modules.sys.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.sys.entity.UserAddress;
import com.thinkgem.jeesite.modules.sys.service.LogService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserInfo;

import net.sf.json.JSONArray;

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
	@Autowired
	private SystemService systemService;
	
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
	/**
	 * @version: 
	 * @Description: 登录情况图表 
	 * @author: ljk  
	 * @date: 2019年4月13日 上午12:42:35
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"charts"})
	public String charts(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		List list = (List) logService.findLoginPast(15);
		model.addAttribute("list",list);
		return "modules/sys/analysisCharts";
	}
	/**
	 * @version: 
	 * @Description:  跳转到在当前线用户页面
	 * @author: ljk  
	 * @date: 2019年4月3日 上午1:23:28
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"onlineUsers"})
	public String toOnlineUsers(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		ArrayList<UserInfo> userlist = (ArrayList<UserInfo>)request.getSession().getServletContext().getAttribute("userlist");
		model.addAttribute("userlist",userlist);
		return "modules/sys/onlineUsers"; 
	}
	/**
	 * @version: 
	 * @Description: 查询用户地区图表  
	 * @author: ljk  
	 * @date: 2019年4月14日 上午5:41:12
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"address"})
	public String address(Model model) {
		List<Map<String,Integer>> listMaps = systemService.getUserAddress();
		JSONArray mapJson = JSONArray.fromObject(listMaps);
		
		/*model.addAttribute("mapJson",mapJson);	*/	
		String listStr = mapJson.toString();
        listStr = listStr.replace("\"name\"", "name").replace("\"value\"", "value");
		model.addAttribute("listStr",listStr);
		return "modules/sys/analysisAddress";
	}
	/**
	 * @version: 
	 * @Description:  查询用户地区列表
	 * @author: ljk  
	 * @date: 2019年4月20日 下午10:27:40
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"addressList"})
	public String addressList(UserAddress userAddress,Model model,HttpServletRequest request, HttpServletResponse response) {
		Page<UserAddress> page = systemService.getUserAddressList(new Page<UserAddress>(request,response),userAddress);
		model.addAttribute("page",page);
		return "modules/sys/addressList";
	}
	/**
	 * @version: 
	 * @Description: 时段登录分析  
	 * @author: ljk  
	 * @date: 2019年4月14日 下午11:46:51
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"loginHor"})
	public String loginHor(Model model,HttpServletRequest request) {
		String date = request.getParameter("date");
		List listMaps = logService.findLoginHor(date);
		model.addAttribute("listMaps", listMaps);
		model.addAttribute("date", date);
		return "modules/sys/loginHor";
	}
	/**
	 * @version: 
	 * @Description:  累计时长分析
	 * @author: ljk  
	 * @date: 2019年4月19日 下午3:22:54
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"cumulativeDuration"})
	public String cumulativeDuration(Model model) {
		return "modules/sys/cumulativeDuration";
	}
	/**
	 * @version: 
	 * @Description: 板块访问  
	 * @author: ljk  
	 * @date: 2019年4月20日 下午5:57:30
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"plateAccess"})
	public String plateAccess(Model model) {
		return "modules/sys/plateAccess";
	}
}
