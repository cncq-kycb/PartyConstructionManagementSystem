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
						class="icon-padnote"></i>竞答编辑
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

					</blockquote>
					<blockquote class="layui-elem-quote">
						<div class="cxbottom">
							<center>
								<h1>&ensp;</h1>
							</center>
						</div>

						<div class="panel-body" style="padding-bottom: 0px;">

							<center>
								<h2>${test_name_input}竞答结果统计表</h2>
								<h3>&ensp;</h3>
								<div class="cxbottom"></div>
							</center>

						</div>
					</blockquote>
					<div id="content" style="width: 100%; height: 533px;">

						<table class="table table-hover table-bordered" id="table"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client" style="border: 1px solid black">
							<caption>${test_name_input}结果统计表</caption>

							<thead>
								<tr>
									<th>竞答名称</th>
									<td>${test_name_input}</td>
									<th>试题总分</th>
									<td>${total_num}</td>
								</tr>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>答题日期</th>

									<th>实际得分</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${member_list}" var="member_list">
									<tr style="height: auto;">
										<td style="mso-number-format: '\@';">${member_list.student_num }</td>
										<td>${member_list.student_name}</td>
										<td>${member_list.answer_date}</td>
										<td>${member_list.correct_num}</td>
									</tr>
								</c:forEach>

							</tbody>
							<tr>
								<th rowspan="1" colspan="2"></th>
								<th>总答题人数</th>
								<td>${length}</td>
							</tr>
						</table>
					</div>
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
	<script type="text/javascript">
	var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
            base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
            format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) };
        return function(table, name, filename) {
            if (!table.nodeType) table = document.getElementById(table);
            console.log(table.innerHTML)
            var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }//此时的innerHTML数据可以自己自定义 比如json转化 只要值要数据符合即可

            document.getElementById("dlink").href = uri + base64(format(template, ctx));
            document.getElementById("dlink").download = filename;
            document.getElementById("dlink").click();
        }
    });
	 var disName = "<%=session.getAttribute("test_date")%>";
	    var avtivytiName = "<%=session.getAttribute("test_name")%>
		";
		var disLength = disName.length;
		var year = disName.substring(0, 4);
		var month = disName.substring(5, 7);
		var day = disName.substring(8, 10);
		var id = "table", worksheetName = 'sheet', workName = year + "年"
				+ month + "月" + day + "日“" + avtivytiName + "”-" + "结果统计表.xls";
		document.getElementById('button').onclick = function() {
			var download = tableToExcel();
			download(id, worksheetName, workName)
		};
	</script>


</body>
</html>