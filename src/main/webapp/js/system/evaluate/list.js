var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : '40px',
			isSort:true,
		},{
			colkey : "evaluateCode",
			name : "测评代码",
			isSort:true,
		},{
			colkey : "evaluateName",
			name : "测评名称",
		},{
			colkey : "target",
			name : "指标",
		},{
			colkey : "object",
			name : "参评对象",
		}, {
			colkey : "batch",
			name : "批次",
		    width : '40px',
		}, {
			colkey : "number",
			name : "参评人数",
			width : '40px',
			isSort:true,
		}, {
			colkey : "startdate",
			name : "开始时间",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
		    return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "enddate",
			name : "结束时间",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}],
		jsonUrl : rootPath + '/evaluate/findByPage.shtml',
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
		content : rootPath + '/evaluate/editUI.shtml?id=' + cbox
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		index:0,
		content : rootPath + '/evaluate/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/evaluate/deleteEntity.shtml';
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
