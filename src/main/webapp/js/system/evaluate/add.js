//	单独验证某一个input  class="checkpass"
	 jQuery.validator.addMethod("checkRole", function(value, element) {
	 	 return this.optional(element) || ((value.length <= 10) && (value.length>=3));
	 }, "角色名由3至10位字符组合构成");
	 $(function() {
	 	$("form").validate({
	 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
	 			ly.ajaxSubmit(form,{//验证新增是否成功
	 				type : "post",
	 				dataType:"json",
	 				success : function(data) {
	 					if (data=="success") {
	 						layer.confirm('添加成功!是否关闭窗口?', function(index) {
	 							parent.grid.loadData();
					        	parent.layer.close(parent.pageii);
					        	return false;
	 						});
	 						$("#form")[0].reset();
	 					} else {
	 						layer.msg('添加失败！');
	 					}
	 				}
	 			});
	 		},rules : {
	 			"evaluateFormMap.evaluateName" : {
					required : true,
				},
				"evaluateFormMap.evaluateCode":{
					required : true,
				},
				"evaluateFormMap.target":{
					required : true
				},
				"evaluateFormMap.object":{
					required : true,
				},
				"evaluateFormMap.batch":{
					required : true,
				},
				"evaluateFormMap.number":{
					required : true,
					digits:true
				},
				"evaluateFormMap.startdate":{
					required : true,
				},
				"evaluateFormMap.enddate":{
					required : true,
				}
	 		},
	 		messages : {
	 			"evaluateFormMap.evaluateName": {
					required : "测评名称不能为空",
				},"evaluateFormMap.evaluateCode":{
					required :"测评代码不能为空",
				},"evaluateFormMap.target":{
					required :"请选择指标"
				},"evaluateFormMap.object":{
					required :"参评对象不能为空",
				},"evaluateFormMap.batch":{
					required :"批次不能为空",
				},"evaluateFormMap.number":{
					required :"参评人数不能为空",
					digits:"参评人数必须是数字"
				},"evaluateFormMap.startdate":{
					required :"开始日期不能为空，请选择开始日期",
				},"evaluateFormMap.enddate":{
					required :"结束日期不能为空，请选择结束日期",
				}
			},
	 		errorPlacement : function(error, element) {//自定义提示错误位置
	 			$(".l_err").css('display','block');
	 			//element.css('border','3px solid #FFCCCC');
	 			$(".l_err").html(error.html());
	 		},
	 		success: function(label) {//验证通过后
	 			$(".l_err").css('display','none');
	 		}
	 	});
	 });

