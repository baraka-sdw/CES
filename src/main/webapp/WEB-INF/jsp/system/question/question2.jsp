<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/common/common.jspf" %>
<div id="main">
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
				
	<form  class="form-inline" role="form" id="form"
			name="form">
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="control-label">选择部门:</label>
				<div class="" style="width: 200px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.carde" id="carde">
						<c:forEach items="${carde}" var="key">
							<option value="${key.id}" id="${key.department}">${key.department}</option>
						</c:forEach>
					</select>
				</div>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="control-label">选择问卷:</label>
				<div class="" style="width: 200px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.target" id="target">
						<c:forEach items="${target}" var="key">
							<option value="${key.id}" id="${key.question_name}">${key.question_name}</option>
						</c:forEach>
					</select>
				</div>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="control-label">请选择测评名称</label>
				<div class="" style="width: 200px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="input-xlarge btn-group m-r form-control"
						name="collectFormMap.evaluate" id="evaluate">
						<c:forEach items="${evaluate}" var="key">
							<option value="${key.id}">${key.evaluateName}</option>
						</c:forEach>
					</select>
				</div>
				
                <table class="table table-hover table-condensed table-bordered">
                  <thead>
                    <tr>
                      <th>姓名</th>
                      <th>部门</th>
                      <th id="label1">指标1</th>
                      <th id="label2" >指标2</th>
                      <th id="label3">指标3</th>
                      <th id="label4">指标4</th>
                      <th id="label5">指标5</th>
                      <th id="label6">指标6</th>
                      <th id="label7">指标7</th>
                      <th id="label8">指标8</th>
                      <th id="label9">指标9</th>
                      <th id="label10">指标10</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            <input type="hidden" id="weight1"name="collectFormMap.weight1" value="" class="" />
			<input type="hidden" id="weight2"name="collectFormMap.weight2" value="" class="" />
			<input type="hidden" id="weight3"name="collectFormMap.weight3" value="" class="" />
			<input type="hidden" id="weight4"name="collectFormMap.weight4" value="" class="" />	
			<input type="hidden" id="weight5"name="collectFormMap.weight5" value="" class="" />
			<input type="hidden" id="weight6"name="collectFormMap.weight6" value="" class="" />
			<input type="hidden" id="weight7"name="collectFormMap.weight7" value="" class="" />
			<input type="hidden" id="weight8"name="collectFormMap.weight8" value="" class="" />
			<input type="hidden" id="weight9"name="collectFormMap.weight9" value="" class="" />
			<input type="hidden" id="weight10"name="collectFormMap.weight10" value="" class="" />
               <button type="button" class="btn btn-success btn-s-xs" style="" id="submit">提交</button>
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
				 $("#label1").text(data.target1);
				 $("#label2").text(data.target2);
				 $("#label3").text(data.target3);
				 $("#label4").text(data.target4);
				 $("#label5").text(data.target5);
				 $("#label6").text(data.target6);
				 $("#label7").text(data.target7);
				 $("#label8").text(data.target8);
				 $("#label9").text(data.target9);
				 $("#label10").text(data.target10);
				 $("#weight1").val(data.weight1);
				 $("#weight2").val(data.weight2);
				 $("#weight3").val(data.weight3);
				 $("#weight4").val(data.weight4);
				 $("#weight5").val(data.weight5);
				 $("#weight6").val(data.weight6);
				 $("#weight7").val(data.weight7);
				 $("#weight8").val(data.weight8);
				 $("#weight9").val(data.weight9);
				 $("#weight10").val(data.weight10);
			  },
			  error: function(){
					alert("获取数据错误");
				}
			});
	});
    $("select#carde").change(function(event) {
    	  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/carde/findByDepartment.shtml",
			  data: "department="+$(this).children('option:selected').attr("id"),
			  async: false,
			  dataType:"json",
			  success: function(data) {
				  $("tbody tr").empty();
				  $.each(data, function(key, sort) {
					  var style;
					  if(key%3==0){
						  style="success";
					  }else if(key%3==1){
						  style="warning";
					  }else if(key%3==2){
						  style="info";
					  }
					  $("tbody").append("<tr class="+style+">"+
					                   "<td><input style='width: 100px;border: none; ' value="+sort.cardename+" name='collectFormMap.cardename' id='cardename'  readonly='readonly'></td>"+
					                   "<td><input style='width: 100px;border: none; ' value="+sort.department+" name='collectFormMap.department' id='department'  readonly='readonly'></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target1' id='target1'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target2' id='target2'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target3' id='target3'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target4' id='target4'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target5' id='target5'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target6' id='target6'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target7' id='target7'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target8' id='target8'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target9' id='target9'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"+
					                   "<td> <select style='width:100%;height:100%;'name='collectFormMap.target10' id='target10'><option value='95'>优秀</option><option value='85'>良</option><option value='75'>中等</option><option value='65'>及格</option></select></td>"
					                   +"</tr>"
					   );
			 		})
			  },
			  error: function(){
					alert("获取数据错误");
				}
			});
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
           	 layer.confirm('提交成功!是否关闭窗口?', function(index) {
			        	layer.close(index);
			        	window.location = "${pageContext.request.contextPath}/index.shtml";
					});
            }
        });
	 })
	 $("#label1").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label1', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label2").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label2', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label3").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label3', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label4").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label4', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label5").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label5', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label6").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label6', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label7").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label7', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label8").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label8', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label9").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label9', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	 
	 $("#label10").hover(function(event){
		  $.ajax({
			  type: 'POST',
			  url: "${pageContext.request.contextPath}/targetnext/findTargetNextByTargetName.shtml",
			  data: "targetName="+$(this).text(),
			  dataType:"json",
			  async: false,
			  success: function(data) {
				  layer.tips(data.description, '#label10', {
					  tips: [1, '#3595CC'],
					  time: 4000
					});
			  },
			  error: function(){
					alert("获取数据错误");
				}
			}); 
		
	 },function(index){
		 layer.closeAll('tips'); //关闭所有的tips层 
	 })
	</script>
</div>
