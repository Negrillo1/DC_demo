<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>在线时长统计</title>
	<meta name="decorator" content="default"/>
</head>
<body>
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
</body>
</html>