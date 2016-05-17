<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en"	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<link href="/favicon.ico" type="image/x-icon" rel=icon>
<link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta name="renderer" content="webkit">
<title>登录－干部测评系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath}/admin_files/min.css">
<link rel="stylesheet"	href="${pageContext.servletContext.contextPath }/admin_files/login.css">
<link	href="${pageContext.servletContext.contextPath }/admin_files/css.css"	rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery/jquery-1.8.3.js"></script>

<!--[if lt IE 9]> 
	<script src="${ctx}/js/jquery/ie/html5shiv.js"></script> 
	<script src="${ctx}/js/jquery/ie/respond.min.js"></script>
<![endif]-->
<style type="text/css">
      #error{
    background: none repeat scroll 0 0 #FFFCC7;
    border: 1px solid #FFC340;
    font-size: 12px;
    color:red;
    padding: 4px 8px;
    width: 200px;
    display: none;
    text-align: center;
    }
</style>
</head>
<body onload="javascript:to_top()" 
	style="background-image: url('${pageContext.servletContext.contextPath }/admin_files/9.jpg');margin-top:0px;background-repeat:no-repeat;background-size: 100% auto;">
	<div id="loginbox" style="padding-top: 10%;">
		<form id="loginform" name="loginform" class="form-vertical"
			style="background-color: rgba(0, 0, 0, 0.5) !important; background: #000; filter: alpha(opacity = 50); *background: #000; *filter: alpha(opacity = 50); /*黑色透明背景结束*/ color: #FFF; bottom: 0px; right: 0px; border: 1px solid #000;"
			action="${pageContext.servletContext.contextPath }/login.shtml"
			method="post">
			<div class="control-group normal_text">
				<table style="width: 100%">
					<tr>
						<td align="left"><img
							src="${pageContext.servletContext.contextPath }/admin_files/logo_left.png"
							alt="Logo"></td>
							<td align="center" style="font-weight: bold 2px;color:#228DFF; text-shadow: 1px 3px 3px rgba(135, 206, 235, 1)">干部测评系统</td>
						<td align="right"><img
							src="${pageContext.servletContext.contextPath }/admin_files/logo_left.png"
							alt="Logo"></td>
					</tr>
				</table>

			</div>
			<div id="error" style="width: 100%; margin-top: 2px;">123</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly" style="background: #28b779"><img
							src="${pageContext.servletContext.contextPath }/admin_files/account_1.png"
							alt="请输入账号.."></span><input type="text" placeholder="请输入用户名" name="username" value="sdw"
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><img
							src="${pageContext.servletContext.contextPath }/admin_files/lock_1.png"
							alt="请输入密码.."></span><input type="password" placeholder="请输入密码" name="password" value="123456"
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<div class="controls">
					<div class="main_input_my">
						<span class="add-on bg_ly"><img
							src="${pageContext.servletContext.contextPath }/admin_files/22.png"
							alt="请输入验证码.."></span><input type="text" placeholder="请输入验证码" name="kaptchaValidate" value=""
							style="height: 32px; margin-bottom: 0px;"/><img title="看不清?点击换下一张"   onclick="this.src='${pageContext.servletContext.contextPath }/captcha/validate.shtml?d='+new Date().getTime()" src="${pageContext.servletContext.contextPath }/captcha/validate.shtml" style="height: 32px;"/>
					</div>
				</div>
			</div>
			
			
			<div class="form-actions">
				<span class="pull-left" style="width: 33%"><a href="#"
					class="flip-link btn btn-info" id="to-recover">忘记密码？</a></span>
					<span class="pull-left" style="width: 33%"></span><!-- to-recover <a href="install.shtml"
					class="flip-link btn btn-danger" id="">一键初始化系统</a>-->
					 <span
					class="pull-right"><a type="submit"
					href="javascript:checkUserForm()" class="btn btn-success">登&nbsp;&nbsp;录</a></span>
			</div>
			
		</form>
	</div>
	<script type="text/javascript">
		if ("${error}" != "") {
			$("#error").css('display','block');
			$("#error").text("${error}")
		}
		function checkUserForm() {
			document.loginform.submit();
		}
		function to_top(){
			if(window != top){
		        top.location.href=location.href;
		    }
		}
	</script>
	
</body>
</html>