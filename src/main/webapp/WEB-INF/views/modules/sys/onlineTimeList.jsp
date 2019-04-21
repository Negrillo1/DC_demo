<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>在线时长统计</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
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
		<li class="active"><a href="${ctx}/sys/sysUserOnlineLog/onlineTimeList">在线时长统计</a>
		<%-- <shiro:hasPermission name="sys:sysUserOnlineLog:edit"><li><a href="${ctx}/sys/sysUserOnlineLog/form">保存&ldquo;用户在线日志表&rdquo;成功添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="sysUserOnlineLog" action="${ctx}/sys/sysUserOnlineLog/onlineTimeList" method="post" class="breadcrumb form-search" >
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div>
			<lable>登录名：</lable><input id="loginName" name="loginName" type="text" maxlength="50" class="input-mini" value="${sysUserOnlineLog.loginName}"/>
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		</div>
		

	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>登录名</th>
				<th>在线总时长（h）</th>
			</tr>
		</thead>
		<tbody> 
			<c:forEach items="${list}" var="userList">
				<tr>
					<td>${userList.loginName}</td>
					<td>${userList.onlineTime}</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>