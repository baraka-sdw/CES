var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			isSort:true,
		}, {
			colkey : "cardename",
			name : "干部姓名",
		},{
			colkey : "total",
			name : "参评总人数",
			isSort:true,
		},{
			colkey : "target",
			name : "总分",
			isSort:true,
		},{
			colkey : "target1",
			name : "指标1分数",
			isSort:true,
		}, {
			colkey : "target2",
			name : "指标2分数",
		    isSort:true,
		}, {
			colkey : "target3",
			name : "指标3分数",
			width : '90px',
			isSort:true,
		}, {
			colkey : "target4",
			name : "指标4分数",
			isSort:true,
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