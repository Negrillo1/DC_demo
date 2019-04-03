package com.thinkgem.jeesite.modules.sys.utils;

import java.util.ArrayList;

public class SessionUtils {

	 public static Object getUsersessionid(ArrayList<UserInfo> userlist,String sessionid) {
		 for(int i=0;i<userlist.size();i++) {
			 UserInfo info = userlist.get(i);
			 if(userlist.get(i).getSessionid().equals(sessionid))
				 return info;
		 }
		 return null;
	 }
}
