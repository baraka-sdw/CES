<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/system/targetone/add.js">
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
		action="${ctx}/targetone/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
		
			<div class="form-group">
				<label class="col-sm-1 control-label">指标名称定义</label>
				<div class="col-sm-4">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标定义名称" name="targetOneFormMap.targetName" id="targetName">
				</div>
			</div>
			
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-3 control-label">指标个数设置</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input onmouseout="" type="text" class="form-control checkacc" -->
<!-- 						placeholder="请输入指标个数" name="targetFormMap.name" id="number"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div class="form-group">
				<label class="col-sm-1 control-label">指标名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标名称" name="targetOneFormMap.target" id="target">
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