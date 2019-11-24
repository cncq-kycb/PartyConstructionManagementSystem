<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="icon" href="images/favicon.png">
	<title>CQU党建</title>



	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/materialize.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/loader.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/fontawesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Edugo/css/style.css">

<style>
/* Red border */
hr.new1 {
  border-top: 1px solid red;
}
 
/* Dashed red border */
hr.new2 {
  border-top: 1px dashed red;
}
 
/* Dotted red border */
hr.new3 {
  border-top: 1px dotted red;
}
 
/* Thick red border */
hr.new4 {
  border: 1px solid red;
}
 
/* Large rounded green border */
hr.new5 {
  border: 10px solid green;
  border-radius: 5px;
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
						<a href="/mis/stu/main_page_2">
							<h1>
								<span class="color-indigo1">C</span><span class="color-indigo2">Q</span><span class="color-indigo3">U</span><span class="color-indigo4">党</span><span class="color-indigo5">建</span>
							</h1>
						</a>
					</div>
				</div>
				<div class="col s6">
					<div class="content-right">
						<a href="#slide-out" data-activates="slide-out" class="sidebar"><i class="fas fa-bars"></i></a>
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
			<li><a href="/mis/stu/study_center_page"><i class="fas fa-graduation-cap"></i>学习中心</a></li>
			<li><a href="/mis/stu/party_life_page"><i class="fas fa-calendar-alt"></i>组织生活</a></li>
			<li><a href="/mis/stu/info_page"><i class="fas fa-user"></i>个人中心</a></li>		
			<li><a href="/mis/logout"><i class="fas fa-sign-out-alt"></i>退出登录</a></li>
		</ul>
	</div>
	<!-- end sidebar left -->
	

				
				<h1>&ensp;</h1>
				<!-- counter -->
	<div class="counter segments">
		<div class="container">
			<div class="row">
							<div class="col s3">
					<div class="content">
						<h3 class="numscroller" data-min="1" data-max="1030" data-delay="10" data-increment="2"></h3>
						<h4></h4>
					</div>
				</div>
				<div class="col s3">
					<div class="content">
						<h3 class="numscroller" data-min="1" data-max="1030" data-delay="10" data-increment="2">${total_time}</h3>
						<h4>组织生活次数</h4>
					</div>
				</div>
				<div class="col s3">
					<div class="content">
						<h3 class="numscroller" data-min="1" data-max="154" data-delay="10" data-increment="2">${total_duration}</h3>
						<h4>活动总计时长</h4>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- end counter -->
				<h1>&ensp;</h1>	<h1>&ensp;</h1>
				<h4>&ensp;&ensp;&ensp;活动参与情况</h4>

<hr class="new4">

				<div class="pricing-table segments-page">
		<div class="container">
			${content}
		</div>
	</div>

	
				<h4>&ensp;&ensp;</h4>
	



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






	<script src="<%=request.getContextPath()%>/lib/js/front.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/materialize.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/main.js"></script>

</body>
</html>