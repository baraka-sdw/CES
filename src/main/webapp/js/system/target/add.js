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
	 			"targetFormMap.question_name" : {
					required : true,
				},
				"targetFormMap.target1":{
					required : true,
				},
				"targetFormMap.target2":{
					required : true
				},
				"targetFormMap.target3":{
					required : true,
				},
				"targetFormMap.target4":{
					required : true,
				}
	 		},
	 		messages : {
	 			"targetFormMap.name": {
					required : "请输入问卷名称",
				},"targetFormMap.target1":{
					required :"请输入指标1名称",
				},"targetFormMap.target2":{
					required :"请输入指标2名称"
				},"targetFormMap.target3":{
					required :"请输入指标3名称",
				},"targetFormMap.target4":{
					required :"请输入指标4名称",
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

