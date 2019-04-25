<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<title>学生注册统计列表</title>
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
		<li><a href="${ctx}/sys/analysis/register">注册情况</a></li>
		<li class="active"><a href="${ctx}/sys/analysis/registerList">注册列表</a></li>
	</ul>
	<form id="searchForm" action="${ctx}/sys/analysis/registerList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div>
			<label>用户名：</label><input id="userName" name="userName" type="text" maxlength="50" class="input-mini" value="${user.userName}"/>
			<label>性别：</label>
			<select name="sex">
				<option value=" ">请选择</option>
				<option id='男' name="sex" value="0">男</option>
				<option id='女' name="sex" value="1">女</option>
			</select>
			<label>注册时间:&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
			&nbsp;
			&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
		</div>
	</form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>用户名</th><th>性别</th><th>年龄</th><th>注册时间</th></tr></thead>
		<tbody><%request.setAttribute("strEnter", "\n");request.setAttribute("strTab", "\t");%>
			<c:forEach items="${page.list}" var="user">
				<tr>
					<td>${user.userName}</td>
					<c:if test="${user.sex == 0}">
						<td>男</td>
					</c:if>
					<c:if test="${user.sex == 1}">
						<td>女</td>
					</c:if>
					<td>${user.age}</td>
					<td><fmt:formatDate value="${user.createTime}" type="both"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>