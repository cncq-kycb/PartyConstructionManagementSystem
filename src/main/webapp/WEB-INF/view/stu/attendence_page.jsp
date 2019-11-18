<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>党员组织生活（学生端）</title>
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
	<div class="page">
		<header class="header"> <nav class="navbar">
		<div class="container-fluid">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header">
					<a href="/mis/stu/mainPage" class="navbar-brand d-none d-sm-inline-block">
						<div class="brand-text d-none d-lg-inline-block">党员组织生活（学生端）</div>
						<div class="brand-text d-none d-sm-inline-block d-lg-none">
							<strong>党员组织生活（学生端）</strong>
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
					<h1 class="h4">${student_name}</h1>
				</div>
			</div>
			<ul class="list-unstyled">
				<li><a href="#studyCenter" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-list"></i>学习中心
				</a>
					<ul id="studyCenter" class="collapse list-unstyled ">
						<li><a href="/mis/stu/NCCPC_page">十九大讲话</a></li>
						<li><a href="/mis/stu/material_page">历史学习资料</a></li>
						<li><a href="/mis/stu/member_read_page">党员必读</a></li>
						<li><a href="/mis/stu/test_page">每日竞答</a></li>
					</ul></li>
				<li><a href="#lifeCenter" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-interface-windows"></i>组织生活
				</a>
					<ul id="lifeCenter" class="collapse list-unstyled ">
						<li class="active"><a href="/mis/stu/attendence_page">活动签到/请假</a></li>
						<li><a href="/mis/stu/life_record_page">组织生活记录</a></li>
					</ul></li>
				<li><a href="#selfCenter" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-user"></i>个人中心
				</a>
					<ul id="selfCenter" class="collapse list-unstyled ">
						<li><a href="/mis/stu/info_page">个人信息</a></li>
						<li><a href="/mis/stu/apply_page">申请党员</a></li>
						<li><a href="/mis/stu/activity_record_page">活动记录</a></li>
					</ul></li>
			</ul>
			</nav>
			<div class="content-inner">
				<div>
					<div style="width: 100%; heigth: 100%">
						<div class="card">
							<table class="table table-hover table-bordered"
								data-toggle="table" data-toggle="table" data-pagination="true"
								data-side-pagination="client" id="attendanceTable">
								<thead>
									<tr>
										<th>活动编号</th>
										<th>活动名称</th>
										<th>所属支部</th>
										<th>活动内容</th>
										<th>签到</th>
									</tr>
								</thead>
								<c:forEach var="records" items="${pageInfo.list}">
									<tr>
										<td>${records.activity_id }</td>
										<td>${records.activity_name }</td>
										<td>${records.branch_name }</td>
										<td>${records.activity_item }</td>
										<td>
											<button id="up" onclick="uploadModal(this)"
												class="btn btn-success btn-sm" data-toggle="modal">上传图片签到</button>
											<button onclick="absentModal(this)"
												class="btn btn-info btn-sm" data-toggle="modal">请假</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-sm-4 offset-sm-5">
							<ul class="pagination">
								<c:if test="${pageInfo.hasPreviousPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/stu/attendence_page?pn=${pageInfo.pageNum -1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
									<c:if test="${pageNum == pageInfo.pageNum }">
										<li class="active page-item"><a class="page-link">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum != pageInfo.pageNum }">
										<li class="page-item"><a class="page-link"
											href="/mis/stu/attendence_page?pn=${pageNum }">${pageNum }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/stu/attendence_page?pn=${pageInfo.pageNum +1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">上传照片签到</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="uploadForm" id="uploadForm"
					onsubmit="return checkFile()" method="post" class="form-validate"
					enctype="multipart/form-data" action="/mis/stu/upload_file">
					<br>
					<div class="modal-body">
						&ensp;&ensp;学号：<input type="text" readonly style="border: none"
							value="${student.student_num}">
					</div>
					<div class="modal-body">
						&ensp;&ensp;活动编号：<input id="activity_id_submit" type="text"
							name="activity_id_submit" readonly style="border: none">
					</div>
					<div class="modal-body">
						<label class="heading">&ensp;&ensp;选择上传签到图片(直接拍照方可提交.jpg文件)</label> <input
							type="file" class="form-control" accept=".jpg" id="file"
							name="file">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="absentModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">确认请假</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="absent" id="absent" method="post" class="form-validate"
					enctype="multipart/form-data" action="/mis/stu/absent_attendance">
					<br>
					<div class="modal-body">
						&ensp;&ensp;学号：<input type="text" readonly style="border: none"
							value="${student.student_num}">
					</div>
					<div class="modal-body">
						&ensp;&ensp;活动编号：<input id="activity_id_absent" type="text"
							name="activity_id_absent" readonly style="border: none">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交请假申请</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function uploadModal(obj) {
			$("#uploadModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var activity_id_submit = $td.eq(0).text();
			$("#activity_id_submit").val(activity_id_submit);
		}
	</script>
	<script type="text/javascript">
		function absentModal(obj) {
			$("#absentModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var activity_id_absent = $td.eq(0).text();
			$("#activity_id_absent").val(activity_id_absent);
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