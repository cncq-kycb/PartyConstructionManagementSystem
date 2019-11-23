<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CQU党建</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/fontastic.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/custom.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/lib/img/favicon.ico">
</head>
<body>
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "2") {
			alert('密码错误，请重新登录');
		}
		if (msg == "1") {
			alert('密码修改成功，请重新登录');
		}
		if (msg == "3") {
			alert('密码修改失败，请重新登录');
		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js"
		type="text/javascript"></script>
	<div class="page login-page">
		<div class="container d-flex align-items-center">
			<div class="form-holder has-shadow">
				<div class="row">
					<div class="col-lg-6">
						<div class="info d-flex align-items-center">
							<div class="content">
								<center>
									<div class="logo">
										<h1>重庆大学计算机学院</h1>
									</div>
									<h1>党员管理系统</h1>
								</center>
							</div>
						</div>
					</div>
					<div class="col-lg-6 bg-white">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form name="inputForm" action="login"
									onsubmit="return validateForm()" method="post"
									class="form-validate">
									<div class="form-group">
										<input id="user_account" type="text" name=user_account
											class="input-material"> <label for="login-username"
											class="label-material">用户名</label>
									</div>
									<div class="form-group">
										<input id="user_password" type="password" name="user_password"
											class="input-material"> <label for="login-password"
											class="label-material">登录密码</label>
									</div>
									<button id="login" class="btn btn-primary">登 录</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyrights text-center"></div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/popper.js/umd/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/chart.js/Chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/lib/js/front.js"></script>
	<script>
		function validateForm() {
			var user_id = document.forms["inputForm"]["user_account"].value;
			var user_password = document.forms["inputForm"]["user_password"].value;
			if (user_id == null || user_id == "" || user_password == null
					|| user_password == "") {
				alert("用户名与密码不能为空!");
				return false;
			}
		}
	</script>
</body>
</html>