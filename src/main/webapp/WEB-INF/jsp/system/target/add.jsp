<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/system/target/add.js">
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
label[class^="btn btn-default"]{
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/target/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
		
			<div class="form-group">
				<label class="col-sm-3 control-label">一级指标名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标名称" name="targetFormMap.name" id="name">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标1</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标1名称" name="targetFormMap.target1" id="target1">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标2</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标2名称" name="targetFormMap.target2" id="target2">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标3</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标3名称"
						name="targetFormMap.target3" id="target3">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标4</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标4名称"
						name="targetFormMap.target4" id="target4">
				</div>
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in"></div>
		<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
		</section>
		<div class="line line-dashed line-lg pull-in"></div>
		
	</form>
</body>
</html>