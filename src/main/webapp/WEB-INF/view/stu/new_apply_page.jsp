<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link rel="icon" href="images/favicon.png">
<title>CQU党建</title>

<meta
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"
	name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />

<link
	href="<%=request.getContextPath()%>/font-style/signIn/css/style.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/font-style/tanchuang/css/animate.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/font-style/tanchuang/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/font-style/tanchuang/syalert/syalert.min.css" />
<script
	src="<%=request.getContextPath()%>/font-style/tanchuang/syalert/syalert.min.js"></script>


<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

*:focus {
	outline: none;
}

.tsm {
	background: #333;
	font-size: 13px;
	color: #fff;
	margin: 20px;
	margin-top: 0px;
	padding: 12px;
	line-height: 25px;
}

.tsm .p2 {
	margin-top: 12px;
}

.btns {
	padding: 20px;
}

.btns div {
	display: block;
	text-align: center;
	cursor: pointer;
	padding: 10px;
	border-radius: 5px;
	background: #0CC;
	color: #fff;
	margin-bottom: 12px;
	width: 100%;
}
</style>

</head>

<body>
		<script type="text/javascript">
	var isLogin = "<%=session.getAttribute("isLogin")%>";
	if(isLogin!='1'){
		alert("您好，请先登录！");
		window.location.href='<%=request.getContextPath()%>/';
	};

		var msg = "${message}";
		if (msg == "1") {
			alert('提交成功');
		}
		if (msg == "2") {
			alert('提交失败');
		}
	</script>

	<section class="aui-flexView"> <header
		class="aui-navBar aui-navBar-fixed"> <a
		href="/mis/stu/info_page" class="aui-navBar-item"> <i
		class="icon icon-return"></i>
	</a>
	<div class="aui-center">
		<span class="aui-center-title"></span>
	</div>
	</header> <section class="aui-scrollView">
	<div class="aui-flex aui-flex-bottom">
		<div class="aui-flex-box">
			<h1>申请入党</h1>
		</div>
	</div>
	<p></p>
	<div class="aui-flex b-line">
		<div class="aui-flex-box"></div>
	</div>
	<div>
		<center>
			<div class="aui-flex-box">
				<h5>尚未申请入党，点击下方提交申请</h5>
			</div>
		</center>
	</div>

	</section> <a href="/mis/stu/applyJoin">
		<div class="aui-footer-group aui-footer-flex1">
			<div class="aui-footer-flex">
				<div class="aui-btn aui-btn-gray">
					<h2>申请入党</h2>
				</div>
			</div>
		</div>
	</a> </section>

	<script>
		function ok(id) {
			syalert.syhide(id);
		}
	</script>
</body>
</html>
