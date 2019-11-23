<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link rel="icon" href="images/favicon.png">
<title>CQU党建</title>

<meta
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"
	name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />

<link
	href="<%=request.getContextPath()%>/font-style/signIn/css/style.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/font-style/tanchuang/css/animate.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/font-style/tanchuang/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/font-style/tanchuang/syalert/syalert.min.css" />
<script
	src="<%=request.getContextPath()%>/font-style/tanchuang/syalert/syalert.min.js"></script>


<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

*:focus {
	outline: none;
}

.tsm {
	background: #333;
	font-size: 13px;
	color: #fff;
	margin: 20px;
	margin-top: 0px;
	padding: 12px;
	line-height: 25px;
}

.tsm .p2 {
	margin-top: 12px;
}

.btns {
	padding: 20px;
}

.btns div {
	display: block;
	text-align: center;
	cursor: pointer;
	padding: 10px;
	border-radius: 5px;
	background: #0CC;
	color: #fff;
	margin-bottom: 12px;
	width: 100%;
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
		if (msg == "3") {
			alert('修改成功');
		}
		if (msg == "4") {
			alert('修改失败');
		}
	</script>

	<section class="aui-flexView"> <header
		class="aui-navBar aui-navBar-fixed"> <a
		href="/mis/stu/info_page" class="aui-navBar-item"> <i
		class="icon icon-return"></i>
	</a>
	<div class="aui-center">
		<span class="aui-center-title"></span>
	</div>
	</header> <section class="aui-scrollView">
	<div class="aui-flex aui-flex-bottom">
		<div class="aui-flex-box">
			<h1>入党材料管理</h1>
		</div>
		<div class="aui-right-text">
			<p>${student_status}</p>
		</div>
	</div>


	<p></p>
	<div class="aui-flex b-line">
		<div class="aui-flex-box"></div>
	</div>
	<div class="aui-flex b-line" style="text-align: center;">
		<div class="aui-flex-box">
			<table id="tables" style="border: 0px solid; margin: auto">
				<thead>
					<tr>
						<th>材料名</th>
						<th>提交日期</th>
						<th>操作</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${material_list}" var="material_list" varStatus="st">
						<tr style="height: auto;">
							<td>${material_list.material_type_name}</td>
							<td>${material_list.material_date}</td>
							<td>
								<form action="/mis/download" id="thisForm${st.index }">
									<input type="hidden" name="filename"
										value="${material_list.material_type_name}"> <input
										type="hidden" name="url" value="${material_list.material_url}">
									<c:choose>
										<c:when test="${not empty material_list.material_url}">
											<button type="button" id="downloadButton"
														name="downloadButton" onclick="download(${st.index});">下载</button>
										</c:when>
									</c:choose>
								</form>
							</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
			<p></p>
			<p></p>
		</div>
	</div>

	</section> <footer class="aui-footer-button aui-footer-flex aui-footer-fixed">

	<div class="aui-footer-group aui-footer-flex1">
		<div class="aui-footer-flex">
			<div class="aui-btn aui-btn-gray" onClick="syalert.syopen('alert4')">
				<h2>提交材料</h2>
			</div>
		</div>
	</div>
	</footer> </section>

	<!-- 自定义弹窗 -->
	<form action="/mis/stu/upload_material" method="post"
		onsubmit="return checkFile()" enctype="multipart/form-data">
		<div class="sy-alert sy-alert-model animated" sy-enter="zoomIn"
			sy-leave="zoomOut" sy-type="confirm" sy-mask="true" id="alert4">
			<div class="sy-title">提交材料</div>
			<div class="sy-content">
				<div class="form">
					<p class="input-item">
						<label class="heading">请选择材料类型</label> <select
							id="material_type_input" name="material_type_input">
							<c:forEach var="material_all" items="${material_all}">
								<option>${material_all.material_type_name }</option>
							</c:forEach>
						</select>
					<p class="input-item">
						<label class="heading">请上传.pdf文件</label> <input type="file"
							class="form-control" accept=".pdf" id="file" name="file">
				</div>
			</div>
			<div class="sy-btn">
				<a href="/mis/stu/apply_page"><button type="button">取消</button></a>
				<button type="submit">确定</button>
			</div>
		</div>
	</form>
	
	<script>
		function ok(id) {
			syalert.syhide(id);
		}
	</script>
	<script type="text/javascript">
		function checkFile() {
			var fileName = document.getElementById("
									file").value;
			var seat=fileName.lastIndexOf( ".");
			var
									extension=fileName.substring(seat).toLowerCase(); if
									(extension !=".pdf" ) {
				alert("仅可上传.pdf文件");
				return
									false;
			}
			returntrue;
		}
</script>
<script type="text/javascript">
		function download(st) {
			document.getElementById("thisForm"+st).submit();

		}
	</script>
	</body>
	
</html>
