<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
input{
font-size:50px;
}
label{
font-size:14px;
}

</style> 
</head>
<body>
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
			<li><a href="/mis/login"><i class="fas fa-sign-in-alt"></i>登    录</a></li>
			<li><a href="/mis/register"><i class="fas fa-user-plus"></i>注    册</a></li>
			<li><a href="/mis/logout"><i class="fas fa-sign-out-alt"></i>退出登录</a></li>
		</ul>
	</div>
	<!-- end sidebar left -->
	

				
	<!-- slider -->
	
		<div>&ensp;&ensp;</div>
	<div>&ensp;&ensp;</div>
<div>&ensp;&ensp;</div>
	
		<div>&ensp;&ensp;</div>
	<div>&ensp;&ensp;</div>
<div>&ensp;&ensp;</div>
	<form class="form-horizontal" name="inputForm"
								action="/mis/stu/updateInfo" onsubmit="return validateForm()"
								method="post">
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;学&ensp;&ensp;号：&ensp;&ensp;${vstudent.student_num }</label>

								
								</div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;姓&ensp;&ensp;名：&ensp;&ensp;${vstudent.student_name }</label>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;所属支部：${vstudent.branch_name }</label>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;当前状态：${vstudent.student_status } </label>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;当前权限：${vstudent.student_permission }</label>
					
								</div>
								<div class="line"></div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;联系电话：</label>
									
										<input type="text" name="student_tel"
											placeholder=${vstudent.student_tel } class="form-control">
								
								</div>
								<div class="line"></div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">&ensp;&ensp;电子邮箱：</label>
									
										<input type="text" name="student_email"
											placeholder=${vstudent.student_email } class="form-control">
									
								</div>
								<div class="line"></div>
								<div class="form-group row">
								<center>
									<div >
										<button type="submit" class="btn btn-primary">提交</button>
									</div></center>
								</div>
							</form>
	
	
		<div>&ensp;&ensp;</div>
	<div>&ensp;&ensp;</div>
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
	<script src="<%=request.getContextPath()%>/Edugo/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/Edugo/js/main.js"></script>
	<script>
		function validateForm() {
			var user_phone = document.forms["inputForm"]["student_tel"].value;
			if (user_phone == null || user_phone == "") {
				return true;
			}
			var myreg = /^1(3|4|5|7|8)\d{9}$/;//正则表达式：有效手机号码
			if (!myreg.test(user_phone)) {
				alert("请输入正确联系电话（手机号码）");
				return false;
			}
		}
	</script>

</body>
</html>
