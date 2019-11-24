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
	var isLogin = "<%=session.getAttribute("isLogin")%>";
	if(isLogin!='1'){
		alert("您好，请先登录！");
		window.location.href='<%=request.getContextPath()%>/';
	};

		var msg = "${message}";
		if (msg == "1") {
			alert('该同志已升至下一阶段！');
		}
		if (msg == "2") {
			alert('操作失败！');
		}
		if (msg == "3") {
			alert('该生已是正式党员');
		}
	</script>
		<div class="page">
		<header class="header"> <nav class="navbar">
		<div class="container-fluid">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header">
					<a href="/mis/stuAdmin/main_page_3"
						class="navbar-brand d-none d-sm-inline-block">
						<div class="brand-text d-none d-lg-inline-block">党员管理系统(学生管理员端)</div>
						<div class="brand-text d-none d-sm-inline-block d-lg-none">
							<strong>党员管理系统(学生管理员端)</strong>
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
					
					<p>&ensp;</p><h1 class="h4">${my_branch_name}&ensp;${my_name}</h1>
				</div>
			</div>
			<span class="heading">用户管理</span>
			<ul class="list-unstyled">
				<li><a href="#memberManager" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-user"></i>本支部成员管理
				</a>
					<ul id="memberManager" class="collapse list-unstyled ">
						<li><a href="/mis/stuAdmin/manageMemberPage">成员信息管理</a></li>
						<li><a href="/mis/stuAdmin/updateStatusPage">成员政治面貌管理</a></li>
					</ul></li>
			</ul>
			<span class="heading">组织生活管理</span>
			<ul class="list-unstyled">
				<li><a href="/mis/stuAdmin/addActivityPage"> <i
						class="icon-interface-windows"></i>活动的创建与发布
				</a></li>
				<li><a href="/mis/stuAdmin/manageSignInPage"> <i
						class="icon-grid"></i>组织生活签到管理
				</a></li>
			</ul>
			<span class="heading">内容管理</span>
			<ul class="list-unstyled">
				<li><a href="#editStudy" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-presentation"></i>学习中心内容编辑
				</a>
					<ul id="editStudy" class="collapse list-unstyled ">
						<li><a href="/mis/stuAdmin/insertStudyPage">发布学习内容</a></li>
						<li><a href="/mis/stuAdmin/manageStudyPage">管理学习内容</a></li>
					</ul></li>
				<li><a href="/mis/stuAdmin/editCompetitionPage"> <i
						class="icon-padnote"></i>知识竞答编辑
				</a></li>
				<li><a href="#competitionResult" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-line-chart"></i>竞答结果统计
				</a>
					<ul id="competitionResult" class="collapse list-unstyled ">
						<li><a href="/mis/stuAdmin/resultByTestPage">按竞答查询</a></li>
						<li><a href="/mis/stuAdmin/resultByStudentPage">按学生查询</a></li>
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
								
