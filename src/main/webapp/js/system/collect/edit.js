/*	//单独验证某一个input  class="checkpass"
	 jQuery.validator.addMethod("checkRole", function(value, element) {
	 	 return this.optional(element) || ((value.length <= 10) && (value.length>=3));
	 }, "角色名由3至10位字符组合构成");*/
	 $(function() {
		 $("form").validate({
	 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
	 			ly.ajaxSubmit(form,{//验证新增是否成功
	 				type : "post",
	 				dataType:"json",
	 				success : function(data) {
	 					if (data=="success") {
	 						layer.confirm('更新成功!是否关闭窗口?', function(index) {
	 							parent.grid.loadData();
					        	parent.layer.close(parent.pageii);
					        	return false;
	 						});
	 					} else {
	 						layer.alert('添加失败！', 3);
	 					}
	 				}
	 			});
	 		},rules : {
	 			"collectFormMap.evaluate" : {
					required : true,
				},
				"collectFormMap.carde":{
					required : true,
				},
				"collectFormMap.name":{
					required : true
				},
				"collectFormMap.target1":{
					required : true,
					digits:true
				},
				"collectFormMap.target2":{
					required : true,
					digits:true
				},
				"collectFormMap.target3":{
					required : true,
					digits:true
				},
				"collectFormMap.target4":{
					required : true,
					digits:true
				}
	 		},
	 		messages : {
	 			"collectFormMap.evaluate": {
					required : "请选择参评对象",
				},"collectFormMap.carde":{
					required :"请选择干部姓名",
				},"collectFormMap.name":{
					required :"请选择指标"
				},"collectFormMap.target1":{
					required :"指标1分数不能为空",
					digits:"指标1输入的必须是数字"
				},"collectFormMap.target2":{
					required :"指标2分数不能为空",
					digits:"指标2输入的必须是数字"
				},"collectFormMap.target3":{
					required :"指标3分数不能为空",
					digits:"指标3输入的必须是数字"
				},"collectFormMap.target4":{
					required :"指标4分数不能为空",
					digits:"指标4输入的必须是数字"
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

