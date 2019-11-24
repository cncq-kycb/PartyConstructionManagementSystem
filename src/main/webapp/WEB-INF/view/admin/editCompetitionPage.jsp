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
			alert('题目添加成功');
		}
		if (msg == "2") {
			alert('题目添加失败');
		}
		if (msg == "3") {
			alert('移除题目成功');
		}
		if (msg == "4") {
			alert('移除题目失败');
		}
		if (msg == "5") {
			alert('编辑题目成功');
		}
		if (msg == "6") {
			alert('编辑题目失败');
		}
		if (msg == "7") {
			alert('生成试卷成功');
		}
		if (msg == "8") {
			alert('生成试卷失败');
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
						<li><a href="/mis/admin/updateStatusPage">成员政治面貌管理</a></li>
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
				<li class="active"><a href="editCompetitionPage"> <i
						class="icon-padnote"></i>竞答编辑
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
					</blockquote>
					<div class="cxbottom">
						<center>
							<button type="button" class="btn btn-success" id="passBtn"
								onclick="insertQuestionModal(this)" name="passBtn">添加题目</button>
							<button type="submit" class="btn btn-danger" id="deleteBtn"
								onclick="deleteQuestionModal(this)" name="deleteBtn">移除选中题目</button>

							<button type="button" class="btn btn-primary" id="createBtn"
								name="createBtn" onclick="createModal(this)">选中题目组卷</button>
							<h1>&ensp;</h1>
						</center>
					</div>
					<div id="content" style="width: 100%; height: 533px;">
						<table class="table table-hover table-bordered" id="Table"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client">
							<thead>
								<tr>
									<th><input id="checkAll" type="checkbox" name="checkAll" /></th>
									<th>题目编号</th>
									<th>题目</th>
									<th>选项A</th>
									<th>选项B</th>
									<th>选项C</th>
									<th>选项D</th>
									<th>正确选项</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="question_list">
									<tr style="height: auto;">
										<td><input type="checkbox" class="checkItem" /></td>
										<td>${question_list.question_id}</td>
										<td>${question_list.question_problem}</td>
										<td>${question_list.question_option_a}</td>
										<td>${question_list.question_option_b}</td>
										<td>${question_list.question_option_c}</td>
										<td>${question_list.question_option_d}</td>
										<td>${question_list.question_answer}</td>
										<td>
											<button class="btn btn-info btn-sm"
												onclick="updateQuestionModal(this)" data-toggle="modal">编辑题目</button>
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
										href="/mis/admin/editCompetionPage?pn=${pageInfo.pageNum -1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
									<c:if test="${pageNum == pageInfo.pageNum }">
										<li class="active page-item"><a class="page-link">${pageNum }</a></li>
									</c:if>
									<c:if test="${pageNum != pageInfo.pageNum }">
										<li class="page-item"><a class="page-link"
											href="/mis/admin/editCompetionPage?pn=${pageNum }">${pageNum }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li class="page-item"><a class="page-link"
										href="/mis/admin/editCompetionPage?pn=${pageInfo.pageNum +1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</div>
					</center>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="updateQuestionModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">编辑题目</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="updateQuestionForm" id="updateQuestionForm"
					action="/mis/admin/updateQuestion" method="post" class="form-validate">
					<div class="modal-body">
						题目： <input id="question_problem_check" type="text"
							name="question_problem_check">
					</div>
					<div class="modal-body">
						选项A： <input id=question_option_A_check type="text"
							name="question_option_A_check">
					</div>
					<div class="modal-body">
						选项B： <input id="question_option_B_check" type="text"
							name="question_option_B_check">
					</div>
					<div class="modal-body">
						选项C： <input id="question_option_C_check" type="text"
							name="question_option_C_check">
					</div>
					<div class="modal-body">
						选项D： <input id="question_option_D_check" type="text"
							name="question_option_D_check">
					</div>
					<div class="modal-body">
						正确选项： <select name="question_answer_check"
							id="question_answer_check">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
						</select>
					</div>
					<div class="modal-body">
						<input id="question_id_check" type="text" style="display: none"
							name="question_id_check">
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="insertQuestionModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">添加题目</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="insertQuestionForm" id="insertQuestionForm"
					action="/mis/admin/insertQuestion" method="post" class="form-validate">
					<div class="modal-body">
						题目： <input id="qustion_problem_new" type="text"
							name="qustion_problem_new">
					</div>
					<div class="modal-body">
						选项A： <input id="option_A_new" type="text" name="option_A_new">
					</div>
					<div class="modal-body">
						选项B： <input id="option_B_new" type="text" name="option_B_new">
					</div>
					<div class="modal-body">
						选项C： <input id="option_C_new" type="text" name="option_C_new">
					</div>
					<div class="modal-body">
						选项D： <input id="option_D_new" type="text" name="option_D_new">
					</div>
					<div class="modal-body">
						正确选项： <select name="qustion_answer_new" id="qustion_answer_new">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
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
	<div class="modal fade" id="deleteQuestionModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">移除题目</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="deleteQuestionForm" id="deleteQuestionForm"
					action="/mis/admin/deleteQuestion" method="post" class="form-validate">
					<div class="modal-body">
						移除题目编号： <input id="question_id_delete" type="text"
							name="question_id_delete" readonly>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger">确定移除</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="aotoCreateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">随机生成试卷</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="aotoCreateForm" id="aotoCreateForm"
					action="/mis/admin/aotoCreateTest" method="post" class="form-validate">
					<div class="modal-body">
						题目个数： <input id="qustion_list_length" type="text"
							name="qustion_list_length">
					</div>
					<div class="modal-body">
						试卷名称： <input id="test_name" type="text" name="test_name">
					</div>
					<div class="modal-body">
						开始时间： <input id="test_date_start" type="text"
							name="test_date_start">
					</div>
					<div class="modal-body">
						结束时间： <input id="test_date_end" type="text" name="test_date_end">
					</div>
					<div class="modal-footer"></div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">手动生成试卷</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="createForm" id="createForm" action="/mis/admin/createTest"
					method="post" class="form-validate">
					<div class="modal-body">
						试卷名称： <input id="test_name" type="text" name="test_name">
					</div>
					<div class="modal-body">
						开始时间： <input id="test_date_start" type="date"
							name="test_date_start">
					</div>
					<div class="modal-body">
						结束时间： <input id="test_date_end" type="date" name="test_date_end">
					</div>
					<div class="modal-body">
						选中题目编号： <input id="question_id_select" type="text"
							name="question_id_select" readonly>
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
		function updateQuestionModal(obj) {
			$("#updateQuestionModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var question_id_check = $td.eq(1).text();
			var question_problem_check = $td.eq(2).text();
			var question_option_A_check = $td.eq(3).text();
			var question_option_B_check = $td.eq(4).text();
			var question_option_C_check = $td.eq(5).text();
			var question_option_D_check = $td.eq(6).text();
			var question_answer_check = $td.eq(7).text();
			$("#question_id_check").val(question_id_check);
			$("#question_problem_check").val(question_problem_check);
			$("#question_option_A_check").val(question_option_A_check);
			$("#question_option_B_check").val(question_option_B_check);
			$("#question_option_C_check").val(question_option_C_check);
			$("#question_option_D_check").val(question_option_D_check);
			$("#question_answer_check").val(question_answer_check);
		}
	</script>

	<script type="text/javascript">
		function deleteQuestionModal(obj) {
			$("#deleteQuestionModal").modal('show');
			var record_ids = "";
			$.each($(".checkItem:checked"), function() {
				record_ids += $(this).parents("tr").find("td:eq(1)").text()
						+ ",";
			});
			record_ids = record_ids.substring(0, record_ids.length - 1);
			$("#question_id_delete").val(record_ids);
		}
	</script>

	<script>
		function insertQuestionModal(obj) {
			$("#insertQuestionModal").modal('show');
		};
		function aotoCreateModal(obj) {
			$("#aotoCreateModal").modal('show');
		};
		function createModal(obj) {
			$("#createModal").modal('show');
			var record_ids = "";
			$.each($(".checkItem:checked"), function() {
				record_ids += $(this).parents("tr").find("td:eq(1)").text()
						+ ",";
			});
			record_ids = record_ids.substring(0, record_ids.length - 1);
			$("#question_id_select").val(record_ids);
		};
	</script>
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