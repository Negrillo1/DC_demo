package com.thinkgem.jeesite.modules.sys.listener;

import java.util.ArrayList;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.thinkgem.jeesite.modules.sys.utils.SessionUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserInfo;


public class OnlineListener implements HttpSessionListener{

	private int numberCount = 0;
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		 numberCount++;
		 arg0.getSession().getServletContext().setAttribute("numberCount", numberCount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		numberCount--;
		arg0.getSession().getServletContext().setAttribute("numberCount", numberCount);
		ArrayList<UserInfo> userlist = (ArrayList<UserInfo>) arg0.getSession().getServletContext().getAttribute("userlist");
		if (SessionUtils.getUsersessionid(userlist, arg0.getSession().getId()) != null) {
			userlist.remove(SessionUtils.getUsersessionid(userlist, arg0.getSession().getId()));
		}
	}

	

}
