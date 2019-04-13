<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<title>图表</title>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/analysis/list">登录日志</a></li>
		<li class="active"><a href="${ctx}/sys/analysis/charts">图表</a></li>
	</ul>
		<div id="login_num" style="height:400px; "></div>
		<div id="grade" style="width: 800px;height:430px;  float: left; "></div>
		<div id="sex" style="width: 800px;height: 430px;  float: right; "></div>
	
	
    <script type="text/javascript">
    	//整理数据
    	var list = "${list}";
    	list = list.substring(0,(list.length)-1);
    	list = list.split(/-|:|,/);
    	for(var i = 0; i < list.length; i = i+2) {
    		list[i] = list[i].substring(5,9);
    		list[i] = list[i].slice(0,2) + '/' + list[i].slice(2);
    		
    	}
        // 基于准备好的dom，初始化echarts实例
        var gradeChart = echarts.init(document.getElementById('grade'));
        var sexChart = echarts.init(document.getElementById('sex'));
        var loginLine = echarts.init(document.getElementById('login_num'));
        // 指定图表的配置项和数据
        var gradeOption = {
        	    title: {
        	        text: '登录用户年级',
        	        subtext: '虚构数据',
        	        left: 'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        // orient: 'vertical',
        	        // top: 'middle',
        	        bottom: 10,
        	        left: 'center',
        	        data: ['大一', '大二','大三','大四']
        	    },
        	    series : [
        	        {
        	            type: 'pie',
        	            radius : '65%',
        	            center: ['50%', '50%'],
        	            selectedMode: 'single',
        	            data:[
        	                {value:1548, name: '大一'},
        	                {value:535, name: '大二'},
        	                {value:510, name: '大三'},
        	                {value:634, name: '大四'}    
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};
        var sexOption = {
        	    title: {
        	        text: '登录用户性别',
        	        subtext: '虚构数据',
        	        left: 'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        // orient: 'vertical',
        	        // top: 'middle',
        	        bottom: 10,
        	        left: 'center',
        	        data: ['男生', '女生']
        	    },
        	    series : [
        	        {
        	            type: 'pie',
        	            radius : '65%',
        	            center: ['50%', '50%'],
        	            selectedMode: 'single',
        	            data:[
        	                {value:1548, name: '男生'},
        	                {value:535, name: '女生'}
        	                    
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};
        var loginOption = {
        	    title: {
        	        text: '过去15天登录情况',
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
        	            name:'登录次数',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {},
        	            data:[list[1], list[3], list[5], list[7], list[9], list[11], list[13],list[15],list[17],list[19],list[21],list[23],list[25],list[27],list[29]]
        	        }
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        gradeChart.setOption(gradeOption);
        sexChart.setOption(sexOption);
        loginLine.setOption(loginOption);
    </script>
</body>

</html>

