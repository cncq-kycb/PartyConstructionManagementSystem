<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table tr th, td {
	border: 1px solid red;
	text-align: center;
}

table tr th {
	border: 1px solid red;
	text-align: center;
}
</style>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>党员管理系统</title>
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

	<div class="page">
		<header class="header"> </header>
		<div class="page-content d-flex align-items-stretch">
			<div class="content-inner">
				<blockquote class="layui-elem-quote">
					<center>
						<div class="cxbottom">
							<h1>&ensp;</h1>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><h1>${activity_name}</h1></label>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">活动日期：${activity_date}&ensp;&ensp;&ensp;&ensp;活动地点：${activity_location}&ensp;&ensp;&ensp;&ensp;参与支部：${branch_name}&ensp;&ensp;&ensp;&ensp;活动时长：${activity_duration}小时&ensp;&ensp;&ensp;&ensp;活动状态：${activity_status}</label>
							</div>
						</div>
					</center>
				</blockquote>
				<div class="layui-form-item">
					<div class="layui-inline">

						<div style="margin-left:150px;" class="layui-input-block">${activity_item}</div>
					</div>
				</div>
				<div class="cxbottom">
					<center>
						<h1>&ensp;</h1>
					</center>
				</div>
			</div>
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

</body>
</html>