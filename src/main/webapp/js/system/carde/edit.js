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
	 		},
	 		rules : {
	 			"cardeFormMap.cardename" : {
					required : true,
					rangelength:[2,5]
				},
				"cardeFormMap.age":{
					required : true,
					digits:true
				},
				"cardeFormMap.company":{
					required : true
				},
				"cardeFormMap.department":{
					required : true
				},
				"cardeFormMap.post":{
					required : true
				},
				"cardeFormMap.sdate":{
					required : true
				},
				"cardeFormMap.mark":{
					required : true,
					minlength:[5]
				}
	 		},
	 		messages : {
	 			"cardeFormMap.cardename": {
					required : "请输入干部姓名",
					rangelength: $.validator.format("姓名长度在 {0} 到 {1} 之间")
				},"cardeFormMap.age":{
					required :"年龄不能为空",
					digits: "年龄只能输入数字",
					
				},"cardeFormMap.company":{
					required :"单位不能为空"
				},"cardeFormMap.department":{
					required :"部门不能为空"
				},"cardeFormMap.post":{
					required :"职位不能为空"
				},"cardeFormMap.sdate":{
					required :"入职时间不能为空"
				},"cardeFormMap.mark":{
					required :"入职时间不能为空",
					minlength: $.validator.format("简介最少要输入 {0} 个字符"),
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

