<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<title>学生注册分析</title>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/analysis/register">注册情况</a></li>
		<li><a href="${ctx}/sys/analysis/registerList">注册列表</a></li>
	</ul>
	<div id="register_num" style="height:400px; "></div>
	<script type="text/javascript">
		//整理数据
		var list = "${list}";
		list = list.substring(0,(list.length)-1);
    	list = list.split(/-|:|,/);
    	for(var i = 0; i < list.length; i = i+2) {
    		list[i] = list[i].substring(5,9);
    		list[i] = list[i].slice(0,2) + '/' + list[i].slice(2);
    		
    	}
    	var registerLine = echarts.init(document.getElementById('register_num'));
    	var registerOption = {
        	    title: {
        	        text: '过去15天注册情况',
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
        	            data : [list[0],list[2],list[4],list[6],list[8],list[10],list[12],list[14],list[16],list[18],list[20],list[22],list[24],list[26],list[28]]
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value'
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'注册用户量',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {},
        	            data:[list[1], list[3], list[5], list[7], list[9], list[11], list[13],list[15],list[17],list[19],list[21],list[23],list[25],list[27],list[29]]
        	        }
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        registerLine.setOption(registerOption);
	</script>
</body>
</html>