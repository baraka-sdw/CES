<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="/common/common.jspf" %>

<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" >
		<section class="panel panel-default">
		<div style="width: 600px;margin: 0 auto;">
		<div class="form-group">
				<label class="col-sm-3 control-label">请选择问卷</label>
				<div class="col-sm-9">
					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.target" id="target">
						<c:forEach items="${target}" var="key">
							<option value="${key.id}" id=>${key.question_name}</option>
						</c:forEach>
					</select>
				</div>
		</div>
		
			<div class="form-group">
				<label class="col-sm-3 control-label">请选择要评价的干部</label>
				<div class="col-sm-9">
					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.carde" id="carde">
						<c:forEach items="${carde}" var="key">
							<option value="${key.id}" id=>${key.cardename}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		
		<div class="form-group">
				<label class="col-sm-3 control-label">请选择测评名称</label>
				<div class="col-sm-9">
					<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.evaluate" id="evaluate">
						<c:forEach items="${evaluate}" var="key">
							<option value="${key.id}" id=>${key.evaluateName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label1" style="float: left;">1:指标1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target1" id="target1">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target1" id="target1">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target1" id="target1">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target1" id="">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label2">2:指标2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target2" id="target2">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target2" id="target2">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target2" id="target2">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target2" id="target2">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label3">3:指标3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target3" id="target3">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target3" id="target3">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target3" id="target3">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target3" id="target3">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label4">4:指标4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target4" id="target4">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target4" id="target4">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target4" id="target4">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target4" id="target4">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label5">5:指标5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target5" id="target5">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target5" id="target5">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target5" id="target5">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target5" id="target5">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label6">6:指标6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target6" id="target6">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target6" id="target6">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target6" id="target6">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target6" id="target6">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label7">7:指标7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target7" id="target7">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target7" id="target7">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target7" id="target7">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target7" id="target7">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label8">8:指标8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target8" id="target8">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target8" id="target8">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target8" id="target8">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target8" id="target8">D</label>
				</div>
		</div>	
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label9">9:指标9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target9" id="target9">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target9" id="target9">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target9" id="target9">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target9" id="target9">D</label>
				</div>
		</div>
		
		<div class="form-group">
				<label class="col-sm-3 control-label" id="label10">10:指标10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-9">
				<label class="col-sm-3 control-label"><input type="radio" value="A" name="collectFormMap.target10" id="target10">A</label>
				<label class="col-sm-3 control-label"><input type="radio" value="B" name="collectFormMap.target10" id="target10">B</label>
				<label class="col-sm-3 control-label"><input type="radio" value="C" name="collectFormMap.target10" id="target10">C</label>
				<label class="col-sm-3 control-label"><input type="radio" value="D" name="collectFormMap.target10" id="target10">D</label>
				</div>
		</div>
		
		<footer class="panel-footer text-right bg-light lter">
		<button type="button" class="btn btn-success btn-s-xs" style="" id="submit">提交</button>
		</footer> 
		</div>
		</section>
	</form>
	<script type="text/javascript">
	  $("select#target").change(function(event) {
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/question/findById.shtml",
			  data: "target="+event.target.value,
			  dataType:"json",
			  async: false,
			  success: function(data) {
				 $("#label1").text("1."+data.target1+":");
				 $("#label2").text("2."+data.target2+":");
				 $("#label3").text("3."+data.target3+":");
				 $("#label4").text("4."+data.target4+":");
				 $("#label5").text("5."+data.target5+":");
				 $("#label6").text("6."+data.target6+":");
				 $("#label7").text("7."+data.target7+":");
				 $("#label8").text("8."+data.target8+":");
				 $("#label9").text("9."+data.target9+":");
				 $("#label10").text("10."+data.target10+":");
			  },
			  error: function(){
					alert("获取数据错误");
				}
			});
		  //${ctx}/collect/addEntity.shtml
	});
	 $("#submit").click(function() {
		 $.ajax({
             type: "POST",
             url:"${pageContext.request.contextPath}/collect/addEntity.shtml",
             data:$('#form').serialize(),
             async: false,
             error: function(request) {
                 alert("添加失败");
             },
             success: function(data) {
            	 layer.confirm('添加成功!是否关闭窗口?', function(index) {
			        	layer.close(index);
			        	window.location = "${pageContext.request.contextPath}/index.shtml";
					});
             }
         });
	 })
	</script>
</body>
</html>