<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/evaluate/add.js"></script>

    <link type="text/css" href="${ctx}/js/system/evaluate/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
    <link type="text/css" href="${ctx}/js/system/evaluate/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
     <script type="text/javascript" src="${ctx}/js/system/evaluate/js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/evaluate/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/evaluate/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/evaluate/js/jquery-ui-timepicker-zh-CN.js"></script>
    
 <script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
 <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
 <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    
    <script type="text/javascript">
    $(function () {
        $(".ui_timepicker").datetimepicker({
            //showOn: "button",
            //buttonImage: "./css/images/icon_calendar.gif",
            //buttonImageOnly: true,
            showSecond: true,
            timeFormat: 'hh:mm:ss',
            stepHour: 1,
            stepMinute: 1,
            stepSecond: 1
        })
    })
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

label[class^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/evaluate/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
		
			<div class="form-group">
				<label class="col-sm-3 control-label">测评名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入测评名称" name="evaluateFormMap.evaluateName"
						id="evaluateName">
				</div>
			</div>
            
            <div class="form-group">
				<label class="col-sm-3 control-label">测评代码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入测评代码" name="evaluateFormMap.evaluateCode"
						id="evaluateCode">
				</div>
			</div>
            
			<div class="form-group">
				<label class="col-sm-3 control-label">指标</label>
				<div class="col-sm-9">

					<select class="input-xlarge btn-group m-r form-control"
						name="evaluateFormMap.target">
						<c:forEach items="${target}" var="key">
							<option value="${key.id}">${key.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">参评对象</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入参评对象名称" name="evaluateFormMap.object" id="object">
				</div>
			</div>
          
			<div class="form-group">
				<label class="col-sm-3 control-label">批次</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入批次名称" name="evaluateFormMap.batch" id="batch">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">参评人数</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入参评人数" name="evaluateFormMap.number" id="number">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label">开始时间</label>
				<div class="col-sm-9 input-append date" id="datetimepicker">
					<input type="text" class="form-control checkacc ui_timepicker" 
					placeholder="请选择开始时间" name="evaluateFormMap.startdate" id="startdate">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">结束时间</label>
				<div class="col-sm-9 input-append date" id="datetimepicker">
					<input type="text" class="form-control checkacc ui_timepicker"
					 placeholder="请选择结束时间" name="evaluateFormMap.enddate" id="enddate">
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