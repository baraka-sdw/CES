<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/system/target/add.js"></script>
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
				<label class="col-sm-2 control-label">问卷调查名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
					placeholder="请输入问卷调查名称" name="targetFormMap.question_name" id="question_name">
				</div>
			</div>
		    
		    <div class="form-group">
				<label class="col-sm-2 control-label">指标1</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label1">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#" id="targetone" name="${targetone.id}">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target1" title="${targetnext.weight}"
							name="targetFormMap.target1" value="${targetnext.targetName}" class=""  />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
		   
		    <div class="form-group">
				<label class="col-sm-2 control-label">指标2</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label2">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target2" title="${targetnext.weight}"
							name="targetFormMap.target2" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标3</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label3">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target3" title="${targetnext.weight}"
							name="targetFormMap.target3" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标4</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label4">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" title="${targetnext.weight}" 
							id="target4" name="targetFormMap.target4" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标5</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label5">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target5" title="${targetnext.weight}"
							name="targetFormMap.target5" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标6</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label6">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target6" title="${targetnext.weight}"
							name="targetFormMap.target6" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标7</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label7">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target7" title="${targetnext.weight}"
							name="targetFormMap.target7" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标8</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label8">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target8" title="${targetnext.weight}"
							name="targetFormMap.target8"value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标9</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label9">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target9" title="${targetnext.weight}"
							name="targetFormMap.target9" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			 <div class="form-group">
				<label class="col-sm-2 control-label">指标10</label>
				<div class="col-sm-9">
					<div class="btn-group m-r">
					<button data-toggle="dropdown"
							class="btn btn-sm  btn-info dropdown-toggle">
							<span class="dropdown-label" id="label10">请选择指标</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu ">
						   <c:forEach items="${targetone}" var="targetone">
							<li class="dropdown-submenu"><a href="#">${targetone.target}</a>
							<ul class="dropdown-menu" >
							<c:forEach items="${targetnext[targetone.id-1]}" var="targetnext">
							<li class=""><a href="#"><input type="radio" id="target10" title="${targetnext.weight}"
							name="targetFormMap.target10" value="${targetnext.targetName}" class="" />${targetnext.targetName}
							</a>
							</li>
							</c:forEach>
							</ul>
						     </li>
						     </c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<input type="hidden" id="weight1"name="targetFormMap.weight1" value="" class="" />
			<input type="hidden" id="weight2"name="targetFormMap.weight2" value="" class="" />
			<input type="hidden" id="weight3"name="targetFormMap.weight3" value="" class="" />
			<input type="hidden" id="weight4"name="targetFormMap.weight4" value="" class="" />	
			<input type="hidden" id="weight5"name="targetFormMap.weight5" value="" class="" />
			<input type="hidden" id="weight6"name="targetFormMap.weight6" value="" class="" />
			<input type="hidden" id="weight7"name="targetFormMap.weight7" value="" class="" />
			<input type="hidden" id="weight8"name="targetFormMap.weight8" value="" class="" />
			<input type="hidden" id="weight9"name="targetFormMap.weight9" value="" class="" />
			<input type="hidden" id="weight10"name="targetFormMap.weight10" value="" class="" />
					
		</div>
		<div class="line line-dashed line-lg pull-in"></div>
		<footer class="panel-footer text-right bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> 
		</section>
		<div class="line line-dashed line-lg pull-in"></div>
		
	</form>
	<script type="text/javascript">
	 $("input#target1").click(function(event) {
		$("#label1").text(event.target.value);
		$("#weight1").val($(this).attr("title"))
	})
	 $("input#target2").click(function(event) {
		$("#label2").text(event.target.value);
		$("#weight2").val($(this).attr("title"))
	})
	$("input#target3").click(function(event) {
		$("#label3").text(event.target.value);
		$("#weight3").val($(this).attr("title"))
	})
	$("input#target4").click(function(event) {
		$("#label4").text(event.target.value);
		$("#weight4").val($(this).attr("title"))
	})
	$("input#target5").click(function(event) {
		$("#label5").text(event.target.value);
		$("#weight5").val($(this).attr("title"))
	})
	$("input#target6").click(function(event) {
		$("#label6").text(event.target.value);
		$("#weight6").val($(this).attr("title"))
	})
	$("input#target7").click(function(event) {
		$("#label7").text(event.target.value);
		$("#weight7").val($(this).attr("title"))
	})
	$("input#target8").click(function(event) {
		$("#label8").text(event.target.value);
		$("#weight8").val($(this).attr("title"))
	})
	$("input#target9").click(function(event) {
		$("#label9").text(event.target.value);
		$("#weight9").val($(this).attr("title"))
	})
	$("input#target10").click(function(event) {
		$("#label10").text(event.target.value);
		$("#weight10").val($(this).attr("title"))
	})
	/* $("#targetone").mouseover(function(event) {
		alert($(this).attr("name"));
	}) */
	</script>
</body>
</html>