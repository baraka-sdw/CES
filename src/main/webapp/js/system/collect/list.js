var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width:'55px',
			isSort:true,
		},{
			colkey : "carde",
			name : "干部姓名",
			isSort:true,
		},{
			colkey : "question_name",
			name : "问卷名称",
			isSort:true,
		},{
			colkey : "evaluateName",
			name : "测评名称"
		}, {
			colkey : "target1",
			name : "指标1分数",
			width : '40px',
			isSort:true,
		}, {
			colkey : "target2",
			name : "指标2分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target3",
			name : "指标3分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target4",
			name : "指标4分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target5",
			name : "指标5分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target6",
			name : "指标6分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target7",
			name : "指标7分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target8",
			name : "指标8分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target9",
			name : "指标9分数",
			width : '40px',
			isSort:true,
		},{
			colkey : "target10",
			name : "指标10分数",
			width : '40px',
			isSort:true,
		} ],
		jsonUrl : rootPath + '/collect/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addAccount").click("click", function() {
		addAccount();
	});
	$("#editAccount").click("click", function() {
		editAccount();
	});
	$("#delAccount").click("click", function() {
		delAccount();
	});
});
function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/collect/editUI.shtml?id=' + cbox
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/collect/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/collect/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
