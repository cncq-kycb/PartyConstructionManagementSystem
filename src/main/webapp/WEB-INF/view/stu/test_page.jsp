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
<link href="<%=request.getContextPath()%>/exam/main.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/exam/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/exam/test.css"
	rel="stylesheet" type="text/css" />

<style>
.hasBeenAnswer {
	background: #5d9cec;
	color: #fff;
}

.reading h2 {
	width: 100%;
	margin: 20px 0 70px;
	text-align: center;
	line-height: 2;
	font-size: 20px;
	color: #59595b;
}

.reading h2 a {
	text-decoration: none;
	color: #59595b;
	font-size: 20px;
}

.reading h2 a:hover {
	color: #2183f1;
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
			<li><a href="/mis/stu/study_center_page"><i class="fas fa-graduation-cap"></i>学习中心</a></li>
			<li><a href="/mis/stu/party_life_page"><i class="fas fa-calendar-alt"></i>组织生活</a></li>
			<li><a href="/mis/stu/info_page"><i class="fas fa-user"></i>个人中心</a></li>		
			<li><a href="/mis/logout"><i class="fas fa-sign-out-alt"></i>退出登录</a></li>
		</ul>
	</div>
	<!-- end sidebar left -->

	<!-- slider -->
	<div class="container">
		<div class="slide">
			<div class="content">
				<div class="mask-red"></div>
				<div class="slider-caption">
					<h2>${test_name}</h2>
					<p>${test_start_time}</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end slider -->

	<!-- features -->
	<div class="features segments">
		<div class="container">
			<div class="row">
				<div>
					<div>
						<div class="test">
							<form method="post" name="thisForm" id="thisForm">
								<div class="test_content">
									<div class="test_content_title">
										<center>
											<span>共</span> <i class="content_lit">${test_length}</i> <span>题，</span>
											<span>合计</span> <i class="content_fs">${test_total_score}</i>
											<span>分</span>
										</center>
									</div>
								</div>
								<div class="test_content_nr">
									<ul>
										<div>${content}</div>
										<center>
											<h1>&ensp;&ensp;</h1>
											<button type="button" class="button"
												onclick="submitButton('/mis/stu/postAnswer')">交 卷</button>
											<h1>&ensp;&ensp;</h1>
										</center>
									</ul>
								</div>
								<input id="answer_list" type="text" name="answer_list" readonly
									type="hidden">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end features -->
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

	<script src="http://cdn.bootstrapmb.com/jquery/jquery-1.11.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/exam/jquery.easy-pie-chart.js"></script>
	<!--时间js-->
	<script
		src="<%=request.getContextPath()%>/exam/time/jquery.countdown.js"></script>
	<script>
		window.jQuery(function($) {
			"use strict";

			$('time').countDown({
				with_separators : false
			});
			$('.alt-1').countDown({
				css_class : 'countdown-alt-1'
			});
			$('.alt-2').countDown({
				css_class : 'countdown-alt-2'
			});

		});

		$(function() {
			$('li.option label').click(
					function() {
						debugger;
						var examId = $(this).closest('.test_content_nr_main')
								.closest('li').attr('id'); // 得到题目ID
						var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
						// 设置已答题
						if (!cardLi.hasClass('hasBeenAnswer')) {
							cardLi.addClass('hasBeenAnswer');
						}

					});
		});

		function submitButton(href) {
			var len = ${test_length};
			var record_ids = "";
			for (var i = 0; i < len; i++) {
				var flag = false;
				var name = "answer" + (i + 1).toString();
				var obj = document.getElementsByName(name);
				for (var j = 0; j < 4; j++) {
					if (obj[j].checked) {
						record_ids += (j + 1).toString() + ",";
						flag = true;
						break;
					}
				}
				if (flag == false) {
					record_ids += "0" + ",";
				}
			}
			record_ids = record_ids.substring(0, record_ids.length - 1);
			$("#answer_list").val(record_ids);
			var form = document.thisForm;
			form.action = href;
			form.submit();
		}
	</script>

</body>
</html>
