<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default"/>
<script src="${ctxStatic}/echarts/echarts.min.js"></script>
<script src="${ctxStatic}/echarts/vintage.js"></script>
<title>学生基本信息</title>
<style type="text/css">
	#main,#userAge{
		float: left;
	}
</style>
</head>
<body>
<ul class="nav nav-tabs">
	<li class="active"><a href="${ctx}/sys/analysis/stuInfo">基本信息图表</a></li>
</ul>

<div id="main" style="width: 50%; height: 400px;"></div>
<div id="userAge" style="width: 50%; height: 400px;"></div>
<div id="userAdress" style="width: 100%; height:500px;" ></div>
<script type="text/javascript">
	var cumulativePie = echarts.init(document.getElementById('main'),'vintage');
	var userAgeBar = echarts.init(document.getElementById('userAge'),'vintage');
	var myChart = echarts.init(document.getElementById('userAdress'),'vintage');
	var cumulativePieOption = {
	    title : {
	        text: '学生性别比例',
	        subtext: '男女生比例',
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
		        subtext: '年龄段分布',
		        x:'center'
		    },
			tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b}岁: {c}人 ({d}%)"
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
		            /* radius: ['50%', '70%'], */
		            radius : '55%',
	            	center: ['50%', '60%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: false,
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
	//用户地区图表
	var addressMaps = '${addressJson}';
	var addressJson = JSON.parse(addressMaps);
	var na = new Array();
	var va = new Array();
	var j = 0;
	for(var i in addressJson) {
		na[j] = addressJson[i].name;
		va[j] = addressJson[i].value;
		j++;
	}
	var max = Math.max.apply(null,va);
	var dataAxis = na;
	var data = va;
	var yMax = max + 10;
	var dataShadow = [];

	/* for (var i = 0; i < data.length; i++) {
    	dataShadow.push(yMax);
	} */
	var userAddressOption = {
		    title: {
		        text: '学生地区统计',
		        subtext: '各地区学生人数',
		        x:'center'
		    },
		    tooltip: {
		    	trigger: 'item',
		    	formatter: "{b}: {c}人 "
		    },
		    xAxis: {
		        data: dataAxis,
		        axisLabel: {
		            inside: true,
		            textStyle: {
		                color: '#fff'
		            }
		        },
		        axisTick: {
		            show: false
		        },
		        axisLine: {
		            show: false
		        },
		        z: 10
		    },
		    yAxis: {
		        axisLine: {
		            show: false
		        },
		        axisTick: {
		            show: false
		        },
		        axisLabel: {
		            textStyle: {
		                color: '#999'
		            }
		        }
		    },
		    dataZoom: [
		        {
		            type: 'inside'
		        }
		    ],
		    series: [
		        { // For shadow
		            type: 'bar',
		            itemStyle: {
		                normal: {color: 'rgba(0,0,0,0.05)'}
		            },
		            barGap:'-100%',
		            barCategoryGap:'40%',
		            data: dataShadow,
		            animation: false
		        },
		        {
		            type: 'bar',
		            itemStyle: {
		                normal: {
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 0, 1,
		                        [
		                            {offset: 0, color: '#83bff6'},
		                            {offset: 0.5, color: '#188df0'},
		                            {offset: 1, color: '#188df0'}
		                        ]
		                    )
		                },
		                emphasis: {
		                    color: new echarts.graphic.LinearGradient(
		                        0, 0, 0, 1,
		                        [
		                            {offset: 0, color: '#2378f7'},
		                            {offset: 0.7, color: '#2378f7'},
		                            {offset: 1, color: '#83bff6'}
		                        ]
		                    )
		                }
		            },
		            data: data
		        }
		    ]
		};

		// Enable data zoom when user click bar.
		var zoomSize = 6;
		myChart.on('click', function (params) {
		    console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
		    myChart.dispatchAction({
		        type: 'dataZoom',
		        startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
		        endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
		    });
		});
	cumulativePie.setOption(cumulativePieOption);
	userAgeBar.setOption(userAgeOption);
	myChart.setOption(userAddressOption);
</script>	
</body>
</html>