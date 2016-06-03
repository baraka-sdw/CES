<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/system/targetnext/edit.js">
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
		action="${ctx}/targetone/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${targetnext.id}"
			name="targetNextFormMap.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
		
<!-- 			<div class="form-group"> -->
<!-- 				<label class="col-sm-3 control-label">指标个数设置</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input onmouseout="" type="text" class="form-control checkacc" -->
<!-- 						placeholder="请输入指标个数" name="targetFormMap.name" id="number"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div class="form-group">
				<label class="col-sm-1 control-label">一级指标名称</label>
				<div class="col-sm-4">
				<select class="input-xlarge btn-group m-r form-control"
						name="targetNextFormMap.target">
						<c:forEach items="${targetone}" var="key">
							<option value="${key.id}">${key.target}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-1 control-label">二级指标名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control checkacc"
						placeholder="请输入二级指标名称" name="targetNextFormMap.targetName" id="targetName"
						value="${targetnext.targetName}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-1 control-label">权重</label>
				<div class="col-sm-4">
					<input type="text" class="form-control checkacc"
						placeholder="请输入权重" name="targetNextFormMap.weight" id="weight"
						value="${targetnext.weight }">
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-1 control-label">指标描述</label>
				<div class="col-sm-4">
				    <textarea class="form-control checkacc" rows="3" placeholder="请输入对指标的描述"
				    name="targetNextFormMap.description" id="description" value="${targetnext.description }"></textarea>
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