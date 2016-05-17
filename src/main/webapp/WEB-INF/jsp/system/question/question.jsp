<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="/common/common.jspf" %>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/carde/addEntity.shtml">
		<section class="panel panel-default">
			<div class="form-group">
				<label class="col-sm-3 control-label">请选择测评名称</label>
				<div class="col-sm-9">
					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.evaluate">
						<c:forEach items="${evaluate}" var="key">
							<option value="${key.id}">${key.object}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
		<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
		</section>
	</form>
</body>
</html>