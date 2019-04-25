<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
<title>学生基本信息</title>
</head>
<body>
<div id="main" style="width: 100%; height: 500px;"></div>
<div id="userAge" style="width: 100%; height: 500px;"></div>
<script type="text/javascript">
	var cumulativePie = echarts.init(document.getElementById('main'));
	var userAgeBar = echarts.init(document.getElementById('userAge'));
	var cumulativePieOption = {
	    title : {
	        text: '学生性别比例',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient : 'vertical',
	        x : 'left',
	        data:['直接访问','邮件营销']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: true},
	            magicType : {
	                show: true, 
	                type: ['pie', 'funnel'],
	                option: {
	                    funnel: {
	                        x: '25%',
	                        width: '50%',
	                        funnelAlign: 'left',
	                        max: 1548
	                    }
	                }
	            },
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    series : [
	        {
	            
	            type:'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:${listStr}
	        }
	    ]
	};
	var userAgeOption =  {
			title : {
		        text: '学生年龄比例',
		        x:'center'
		    },
			tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b}: {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'left',
		        data:${ageString}
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: true},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    series: [
		        {
		            name:'年龄比例',
		            type:'pie',
		            radius: ['50%', '70%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: true,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:${ageString}
		        }
		    ]
		};
	cumulativePie.setOption(cumulativePieOption);
	userAgeBar.setOption(userAgeOption);
</script>	
</body>
</html>