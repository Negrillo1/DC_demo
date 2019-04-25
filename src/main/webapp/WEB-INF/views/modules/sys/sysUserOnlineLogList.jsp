<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户在线日志</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysUserOnlineLog/">用户在线日志表</a></li>
		<li><a href="${ctx}/sys/sysUserOnlineLog/onlineTimeList">在线时长统计</a>
		<%-- <shiro:hasPermission name="sys:sysUserOnlineLog:edit"><li><a href="${ctx}/sys/sysUserOnlineLog/form">保存&ldquo;用户在线日志表&rdquo;成功添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="sysUserOnlineLog" action="${ctx}/sys/sysUserOnlineLog/list" method="post" class="breadcrumb form-search" >
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div>
			<lable>登录名：</lable><input id="loginName" name="loginName" type="text" maxlength="50" class="input-mini" value="${sysUserOnlineLog.loginName}"/>
			<label>日期范围：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		</div>
		

	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>登录名</th>
				<th>登录时间</th>
				<th>退出时间</th>
				<th>在线时长（h）</th>
				<%-- <th>remarks</th><shiro:hasPermission name="sys:sysUserOnlineLog:edit"><th>操作</th></shiro:hasPermission> --%>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysUserOnlineLog">
			<tr>
				<td>${sysUserOnlineLog.loginName}</td>
				<jsp:useBean id="loginTime" class="java.util.Date"/>
				<jsp:setProperty name="loginTime" property="time" value="${sysUserOnlineLog.loginTime}"/>
				<td><fmt:formatDate value="${loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<jsp:useBean id="logoutTime" class="java.util.Date"/>
				<jsp:setProperty name="logoutTime" property="time" value="${sysUserOnlineLog.logoutTime}"/>
				<td><fmt:formatDate value="${logoutTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${sysUserOnlineLog.onlineHours}</td>
				<%-- <shiro:hasPermission name="sys:sysUserOnlineLog:edit"><td>
    				<a href="${ctx}/sys/sysUserOnlineLog/form?id=${sysUserOnlineLog.id}">修改</a>
					<a href="${ctx}/sys/sysUserOnlineLog/delete?id=${sysUserOnlineLog.id}" onclick="return confirmx('确认要删除该保存&ldquo;用户在线日志表&rdquo;成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>