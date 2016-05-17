	//单独验证某一个input  class="checkpass"
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
	 			"targetNextFormMap.target" : {
					required : true,
				},
				"targetNextFormMap.targetName":{
					required : true,
				},
				"targetNextFormMap.weight":{
					required : true,
					digits:true,
					rangelength:[0,100]
				}
	 		},
	 		messages : {
	 			"targetNextFormMap.target": {
					required : "请输入一级指标名称",
				},"targetNextFormMap.targetName":{
					required :"请输入指标名称",
				},"targetNextFormMap.weight":{
					required :"请输入权重",
					digits:"权重必须是数字",
					rangelength: $.validator.format("权重在 {0} 到 {1} 之间")
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

