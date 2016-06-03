<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
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
        data:['指标1','指标2','指标3','指标4','指标5','指标6','指标7','指标8','指标9','指标10']
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
        },
        {
            name:'指标5',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标6',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标7',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标8',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标9',
            type:'bar',
            
            data:[]
        },
        {
            name:'指标10',
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
		var target5=[];
		var target6=[];
		var target7=[];
		var target8=[];
		var target9=[];
		var target10=[];
		var value=[];
		$.each(data, function(key, sort) {
			cardename.push(sort.cardename);
			target1.push(sort.target1);
			target2.push(sort.target2);
			target3.push(sort.target3);
			target4.push(sort.target4);
			target5.push(sort.target5);
			target6.push(sort.target6);
			target7.push(sort.target7);
			target8.push(sort.target8);
			target9.push(sort.target9);
			target10.push(sort.target10);
		    value.push(sort.target);
		})
	     myChart.setOption({
	        xAxis: {
	        	x:'right',
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
	                 },
	                 {
	                     data:target5
	                 },
	                 {
	                     data:target6
	                 },
	                 {
	                     data:target7
	                 },
	                 {
	                     data:target8
	                 },
	                 {
	                     data:target9
	                 },
	                 {
	                     data:target10
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

$("select#question").change(function(event) {
	  //加载指标名称
	  $.ajax({
		  type: 'POST',
		  url: "${pageContext.request.contextPath}/question/findById.shtml",
		  data: "target="+$(this).children('option:selected').attr("id"),
		  dataType:"json",
		  async: false,
		  success: function(data) {
			  var targetname=[];
			targetname.push(data.target1);
			targetname.push(data.target2);
			targetname.push(data.target3);
			targetname.push(data.target4);
			targetname.push(data.target5);
			targetname.push(data.target6);
			targetname.push(data.target7);
			targetname.push(data.target8);
			targetname.push(data.target9);
			targetname.push(data.target10);
			  /*  myChart.setOption({
				  legend: {
		 				data:(function(){
		 					 return targetname
		 				 })()
		 			}
			  })   */
		  },
		  error: function(){
				alert("获取数据错误");
			}
		});
		//异步加载数据
		 $.ajax({
		 	type:"post",
		 	url:"${pageContext.request.contextPath}/analyse/findCollect.shtml",
		 	data: "question_name="+event.target.value,
		 	dataType:"json",
		 	async: false,
		 	success: function(data){
		 		// 填入数据
		 		var cardename=[];
		 		var target1=[];
		 		var target2=[];
		 		var target3=[];
		 		var target4=[];
		 		var target5=[];
		 		var target6=[];
		 		var target7=[];
		 		var target8=[];
		 		var target9=[];
		 		var target10=[];
		 		var value=[];
		 		$.each(data, function(key, sort) {
		 			cardename.push(sort.cardename);
		 			target1.push(sort.target1);
		 			target2.push(sort.target2);
		 			target3.push(sort.target3);
		 			target4.push(sort.target4);
		 			target5.push(sort.target5);
		 			target6.push(sort.target6);
		 			target7.push(sort.target7);
		 			target8.push(sort.target8);
		 			target9.push(sort.target9);
		 			target10.push(sort.target10);
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
		 	                 },
		 	                 {
		 	                     data:target5
		 	                 },
		 	                 {
		 	                     data:target6
		 	                 },
		 	                 {
		 	                     data:target7
		 	                 },
		 	                 {
		 	                     data:target8
		 	                 },
		 	                 {
		 	                     data:target9
		 	                 },
		 	                 {
		 	                     data:target10
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
	 });
	 });
</script>
<body>
   <div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="col-sm-3 control-label">根据问卷查看</label>
				<div class="col-sm-9">

					<select class="input-xlarge btn-group m-r form-control"
						name="evaluateFormMap.target" id="question">
						<c:forEach items="${target}" var="key">
							<option value="${key.question_name}" id="${key.id}">${key.question_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</form>
	</div>
<!--柱形图 -->
	<div id="main" style="width: 900px;height:400px;"></div>
<!--饼图 -->
	<div id="main1" style="width: 1100px;height:400px;"></div>
</body>
