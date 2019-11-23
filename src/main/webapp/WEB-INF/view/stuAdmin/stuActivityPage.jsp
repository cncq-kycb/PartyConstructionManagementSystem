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
	</script>

	<div >
		<header class="header"></header>
		<div class="content-inner">

			<div >
				<blockquote class="layui-elem-quote">
					<div class="cxbottom">
						<center>
							<h1>&ensp;</h1>
						</center>
					</div>

					<div class="panel-body" style="padding-bottom: 0px;">

						<center>
							<h2>${branch_name}-${student_id}-${student_name}-${student_status}活动记录表</h2>

							<h3>&ensp;</h3>
							<div class="cxbottom">
								<a id="dlink" style="display: none;"></a> <input id="button"
									type="button" value="导出为Excel表格">

							</div>
						</center>

					</div>
				</blockquote>
				<div id="content" style="width: 100%; height: 533px;margin-left:120px;">
               
					<table class="table table-hover table-bordered" id="tables"
						data-toggle="table" data-toggle="table" data-pagination="true"
						data-side-pagination="client" style="border: 1px solid black">
						<caption>${branch_name}-${student_id}-${student_name}-${student_status}活动记录表</caption>
						<thead>
							<tr>
								<th>活动名称</th>
								<th>活动日期</th>
								<th>活动地点</th>
								<th>时长</th>
								<th>参与情况</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${vattendances_list}" var="vattendances_list">
								<tr style="height: auto;">
									<td>${vattendances_list.activity_name }</td>
									<td>${vattendances_list.activity_date }</td>
								    <td>${vattendances_list.activity_location }</td>
								    <td>${vattendances_list.activity_duration }</td>
									<td>${vattendances_list.attendance_status }</td>
								</tr>
                               <tr>
							<th rowspan="2" colspan="3"></th>
							<th>总活动次数</th>
							<td>${total_activity_num}</td>
						</tr>
						<tr>
							<th>总活动时长</th>
							<td>${total_activity_duration}小时</td>
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

		var id = "tables", worksheetName = 'sheet', workName = branch_name + "-"
				+ student_id + "-" + branch_name + "-" + status + "-" 
				+ "活动记录表.xls";
		document.getElementById('button').onclick = function() {
			var download = tableToExcel();
			download(id, worksheetName, workName)
		};
	</script>
</body>
</html>
