<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/target/edit.js"></script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/target/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${target.id}"
			name="targetFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="form-group">
				<label class="col-sm-3 control-label">指标名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标名称" name="targetFormMap.name" id="name" value="${target.name}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标1</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标1名称" name="targetFormMap.target1" id="target1" value="${target.target1}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标2</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入指标2名称 " name="targetFormMap.target2" id="target2" value="${target.target2}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标3</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标3名称"
						name="targetFormMap.target3" id="target3" value="${target.target3}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标4</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标4名称"
						name="targetFormMap.target4" id="target4" value="${target.target4}">
				</div>
			</div>
			
				<div class="line line-dashed line-lg pull-in"></div>
			</div>
			<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
	</section>
	</form>
	<script type='text/javascript'>
		/* $(function(){
			$("from input[name='enable'][value='${role.enable}']").attr("checked","checked");
			alert("input[name='enable'][value='${role.enable}']");
		}); */
	</script>
</body>
</html>