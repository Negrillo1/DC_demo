<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<title>图表</title>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
<script src="${ctxStatic}/echarts/vintage.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#day").change(function(){	
			$("#searchForm").submit();
			
		});
		$("#btnSubmit").click(function(){
			$("#day").find("option[name='0']").attr("selected",true);
			$("#searchForm").submit();
		});
	});
	
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/analysis/list">登录日志</a></li>
		<li class="active"><a href="${ctx}/sys/analysis/charts?day=15">图表</a></li>
	</ul>
	<form id="searchForm" class="breadcrumb form-search" action="${ctx}/sys/analysis/charts" method="post">
		<lable>时间段：&nbsp;&nbsp;</lable><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
		<input id="btnSubmit" class="btn btn-primary" type="button" value="查询"/>
		<label>过去：</label><select name="day" id="day">
			<option value="0" name="0" selected="selected">请选择</option>
			<option value="10" name="10">10天</option>
			<option value="15" name="15">15天</option>
			<option value="30" name="30">30天</option>
		</select>
	</form>
		
		<div id="login_num" style="height:400px; "></div>
		
    <script type="text/javascript">
    	//整理数据
    	var listJson = '${listJson}';
    	listJson = JSON.parse(listJson);
    	var na = new Array();
    	var va = new Array();
    	var j = 0;
    	for(var i in listJson) {
    		na[j] = listJson[i].time.substring(4,6) + "/" + listJson[i].time.substring(6,8);
    		va[j] = listJson[i].num;
    		j++;
    	}
    	/* list = list.substring(0,(list.length)-1);
    	list = list.split(/-|:|,/);
    	for(var i = 0; i < list.length; i = i+2) {
    		list[i] = list[i].substring(5,9);
    		list[i] = list[i].slice(0,2) + '/' + list[i].slice(2);
    		
    	} */
    	var day = '${day}';
    	var dayStr = "过去"+day+"天登录情况";
    	//设置日期
    	if(day == "0") {
    		 $("#day").find("option[name='0']").attr("selected",true);
    		 dayStr = $("#beginDate").val() + "至" + $("#endDate").val() + "登录情况";
    	}
    	if(day == "10") {
    		$("#day").find("option[name='10']").attr("selected",true);
    	}
    	if(day == "15") {
    		$("#day").find("option[name='15']").attr("selected",true);
    	}
    	if(day == "30") {
    		$("#day").find("option[name='30']").attr("selected",true);
    	}
    	
        // 基于准备好的dom，初始化echarts实例
        var loginLine = echarts.init(document.getElementById('login_num'));
        // 指定图表的配置项和数据
        var loginOption = {
        	    title: {
        	        text: dayStr,
        	        left: 'center'
        	    },
        	    tooltip : {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross',
        	            label: {
        	                backgroundColor: '#6a7985'
        	            }
        	        }
        	    },
        	    /* legend: {
        	        
        	    }, */
        	    toolbox: {
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    },
        	    grid: {
        	        left: '3%',
        	        right: '4%',
        	        bottom: '3%',
        	        containLabel: true
        	    },
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	            data : na
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
        	            stack: '总量',
        	            areaStyle: {},
        	            data:va
        	        }
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        loginLine.setOption(loginOption);
    </script>
</body>

</html>

