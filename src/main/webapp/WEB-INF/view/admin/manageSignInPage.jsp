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
		if (msg == "1") {
			alert('更改活动状态成功');
		}
		if (msg == "2") {
			alert('更改活动状态失败');
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
				<li><a href="#branchManager" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-list"></i>支部管理
				</a>
					<ul id="branchManager" class="collapse list-unstyled ">
						<li><a href="/mis/admin/addMemberPage">添加支部成员</a></li>
						<li><a href="/mis/admin/manageBranchPage">支部成员管理</a></li>
					</ul></li>
			</ul>
			<span class="heading">组织生活管理</span>
			<ul class="list-unstyled">
				<li><a href="/mis/admin/addActivityPage"> <i
						class="icon-interface-windows"></i>活动的创建与发布
				</a></li>
				<li class="active"><a href="/mis/admin/manageSignInPage"> <i
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
				<li><a href="/mis/admin/editCompetitionPage"> <i
						class="icon-padnote"></i>知识竞答编辑
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
							<form class="form-horizontal" name="inputForm "
								action="/mis/admin/manageSignInPageFinder" method="post">

								<div class="tableWrap">
									<table width="100%" class="table table-hover table-bordered"
										id="Table" data-toggle="table" data-toggle="table"
										data-pagination="true" data-side-pagination="client">
										<tr>
											<th width="12%">活动名称：</th>
											<td width="21%">
												<div class="" id="data_5">
													<div class="input-daterange input-group" id="datepicker">
														<input type="text" placeholder="模糊查询，活动名称的一部分即可"
															value="${activity_name_input}" class="form-control"
															style="border-radius: 3px; height: 30px"
															id="activity_name_input" name="activity_name_input"></input>
													</div>
												</div>
											</td>
											<th width="12%">活动状态：</th>
											<td width="21%"><select name="activity_status_input"
												id="activity_status_input">
													<c:forEach var="asm" items="${asm}">
														<option>${asm.means }</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>活动日期：</th>
											<td><input type="date" class="form-control"
												style="border-radius: 3px; height: 30px"
												id="activity_date_input" name="activity_date_input"></td>
											<th>活动地点：</th>
											<td><input type="text" placeholder="模糊查询，活动地点中的一部分即可"
												value="${activity_location_input}" class="form-control"
												style="border-radius: 3px; height: 30px"
												id="activity_location_input" name="activity_location_input"></td>
										</tr>
									</table>
									<div class="cxbottom">
										<center>
											<button type="submit">查 询</button>
										</center>
									</div>
							</Form>
						</div>
					</blockquote>
					<div id="content" style="width: 100%; height: 533px;">
						<table class="table table-hover table-bordered" id="Table"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client">
							<thead>
								<tr>
									<th>活动编号</th>
									<th>活动名称</th>
									<th>参与支部</th>
									<th>活动日期</th>
									<th>活动地点</th>
									<th>活动状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="activity_list" items="${pageInfo.list}">
									<tr style="height: auto;">
										<td>${activity_list.activity_id}</td>
										<td>${activity_list.activity_name}</td>
										<td>${activity_list.branch_name}</td>
										<td>${activity_list.activity_date}</td>
										<td>${activity_list.activity_location}</td>
										<td>${activity_list.means}</td>
										<td>
											<button class="btn btn-success btn-sm"
												onclick="activityItemModal(this)" data-toggle="modal">查看活动内容</button>
											<button class="btn btn-info btn-sm"
												onclick="signInModal(this)" data-toggle="modal">查看签到表</button>
											<button class="btn btn-warning btn-sm"
												onclick="updateStatusModal(this)" data-toggle="modal">更改活动状态</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<center>
						<div class="col-sm-4 offset-sm-5">
							<ul class="pagination">
								<c:if test="${pageInfo.hasPreviousPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/admin/manageSignInPage?pn=${pageInfo.pageNum -1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
									<c:if test="${pageNum == pageInfo.pageNum }">
										<li class="active page-item"><a class="page-link">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum != pageInfo.pageNum }">
										<li class="page-item"><a class="page-link"
											href="/mis/admin/manageSignInPage?pn=${pageNum }">${pageNum }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/admin/manageSignInPage?pn=${pageInfo.pageNum +1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</div>
					</center>
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
	<div class="modal fade" id="activityItemModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">查看活动内容</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="activityItemForm" id="activityItemForm" target="_blank"
					action="activityItemPage" method="post" class="form-validate">
						<div class="modal-body">
						活动编号：<input id="activity_id_check" style="border: none;"
							type="text" name="activity_id_check" readonly>
					</div>
					<div class="modal-body">
						活动名称：<input id="activity_name_check" style="border: none;"
							type="text" name="activity_name_check" readonly>
					</div>
					<div class="modal-body">
						活动时间： <input id="activity_date_check" style="border: none;"
							type="text" name="activity_date_check" readonly>
					</div>
					<div class="modal-body">
						活动地点： <input id="activity_location_check" style="border: none;"
							type="text" name="activity_location_check" readonly>
					</div>
					<div class="modal-body">
						活动状态： <input id="activity_status_check" style="border: none;"
							type="text" name="activity_status_check" readonly>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="signInModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">查看活动签到表</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="signInForm" id="signInForm" target="_blank"
					action="attendanceCheckPage" method="post" class="form-validate">
					<div class="modal-body">
						活动编号：<input id="activity_id_signIn" style="border: none;"
							type="text" name="activity_id_signIn" readonly>
					</div>
					<div class="modal-body">
						活动名称：<input id="activity_name_signIn" style="border: none;"
							type="text" name="activity_name_signIn" readonly>
					</div>
					<div class="modal-body">
						活动时间： <input id="activity_date_signIn" style="border: none;"
							type="text" name="activity_date_signIn" readonly>
					</div>
					<div class="modal-body">
						活动地点： <input id="activity_location_signIn" style="border: none;"
							type="text" name="activity_location_signIn" readonly>
					</div>
					<div class="modal-body">
						参与支部： <input id="branch_name_signIn" style="border: none;"
							type="text" name="branch_name_signIn" readonly>
					</div>
					<div class="modal-body">
						活动状态： <input id="activity_status_signIn" style="border: none;"
							type="text" name="activity_status_signIn" readonly>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">前往查看</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="updateStatusModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">更改活动状态</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="updateStatusForm" id="updateStatusForm" target="_blank"
					action="updateActivityStatus" method="post" class="form-validate">
					<div class="modal-body">
						活动编号：<input id="activity_id_update" style="border: none;"
							type="text" name="activity_id_update" readonly>
					</div>
					<div class="modal-body">
						活动名称：<input id="activity_name_update" style="border: none;"
							type="text" name="activity_name_update" readonly>
					</div>
					<div class="modal-body">
						活动时间： <input id="activity_date_update" style="border: none;"
							type="text" name="activity_date_update" readonly>
					</div>
					<div class="modal-body">
						活动地点： <input id="activity_location_update" style="border: none;"
							type="text" name="activity_location_update" readonly>
					</div>
					<div class="modal-body">
						活动状态： <select name="new_activity_status" id="new_activity_status">
							<c:forEach var="asm" items="${asm}">
								<option>${asm.means }</option>
							</c:forEach>
						</select>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
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
		function activityItemModal(obj) {
			$("#activityItemModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var activity_id_check = $td.eq(0).text();
			var activity_name_check = $td.eq(1).text();
			var activity_date_check = $td.eq(3).text();
			var activity_location_check = $td.eq(4).text();
			var activity_status_check = $td.eq(5).text();
			$("#activity_id_check").val(activity_id_check);
			$("#activity_name_check").val(activity_name_check);
			$("#activity_date_check").val(activity_date_check);
			$("#activity_location_check").val(activity_location_check);
			$("#activity_status_check").val(activity_status_check);

		}
	</script>
	<script>
		function signInModal(obj) {
			$("#signInModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var activity_id_check = $td.eq(0).text();
			var activity_name_check = $td.eq(1).text();
			var branch_name_signIn = $td.eq(2).text();
			var activity_date_check = $td.eq(3).text();
			var activity_location_check = $td.eq(4).text();
			var activity_status_check = $td.eq(5).text();

			$("#activity_id_signIn").val(activity_id_check);
			$("#activity_name_signIn").val(activity_name_check);
			$("#branch_name_signIn").val(branch_name_signIn);
			$("#activity_date_signIn").val(activity_date_check);
			$("#activity_location_signIn").val(activity_location_check);
			$("#activity_status_signIn").val(activity_status_check);

		}
	</script>
	<script>
		function updateStatusModal(obj) {
			$("#updateStatusModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var activity_id_check = $td.eq(0).text();
			var activity_name_check = $td.eq(1).text();
			var activity_date_check = $td.eq(3).text();
			var activity_location_check = $td.eq(4).text();
			$("#activity_id_update").val(activity_id_check);
			$("#activity_name_update").val(activity_name_check);
			$("#activity_date_update").val(activity_date_check);
			$("#activity_location_update").val(activity_location_check);

		}
	</script>
</body>
</html>