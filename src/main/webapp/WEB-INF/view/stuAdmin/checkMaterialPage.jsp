<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table tr th, td {
	text-align: center;
}

table tr th {
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
	var msg = ${message};
	if(msg == "1"){
		alert("审核通过");
	}
	if(msg == "2"){
		alert("审核提交失败");
	}
	</script>

	<div>
		<header class="header"></header>
		<div class="content-inner">

			<div>
				<blockquote class="layui-elem-quote">
					<div class="cxbottom">
						<center>
							<h1>&ensp;</h1>
						</center>
					</div>

					<div class="panel-body" style="padding-bottom: 0px;">

						<center>
							<h2>${branch_name}-${student_num}-${student_name}-${student_status}材料表</h2>

							<h3>&ensp;</h3>
							<div class="cxbottom">
							

							</div>
						</center>

					</div>
				</blockquote>
				<div id="content"
					style="width: 100%; height: 533px; margin-left: 120px;">

					<table class="table table-hover table-bordered" id="tables"
						data-toggle="table" data-toggle="table" data-pagination="true"
						data-side-pagination="client" style="border: 1px solid black">
						<caption>${branch_name}-${student_num}-${student_name}-${student_status}材料表</caption>
						<thead>
							<tr>
								<th>材料名</th>
								<th>提交日期</th>
								<th>材料类型</th>
								<th>操作</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${material_list}" var="material_list" varStatus="st">
								<tr style="height: auto;">
									<td>${material_list.material_type_name}</td>
									<td>${material_list.material_date}</td>
									<td><c:choose>
											<c:when test="${material_list.material_type_from=='1'}">
							学生线上提交
							</c:when>
										</c:choose> <c:choose>
											<c:when test="${material_list.material_type_from=='2'}">
							老师审核材料
							</c:when>
										</c:choose></td>
									<td>
										<form action="/mis/download" id="thisForm${st.index }">
											<input type="hidden" type="text" name="filename" value="${material_list.material_type_name}"> 
												<input type="hidden" type="text" name="url" value="${material_list.material_url}"> 
												<input type="hidden" type="text" name="student_num" value="${student_num}">
												<input type="hidden" type="text" name="material_type_id" value="${material_list.material_type_id}">
											<c:choose>
												<c:when test="${not empty material_list.material_url && material_list.material_type_from=='1'}">
													<button type="button" id="downloadButton"
														name="downloadButton" onclick="download(${st.index});">下载</button>
												</c:when>

												<c:when test="${empty material_list.material_url && material_list.material_type_from=='2'}">
													<button type="button" id="checkButton" name="checkButton"
														onclick="check(${st.index});">线下提交确认</button>
												</c:when>
												<c:when
													test="${not empty material_list.material_url && material_list.material_type_from=='2'}">
											线下提交通过
										</c:when>
											</c:choose>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
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
    var disName = "<%=session.getAttribute("student_id")%>";
    var avtivytiName = "<%=session.getAttribute("student_name")%>";
    var branchName = "<%=session.getAttribute("branch_name")%>";
    var status = "<%=session.getAttribute("student_status")%>";

		var id = "tables", worksheetName = 'sheet', workName = branch_name
				+ "-" + student_id + "-" + branch_name + "-" + status + "-"
				+ "材料表.xls";
		document.getElementById('button').onclick = function() {
			var download = tableToExcel();
			download(id, worksheetName, workName)
		};
	</script>
	<script>
		function check(st) {
			document.getElementById("thisForm"+st).action = "/mis/stuAdmin/checkOfflineMaterial";
			document.getElementById("thisForm"+st).submit();

		}

		function download(st) {
			document.getElementById("thisForm"+st).action = "/mis/download";
			document.getElementById("thisForm"+st).submit();

		}
	</script>
</body>
</html>
