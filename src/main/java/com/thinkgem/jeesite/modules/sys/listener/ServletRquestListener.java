package com.thinkgem.jeesite.modules.sys.listener;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;

import com.thinkgem.jeesite.modules.sys.utils.SessionUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserInfo;

public class ServletRquestListener implements ServletRequestListener{
	 private ArrayList<UserInfo> userlist;

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		// TODO Auto-generated method stub
		userlist = (ArrayList<UserInfo>) arg0.getServletContext().getAttribute("userlist");
		if(userlist==null)
		userlist = new ArrayList<UserInfo>(); 
		HttpServletRequest req = (HttpServletRequest) arg0.getServletRequest();
		String sessionid = req.getSession().getId();
		if (SessionUtils.getUsersessionid(userlist, sessionid) == null) {
			UserInfo user = new UserInfo();
			user.setIp(req.getRemoteAddr());
			user.setSessionid(sessionid);
			user.setRecenttime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			userlist.add(user);
		}
		arg0.getServletContext().setAttribute("userlist", userlist);
	}
	 
}
