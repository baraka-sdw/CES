<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/analyse/list.js"></script>
<script src="${pageContext.request.contextPath}/echarts/echarts.min.js" type="text/javascript"></script>
<script type="text/javascript">
var myChart = echarts.init(document.getElementById('main'));
var myChart1 = echarts.init(document.getElementById('main1'));
 option = {
  title: {
	text: '干部测评结果柱状图  '
    },tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
    	x:'right',
        data:['指标1','指标2','指标3','指标4']
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
            data : []
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'指标1',
            type:'bar',
            data:[]
        },
        {
            name:'指标2',
            type:'bar',
           
            data:[]
        },
        {
            name:'指标3',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标4',
            type:'bar',
            
            data:[]
        }
    ]
};
 
 option1 = {
		    title : {
		        text: '干部测评结果饼状图(各指标分数相加)',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: [],
		    },
		    series : [
		        {
		            name: '指标总分',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[],
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

 myChart.setOption(option);
 myChart1.setOption(option1);
//异步加载数据
$.ajax({
	type:"post",
	url:"${pageContext.request.contextPath}/analyse/findCollect.shtml",
	dataType:"json",
	async: false,
	success: function(data){
		// 填入数据
		var cardename=[];
		var target1=[];
		var target2=[];
		var target3=[];
		var target4=[];
		var value=[];
		$.each(data, function(key, sort) {
			cardename.push(sort.cardename);
			target1.push(sort.target1);
			target2.push(sort.target2);
			target3.push(sort.target3);
			target4.push(sort.target4);
		    value.push(sort.target);
		})
	     myChart.setOption({
	        xAxis: {
	            data: cardename
	        },
	        series: [
	                 {
	                     data:target1
	                 },
	                 {
	                     data:target2
	                 },
	                 {
	                     data:target3
	                 },
	                 {
	                     data:target4
	                 }
	             ]
	    });
		myChart1.setOption({
			legend: {
				data:cardename
			},series: [{
              data:(function(){
                  var res = [];
                  var len = value.length;
                  while (len--) {
                  res.push({
                  name: cardename[len],
                  value: value[len]
                  });
                  }
                  return res;
                  })()
			}]
		})
	},error: function(){
		alert("获取数据错误");
	}
})
</script>

   <div class="m-b-md" >
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">干部姓名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="cardename"
					name="analyseFormMap.cardename">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			<a href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info" id="search">导出excel</a>
		</form>
	</div>
<!--柱形图 -->
	<div id="main" style="width: 600px;height:400px;"></div>
<!--饼图 -->
	<div id="main1" style="width: 600px;height:400px;"></div>
	
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>
	
	<div class="table-responsive">
		<div id="paging2" class="pagclass"></div>
	</div>
