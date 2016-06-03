var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "question_name",
			name : "问卷名称",
			width : '170px'
		},{
			colkey : "cardename",
			name : "干部姓名",
		},{
			colkey : "total",
			name : "参评总人数",
			width : '40px',
		},{
			colkey : "target",
			name : "平均分",
			isSort:true,
			width : '120px'
		},{
			colkey : "target1",
			name : "指标1分数",
			isSort:true,
			width : '40px'
		}, {
			colkey : "target2",
			name : "指标2分数",
		    isSort:true,
		    width : '40px'
		}, {
			colkey : "target3",
			name : "指标3分数",
			width : '90px',
			isSort:true,
			width : '40px'
		},{
			colkey : "target4",
			name : "指标4分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target5",
			name : "指标5分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target6",
			name : "指标6分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target7",
			name : "指标7分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target8",
			name : "指标8分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target9",
			name : "指标9分数",
			isSort:true,
			width : '40px'
		},{
			colkey : "target10",
			name : "指标10分数",
			isSort:true,
			width : '40px'
		}],
		jsonUrl : rootPath + '/analyse/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
});