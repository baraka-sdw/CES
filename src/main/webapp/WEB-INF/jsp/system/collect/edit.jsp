<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/collect/edit.js"></script>

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
		action="${ctx}/collect/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${collect.id}"
			name="collectFormMap.id" id="id">
			
		<section class="panel panel-default">
		
	<div class="form-group">
				<label class="col-sm-3 control-label">参评对象</label>
				<div class="col-sm-9">
					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.evaluate">
						<c:forEach items="${evaluate}" var="key">
							<option value="${key.id}">${key.object}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			 
			<div class="form-group">
				<label class="col-sm-3 control-label">干部姓名</label>
				<div class="col-sm-9">

					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.carde">
						<c:forEach items="${carde}" var="key">
							<option value="${key.id}">${key.cardename}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			 
			<div class="form-group">
				<label class="col-sm-3 control-label">指标名称</label>
				<div class="col-sm-9">

					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.name">
						<c:forEach items="${target}" var="key">
							<option value="${key.id}">${key.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标1分数</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标1分数"
						name="collectFormMap.target1" id="target1" value="${collect.target1}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标2分数</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标2分数"
						name="collectFormMap.target2" id="target2" value="${collect.target2}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标3分数</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标1分数"
						name="collectFormMap.target3" id="target3" value="${collect.target3}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">指标4分数</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入指标4分数"
						name="collectFormMap.target4" id="target4" value="${collect.target4}">
				</div>
			</div>
				<div class="line line-dashed line-lg pull-in"></div>
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