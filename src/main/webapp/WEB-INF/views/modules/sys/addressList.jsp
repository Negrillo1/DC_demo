<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户地区列表</title>
<meta name="decorator" content="default"/>
<link rel="stylesheet" href="${ctxStatic}/cityPick/css/citySelect.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#cityName").bind('DOMNodeInserted',function(e) {
		var cityName = $("#cityName").html();
		$("#address").val(cityName);
	});
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
	<li ><a href="${ctx}/sys/analysis/address">用户地区图表</a></li>
	<li class="active"><a href="${ctx}/sys/analysis/addressList">用户地区列表</a></li>
</ul>
<form:form id="searchForm" action="${ctx}/sys/analysis/addressList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div>
		</div>
		<div style="margin-top:8px;">
		<label>用户地区：&nbsp;</label>&nbsp;&nbsp;<input id="address" name="address" type="text" maxlength="50" data-toggle="city-picker" class="citySelect" value="${log.title}"/>&nbsp;&nbsp;
		<label>用户名：&nbsp;</label><input id="userName" name="userName" type="text" maxlength="50" class="input-mini" value="${log.title}"/>&nbsp;&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
    
    <div class="citySelect" style="display: none;">
        <span id="cityName" class="cityName">北京</span>
        <i class="iconDown"></i>
        <i class="line"></i>
    </div>
    <div class="dropDown" style="position: absolute;">
        <div class="dropProv">
            <ul class="dropProvUl dropUl"></ul>
        </div>
        <div class="dropCity">
            <ul class="dropCityUl dropUl"></ul>
        </div>
    </div>
		</div>
</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr><td>用户名</td><td>用户地区</td></tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="address">
				<tr>
					<td>${address.userName }</td>
					<td>${address.address }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<script type="text/javascript" src="${ctxStatic}/cityPick/js/citySelect.js"></script>
<div class="pagination">${page}</div>
</body>
</html>