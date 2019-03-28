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
		<li class="active"><a href="${ctx}/cms/stats/article">信息量统计</a></li>
		<li class="active"><a href="${ctx}/cms/stats/charts">图表</li>
	</ul>
	<div id="hits" style="height:400px; "></div>
	<div id="stats_info_num" style="width: 800px;height:430px;  float: left; "></div>
	<div id="stats_hits" style="width: 800px;height: 430px;  float: right; "></div>
	<script type="text/javascript">
		var hitsLine = echarts.init(document.getElementById('hits'));
		var statsInfoNumCharts = echarts.init(document.getElementById('stats_info_num'));
		var statsHitsCharts = echarts.init(document.getElementById('stats_hits'));
		var hitsOption = {
				title: {
        	        text: '过去15天访问情况',
        	        subtext: '虚构数据',
        	        left: 'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{c}"
        	    },
        	    xAxis: {
        	    	name: '天'
        	    },
        	    yAxis: {
        	    	name: '访问数'
        	    },
        	    series : [
        	        {
        	            type: 'line',
        	            smooth: true,
        	            radius : '65%',
        	            center: ['50%', '50%'],
        	            selectedMode: 'single',
        	            data: [[1, 300], [2, 200], [3, 360], [4, 100], [5, 100], [6, 200],[7,400],[8,740],[9,450],[10,660],[11,350],[12,560],[13,660],[14,560],[15,660]],
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
		var statsInfoNumOption = {
				title: {
        	        text: '栏目信息量',
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
        	        data: ['网站机构', '内部机构','地方机构','网络工具','浏览工具','浏览辅助','网络优化']
        	    },
        	    series : [
        	        {
        	            type: 'pie',
        	            radius : '65%',
        	            center: ['50%', '50%'],
        	            selectedMode: 'single',
        	            data:[
        	                {value:1548, name: '网站机构'},
        	                {value:535, name: '内部机构'},
        	                {value:510, name: '地方机构'},
        	                {value:634, name: '网络工具'},
        	                {value:555, name: '浏览工具'},
        	                {value:555, name: '浏览辅助'},
        	                {value:555, name: '网络优化'}
        	                
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
		var statsHitsOption = {
				title: {
					text: '栏目点击量',
					subtext: '模拟数据',
					left: 'center'
				},
				tooltip: {
					trigger: 'item',
					formatter: "{c}"
				},
				dataset: {
			        source: [
			            [12345, '网站机构'],
			            [58212, '内部机构'],
			            [78254, '地方机构'],
			            [41032, '网络工具'],
			            [12755, '浏览工具'],
			            [20145, '浏览辅助'],
			            [79146, '网络优化']
			           	
			        ]
			    },
			    xAxis: {},
			    yAxis: {type: 'category'},
			    series: [
			        {
			            type: 'bar',
			            encode: {
			                // 将 "amount" 列映射到 X 轴。
			                x: 'amount',
			                // 将 "product" 列映射到 Y 轴。
			                y: 'product'
			            }
			        }
			    ]
		};
		hitsLine.setOption(hitsOption);
		statsInfoNumCharts.setOption(statsInfoNumOption);
		statsHitsCharts.setOption(statsHitsOption);
	</script>
</body>
</html>