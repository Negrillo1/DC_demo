<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
<script src="${ctxStatic}/echarts/vintage.js"></script>
<title>登录时段分析</title>
<script type="text/javascript">
	
	
	
	
</script>
</head>
<body>
<ul class="nav nav-tabs">
<li class="active"><a href="${ctx}/sys/analysis/loginHor">登录时段图表</a></li>
</ul>
<form:form id="searchForm" action="" method = "get" class="breadcrumb form-search">
	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	<div style="margin-top:8px;">
		<label>日期查询：&nbsp;</label><input id="date" name="date" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate  value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</div>
</form:form>
<h1 id="main" style="width: 100%; height: 500px;"></h1>
<script type="text/javascript">
	var date = '${date}';
	if(date == "") {
		date = new Date();
		date = date.toLocaleDateString();
		date = date.replace(/\//g, '-')
	}
	var loginHorChart = echarts.init(document.getElementById('main'),'vintage'); 
	var loginHoroption = {
			title : {
		        text: '各时段登录情况',
		        left: 'center',
		       	subtext: date
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    /* legend: {
		        data:['意向','预购','成交']
		    }, */
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: false, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            /* restore : {show: true}, */
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ['0时','1时','2时','3时','4时','5时','6时','7时','8时','9时','10时','11时','12时','13时','14时','15时','16时','17时','18时','19时','20时','21时','22时','23时']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'登录次数',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:${listMaps}
		        }/* ,
		        {
		            name:'预购',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[30, 182, 434, 791, 390, 30, 10]
		        },
		        {
		            name:'意向',
		            type:'line',
		            smooth:true,
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[1320, 1132, 601, 234, 120, 90, 20]
		        } */
		    ]
	};
	loginHorChart.setOption(loginHoroption);
</script>
</body>
</html>