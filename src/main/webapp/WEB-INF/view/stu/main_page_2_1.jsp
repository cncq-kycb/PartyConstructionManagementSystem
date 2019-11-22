<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon" href="images/favicon.png">
<title>CQU党建</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/materialize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/loader.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/fontawesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Edugo/css/style.css">

</head>
<body>
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "1") {
			alert('暂无可答题目');
		}
	</script>

	<!-- preloader -->
	<div class="loader-wrapper">
		<div class="loader-cube"></div>
	</div>
	<!-- end preloader -->

	<!-- navbar -->
	<div class="navbar">
		<div class="container">
			<div class="row">
				<div class="col s6">
					<div class="content-left">
						<a href="index.html">
							<h1>
								<span class="color-indigo1">C</span><span class="color-indigo2">Q</span><span
									class="color-indigo3">U</span><span class="color-indigo4">党</span><span
									class="color-indigo5">建</span>
							</h1>
						</a>
					</div>
				</div>
				<div class="col s6">
					<div class="content-right">
						<a href="#slide-out" data-activates="slide-out" class="sidebar"><i
							class="fas fa-bars"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end navbar -->

	<!-- sidebar left -->
	<div class="sidebar-panel">
		<ul id="slide-out" class="collapsible side-nav">
			<li class="list-top">
				<div class="user-view">
					<h4>${student_name}</h4>
					<span>${branch_name}</span>
				</div>
			</li>
			<li><a href="/mis/stu/main_page_2"><i class="fas fa-home"></i>主页</a></li>
			<li><a href="/mis/stu/study_center_page"><i
					class="fas fa-graduation-cap"></i>学习中心</a></li>
			<li><a href="/mis/stu/party_life_page"><i
					class="fas fa-calendar-alt"></i>组织生活</a></li>
			<li><a href="/mis/stu/info_page"><i class="fas fa-user"></i>个人中心</a></li>
			<li><a href="/mis/login"><i class="fas fa-sign-in-alt"></i>登
					录</a></li>
			<li><a href="/mis/register"><i class="fas fa-user-plus"></i>注
					册</a></li>
			<li><a href="/mis/logout"><i class="fas fa-sign-out-alt"></i>退出登录</a></li>
		</ul>
	</div>
	<!-- end sidebar left -->




	<!-- slider -->
	<div class="container">
		<div class="slide">
			<div class="slider-slide owl-carousel owl-theme">
				<a href="/mis/stu/NCCPC_page">
					<div class="content">
						<div class="mask-red"></div>
						<div class="slider-caption">
							<h2>十九大讲话</h2>
							<p>富强 民主 文明 和谐</p>
						</div>
					</div>
				</a> <a href="/mis/stu/member_read_page">
					<div class="content">
						<div class="mask-blue"></div>
						<div class="slider-caption">
							<h2>党员必读</h2>
							<p>自由 平等 公正 法制</p>
						</div>
					</div>
				</a> <a href="/mis/stu/material_page">
					<div class="content">
						<div class="mask-purple"></div>
						<div class="slider-caption">
							<h2>历史学习资料</h2>
							<p>爱国 敬业 诚信 友善</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- end slider -->

	<!-- features -->
	<div class="features segments">
		<div class="container">
			<div class="row">
				<div class="col s6">
					<a href="/mis/stu/info_page">
						<div class="content">
							<i class="fas fa-phone bg-red"></i>
							<h5>个人中心</h5>
						</div>
					</a>
				</div>
				<div class="col s6">
					<a href="/mis/stu/test_page">
						<div class="content">
							<i class="fas fa-globe-europe bg-purple"></i>
							<h5>每日竞答</h5>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col s6">
					<a href="/mis/stu/view_activity_page">
						<div class="content">
							<i class="fas fa-check bg-blue"></i>
							<h5>活动签到/请假</h5>
						</div>
					</a>
				</div>
				<div class="col s6">
					<a href="/mis/stu/life_record_page">
						<div class="content">
							<i class="fas fa-chart-area bg-blue2"></i>
							<h5>组织生活记录</h5>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- end features -->
	<div>&ensp;&ensp;</div>


	<!-- footer -->
	<footer>
	<div class="container">
		<div class="wrap-logo">
			<h3>CQU党建</h3>
		</div>
		<div class="wrap-desc">
			<p>研究学术 造就人才 佑启乡邦 振导社会</p>
		</div>

		<div class="footer-text">
			<p>Copyright ©重庆大学 All Right Reserved</p>
		</div>
	</div>
	</footer>
	<!-- end footer -->

	<script src="<%=request.getContextPath()%>/Edugo/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/materialize.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/Edugo/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/main.js"></script>

</body>
</html>
