<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@  page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<title>图表</title>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function getNow(s) {
			return s < 10 ? '0' + s: s;
		}
		var myDate = new Date();
		var year=myDate.getFullYear();
		var month=myDate.getMonth()+1;
		var date=myDate.getDate(); 
		var h=myDate.getHours();//获取当前小时数(0-23)
		var m=myDate.getMinutes();//获取当前分钟数(0-59)
		var s=myDate.getSeconds();
		var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
		$("#date").text(now);
	});
</script>
</head>
<body>
	<div class="hero-unit" style="text-align: center;">
		<small id="date"></small><h1><%= application.getAttribute("numberCount") %></h1><small>在线用户</small>
	</div>
	
	
	<%-- <%
        ArrayList<com.thinkgem.jeesite.modules.sys.utils.UserInfo> userlist = (ArrayList<com.thinkgem.jeesite.modules.sys.utils.UserInfo>)request.getSession().getServletContext().getAttribute("userlist");
     if(userlist!=null){
         for (int i=0;i<userlist.size();i++) {
        	 com.thinkgem.jeesite.modules.sys.utils.UserInfo info = userlist.get(i);
     %>
     ip:<%=info.getIp()%><br /> 
     recentTime:<%=info.getRecenttime()%><br/>
     sessionid:<%=info.getSessionid()%><br/>
     <%
         }}
     %> --%>
     <table class="table table-striped table-bordered table-condensed">
     	<thead><th>IP</th><th>访问时间</th></thead>
     	<tbody>
     		<c:forEach items="${userlist}" var="list">
     		<tr>
     			<td>${list.ip }</td>
     			<td>${list.recenttime }</td>
     		</tr>
     		</c:forEach>
     	</tbody>
     </table>
</body>

</html>