="/mis/stuAdmin/distributionPageFinder" method="post">

								<div class="tableWrap">
									<table width="100%" class="table table-hover table-bordered"
										id="Table" data-toggle="table" data-toggle="table"
										data-pagination="true" data-side-pagination="client">
										<tr>
											<th width="12%">学号：</th>
											<td width="21%">
												<div class="" id="data_5">
													<div class="input-daterange input-group" id="datepicker">
														<input type="text" value="${student_num_input}"
															class="form-control"
															style="border-radius: 3px; height: 30px"
															id="student_num_input" name="student_num_input"></input>
													</div>
												</div>
											</td>
											<th width="12%">政治面貌：</th>
											<td width="21%"><select name="student_status_input"
												id="student_status_input">
													<c:forEach var="ssm" items="${ssm}">
														<option>${ssm.means }</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>姓名：</th>
											<td><input type="text" placeholder="模糊查询，姓名中的一部分即可"
												value="${student_name_input}" class="form-control"
												style="border-radius: 3px; height: 30px"
												id="student_name_input" name="student_name_input"></td>
											<th>所在支部：</th>
											<td><input type="text" placeholder="模糊查询，所在支部名称中的一部分即可"
												value="${branch_name_input}" class="form-control"
												style="border-radius: 3px; height: 30px"
												id="branch_name_input" name="branch_name_input"></td>
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
									<th>学号</th>
									<th>姓名</th>
									<th>政治面貌</th>
									<th>所在支部</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="member_list" items="${pageInfo.list}">
									<tr style="height: auto;">
										<td>${member_list.student_num }</td>
										<td>${member_list.student_name}</td>
										<td>${member_list.student_status}</td>
										<td>${member_list.branch_name}</td>

										<td><button id="checkButton" type="button"
												onclick="checkModal(this)" class="btn btn-info btn-sm"
												data-toggle="modal">查看材料</button>
											<button id="activityButton" type="button"
												onclick="activityModal(this)" class="btn btn-warning btn-sm"
												data-toggle="modal">查看活动记录</button>
											<button id="resultButton" type="button"
												onclick="resultModal(this)" class="btn btn-danger btn-sm"
												data-toggle="modal">查看竞答记录</button>
											<button id="updateBranchButton" type="button"
												onclick="updateLevelModal(this)"
												class="btn btn-success btn-sm" data-toggle="modal">同意进入下一阶段</button>
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
										href="/mis/stu/updateStatusPage?pn=${pageInfo.pageNum -1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
									<c:if test="${pageNum == pageInfo.pageNum }">
										<li class="active page-item"><a class="page-link">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum != pageInfo.pageNum }">
										<li class="page-item"><a class="page-link"
											href="/mis/stu/updateStatusPage?pn=${pageNum }">${pageNum }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/stu/updateStatusPage?pn=${pageInfo.pageNum +1}"
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

	<div class="modal fade" id="updateLevelModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">成员政治面貌管理</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="updateLevelForm" id="updateLevelForm"
					action="/mis/stuAdmin/updateLevel" method="post" class="form-validate">
					<div class="modal-body">
						学&ensp;&ensp;&ensp;&ensp;号：<input id="student_num_check"
							style="border: none;" type="text" name="student_num_check"
							readonly>
					</div>
					<div class="modal-body">
						姓&ensp;&ensp;&ensp;&ensp;名：<input id="student_name_check"
							style="border: none;" type="text" name="student_name_check"
							readonly>
					</div>
					<div class="modal-body">
						所属级别： <input id="student_status_check" style="border: none;"
							type="text" name="student_status_check" readonly>
					</div>
					<div class="modal-body">
						所在支部： <input id="branch_name_check" style="border: none;"
							type="text" name="branch_name_check" readonly>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">同意升至下一阶段</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">确定查看该生材料吗？</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="checkForm" id="checkForm" target="_blank"
					action="/mis/stuAdmin/checkMaterialPage" method="post" class="form-validate">
					<div class="modal-body">
						学&ensp;&ensp;&ensp;&ensp;号：<input id="student_num_ensure"
							style="border: none;" type="text" name="student_num_ensure"
							readonly>
					</div>
					<div class="modal-body">
						姓&ensp;&ensp;&ensp;&ensp;名：<input id="student_name_ensure"
							style="border: none;" type="text" name="student_name_ensure"
							readonly>
					</div>
					<div class="modal-body">
						政治面貌： <input id="student_status_ensure" style="border: none;"
							type="text" name="student_status_ensure" readonly>
					</div>
					<div class="modal-body">
						所在支部： <input id="branch_name_ensure" style="border: none;"
							type="text" name="branch_name_ensure" readonly>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="activityModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">确定查看该生活动记录吗？</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="activityForm" id="activityForm" target="_blank"
					action="/mis/stuAdmin/stuActivityPage" method="post" class="form-validate">
					<div class="modal-body">
						学&ensp;&ensp;&ensp;&ensp;号：<input
							id="student_num_activity"
							style=" border:none;" type="text" name="student_num_activity" readonly>
					</div>
					<div class="modal-body">
						姓&ensp;&ensp;&ensp;&ensp;名：<input id="student_name_activity"
							style="border: none;" type="text" name="student_name_activity"
							readonly>
					</div>
					<div class="modal-body">
						政治面貌： <input id="student_status_activity" style="border: none;"
							type="text" name="student_status_activity" readonly>
					</div>
					<div class="modal-body">
						所在支部： <input id="branch_name_activity" style="border: none;"
							type="text" name="branch_name_activity" readonly>
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="resultModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">确定查看该生竞答记录吗？</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="resultForm" id="resultForm" target="_blank"
					action="/mis/stuAdmin/resultPage" method="post" class="form-validate">
					<div class="modal-body">
						学&ensp;&ensp;&ensp;&ensp;号：<input
							id="student_num_result"
							style="border:none;" type="text" name="student_num_result" readonly>
					</div>
					<div class="modal-body">
						姓&ensp;&ensp;&ensp;&ensp;名：<input id="student_name_result"
							style="border: none;" type="text" name="student_name_result"
							readonly>
					</div>
					<div class="modal-body">
						政治面貌： <input id="student_status_result" style="border: none;"
							type="text" name="student_status_result" readonly>
					</div>
					<div class="modal-body">
						所在支部： <input id="branch_name_result" style="border: none;"
							type="text" name="branch_name_result" readonly>
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
		function updateLevelModal(obj) {
			$("#updateLevelModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var stuID_check = $td.eq(0).text();
			var name_check = $td.eq(1).text();
			var status_check = $td.eq(2).text();
			var branch_check = $td.eq(3).text();
			$("#student_num_check").val(stuID_check);
			$("#student_name_check").val(name_check);
			$("#branch_name_check").val(branch_check);
			$("#student_status_check").val(status_check);
		}
	</script>
	<script>
		function checkModal(obj) {
			$("#checkModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var stuID_check = $td.eq(0).text();
			var name_check = $td.eq(1).text();
			var status_check = $td.eq(2).text();
			var branch_check = $td.eq(3).text();
			$("#student_num_ensure").val(stuID_check);
			$("#student_name_ensure").val(name_check);
			$("#branch_name_ensure").val(branch_check);
			$("#student_status_ensure").val(status_check);
		}
	</script>
	<script>
		function activityModal(obj) {
			$("#activityModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var stuID_check = $td.eq(0).text();
			var name_check = $td.eq(1).text();
			var status_check = $td.eq(2).text();
			var branch_check = $td.eq(3).text();
			$("#student_num_activity").val(stuID_check);
			$("#student_name_activity").val(name_check);
			$("#branch_name_activity").val(branch_check);
			$("#student_status_activity").val(status_check);
		}
	</script>
	
	<script>
		function resultModal(obj) {
			$("#resultModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var stuID_check = $td.eq(0).text();
			var name_check = $td.eq(1).text();
			var status_check = $td.eq(2).text();
			var branch_check = $td.eq(3).text();
			$("#student_num_result").val(stuID_check);
			$("#student_name_result").val(name_check);
			$("#branch_name_result").val(branch_check);
			$("#student_status_result").val(status_check);
		}
	</script>

</body>
</html>