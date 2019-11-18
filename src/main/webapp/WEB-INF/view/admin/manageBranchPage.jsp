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
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "3") {
			alert('设置管理员成功');
		}
		if (msg == "4") {
			alert('设置管理员失败');
		}
		if (msg == "1") {
			alert('移出支部成功');
		}
		if (msg == "2") {
			alert('移出支部失败');
		}
		if (msg == "5") {
			alert('取消管理员成功');
		}
		if (msg == "6") {
			alert('取消管理员失败');
		}
	</script>
	<div class="page">
		<header class="header"> <nav class="navbar">
		<div class="container-fluid">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header">
					<a href="/mis/main_page_1"
						class="navbar-brand d-none d-sm-inline-block">
						<div class="brand-text d-none d-lg-inline-block">党员管理系统</div>
						<div class="brand-text d-none d-sm-inline-block d-lg-none">
							<strong>党员管理系统</strong>
						</div>
					</a> <a id="toggle-btn" href="#" class="menu-btn active"> <span></span><span></span><span></span>
					</a>
				</div>
				<ul
					class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
					<li class="nav-item"><a href="/mis/logout"
						class="nav-link logout"> <span class="d-none d-sm-inline">退出登录</span><i
							class="fa fa-sign-out"></i>
					</a></li>
				</ul>
			</div>
		</div>
		</nav> </header>
		<div class="page-content d-flex align-items-stretch">
			<nav class="side-navbar">
			<div class="sidebar-header d-flex align-items-center">
				<div class="title">
					<p>欢迎您：</p>
					<h1 class="h4">${admin_name}</h1>
				</div>
			</div>
			<span class="heading">用户管理</span>
			<ul class="list-unstyled">
				<li><a href="/mis/admin/authorityPage"> <i
						class="icon-list-1"></i>权限管理
				</a></li>
				<li><a href="#memberManager" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-user"></i>成员管理
				</a>
					<ul id="memberManager" class="collapse list-unstyled ">
						<li><a href="/mis/admin/manageMemberPage">成员信息管理</a></li>
						<li><a href="/mis/admin/updateStatusPage">成员级别管理</a></li>
					</ul></li>
				<li class="active"><a href="#branchManager"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-list"></i>支部管理
				</a>
					<ul id="branchManager" class="collapse list-unstyled ">
						<li><a href="/mis/admin/addMemberPage">添加支部成员</a></li>
						<li class="active"><a href="/mis/admin/manageBranchPage">支部成员管理</a></li>
					</ul></li>
			</ul>
			<span class="heading">组织生活管理</span>
			<ul class="list-unstyled">
				<li><a href="/mis/admin/addActivityPage"> <i
						class="icon-interface-windows"></i>活动的创建与发布
				</a></li>
				<li><a href="/mis/admin/manageSignInPage"> <i
						class="icon-grid"></i>组织生活签到管理
				</a></li>
			</ul>
			<span class="heading">内容管理</span>
			<ul class="list-unstyled">
				<li><a href="#editStudy" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-presentation"></i>学习中心内容编辑
				</a>
					<ul id="editStudy" class="collapse list-unstyled ">
						<li><a href="/mis/admin/insertStudyPage">发布学习内容</a></li>
						<li><a href="/mis/admin/manageStudyPage">管理学习内容</a></li>
					</ul></li>
				<li><a href="editCompetitionPage"> <i class="icon-padnote"></i>知识竞答编辑
				</a></li>
				<li><a href="#competitionResult" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-line-chart"></i>竞答结果统计
				</a>
					<ul id="competitionResult" class="collapse list-unstyled ">
						<li><a href="/mis/admin/resultByTestPage">按竞答查询</a></li>
						<li><a href="/mis/admin/resultByStudentPage">按学生查询</a></li>
					</ul></li>
			</ul>
			</nav>
			<div class="content-inner">

				<div style="margin: 0px; background-color: white; margin: 0 10px;">
					<blockquote class="layui-elem-quote">
						<div class="cxbottom">
							<center>
								<h1>&ensp;</h1>
							</center>
						</div>
						<div class="panel-body" style="padding-bottom: 0px;">
							<form class="form-horizontal" name="inputForm"
								action="manageBranchPageFinder" method="post">

								<div class="cxbottom">
									<center>
										选择支部： <select name="branch_name_input" id="branch_name_input">
											<c:forEach var="branch" items="${branch}">
												<option>${branch.branch_name }</option>
											</c:forEach>
										</select> &ensp;&ensp;
										<button type="submit">确 定</button>
									</center>
								</div>
							</Form>
						</div>
					</blockquote>
					<form class="form-horizontal" name="thisForm" id="thisForm"
						method="post">
						<div id="content" style="width: 100%; height: 533px;">
							<center>
								<button type="button" class="btn btn-success" id="passBtn"
									onclick="deleteButton('/mis/admin/passFromBranch')"
									name="passBtn">设为管理</button>
								<button type="button" class="btn btn-warning" id="unpassBtn"
									onclick="deleteButton('/mis/admin/unpassFromBranch')"
									name="unpassBtn">取消管理</button>
								<button type="button" class="btn btn-danger" id="deletesBtn"
									name="deleteBtn"
									onclick="deleteButton('/mis/admin/deleteFromBranch')">移出支部</button>
							</center>
							<table class="table table-hover table-bordered" id="Table"
								data-toggle="table" data-toggle="table" data-pagination="true"
								data-side-pagination="client">
								<thead>
									<tr>
										<th><input id="checkAll" type="checkbox" name="checkAll" />全选</th>
										<th>学号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>所属级别</th>
										<th>其它身份</th>
										<th>所在支部</th>
										<th>手机号码</th>
										<th>电子邮箱</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="member_list">
										<tr style="height: auto;">
											<td><input type="checkbox" class="checkItem" /></td>
											<td>${member_list.student_num }</td>
											<td>${member_list.student_name}</td>
											<td>${member_list.student_gender}</td>
											<td>${member_list.student_status}</td>
											<td>${member_list.student_permission}</td>
											<td>${member_list.branch_name}</td>
											<td>${member_list.student_tel}</td>
											<td>${member_list.student_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<input id="student_num" type="text" class="form-control"
									name="student_num" readonly>
							</div>
						</div>
					</form>
					<div class="cxbottom">
						<center>
							<h1>&ensp;</h1>
							<h1>&ensp;</h1>
						</center>
					</div>
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

	<script>
		$("#checkAll").click(function() {
			$(".checkItem").prop("checked", $(this).prop("checked"));
		});

		$(document)
				.on(
						"click",
						".checkItem",
						function() {
							var flag = $(".checkItem:checked").length == $(".checkItem").length;
							$("#checkAll").prop("checked", flag);
						});

		function deleteButton(href) {
			var record_ids = "";
			$.each($(".checkItem:checked"), function() {
				record_ids += $(this).parents("tr").find("td:eq(1)").text()
						+ ",";
			});
			record_ids = record_ids.substring(0, record_ids.length - 1);
			$("#student_num").val(record_ids);
			var form = document.thisForm;
			form.action = href;//传想要跳转的路径
			form.submit();
		}
	</script>

</body>
</html>