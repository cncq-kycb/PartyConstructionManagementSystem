<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			alert('签到成功');
		}
		if (msg == "2") {
			alert('签到失败');
		}
		if (msg == "3") {
			alert('请假成功');
		}
		if (msg == "4") {
			alert('请假失败');
		}
	</script>

	<section class="aui-flexView"> <header
		class="aui-navBar aui-navBar-fixed"> <a
		href="/mis/stu/activitySignInPage" class="aui-navBar-item"> <i
		class="icon icon-return"></i>
	</a>
	<div class="aui-center">
		<span class="aui-center-title"></span>
	</div>
	</header> <section class="aui-scrollView">
	<div class="aui-flex aui-flex-bottom">
		<div class="aui-flex-box">
			<h1>${activity_name}</h1>
		</div>
		<div class="aui-right-text">
			<p>进行中</p>
		</div>
	</div>
	<div class="aui-flex">
		<div class="aui-flex-box">
			<span> <i class="icon icon-ad"></i>${activity_location}
			</span> <span> <i class="icon icon-yew"></i>${branch_name}
			</span> <span> <i class="icon icon-xul"></i>${activity_duration}小时
			</span>
		</div>
	</div>





	<div class="aui-flex b-line">
		<div class="aui-flex-box">
			<h4>活动详情</h4>
			${activity_item}
			<p></p>
			<p></p>
		</div>
	</div>

	</section> <footer class="aui-footer-button aui-footer-flex aui-footer-fixed">
	<a href="/mis/stu/absent_attendance">
		<div class="aui-footer-wrap">
			<span>请 假</span>
		</div>
	</a>
	<div class="aui-footer-group aui-footer-flex1">
		<div class="aui-footer-flex">
			<div class="aui-btn aui-btn-gray" onClick="syalert.syopen('alert4')">
				<h2>签 到</h2>
			</div>
		</div>
	</div>
	</footer> </section>

	<!-- 自定义弹窗 -->
	<form action="/mis/stu/upload_file" method="post"
		onsubmit="return checkFile()" enctype="multipart/form-data">
		<div class="sy-alert sy-alert-model animated" sy-enter="zoomIn"
			sy-leave="zoomOut" sy-type="confirm" sy-mask="true" id="alert4">
			<div class="sy-title">上传照片签到</div>
			<div class="sy-content">
				<div class="form">

					<p class="input-item">
						<label class="heading">请上传.jpg照片</label> <input type="file"
							class="form-control" accept=".jpg" id="file" name="file">
				</div>
			</div>
			<div class="sy-btn">
				<button type="button" onclick="location.reload()">取消</button>
				<button type="submit">确定</button>
			</div>
		</div>
	</form>
	<script>
		function ok(id) {
			syalert.syhide(id);
		}
	</script>
	<script type="text/javascript">
		function checkFile() {
			var fileName = document.getElementById("file").value;
			var seat = fileName.lastIndexOf(".");
			var extension = fileName.substring(seat).toLowerCase();
			if (extension != ".jpg") {
				alert("仅可上传.jpg文件");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
