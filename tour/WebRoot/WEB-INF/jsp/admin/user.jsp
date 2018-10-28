<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息模块</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<!-- <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"> -->
<link rel="apple-touch-icon-precomposed" href="images/t_logo.jpg">
<link rel="shortcut icon" href="images/t_logo.jpg">
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/admin-scripts.js"></script>

</head>
<body class="user-select">
	<section class="container-fluid">

		<!--头部-->
		<%@ include file="/WEB-INF/jsp/admin/common/head.jsp"%>
		<!--头部-->


		<!-- 左边的菜单 -->
		<%@ include file="/WEB-INF/jsp/admin/common/menu.jsp"%>
		<!-- 左边的菜单 -->

		<!-- 右边主区域 -->
		<div
			class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
			id="main">
			<h1 class="page-header">用户信息管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>用户列表</caption>
					<thead>
						<tr>
							<th style="width:70px;">编号</th>
							<th>用户名</th>
							<th>头像</th>
							<th>密码</th>
							<th style="width:70px;">性别</th>
							<th>地址</th>
							<th>生日</th>
							<th style="width:170px;">个性签名</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.userid}</td>
								<td>${item.username}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.userimag}" />
									</div></td>
								<td>${item.password}</td>
								<td>${item.sex}</td>
								<td>${item.address}</td>
								<td><font color="red"><fmt:formatDate value="${item.birthday}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td>
								<td>${item.signature}</td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">无效</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                   有效
									    </c:if>
							    </td>

								 
								<td style="width: 188px;">
									<a href="${pageContext.request.contextPath}/backUser/downUser?userid=${item.userid}">
									<button type="button" class="btn btn-danger">限制</button></a>
									<a href="${pageContext.request.contextPath}/backUser/upUser?userid=${item.userid}">
									<button type="button" class="btn  btn-default">解除</button></a>  
								</td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>

			<footer class="message_footer">
				<nav>
					<ul class="pagination pagenav"
						style="position: absolute; right: 70px; top: 500px;">
						<li><a
							href="${pageContext.request.contextPath}/backUser/getAllUser?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backUser/getAllUser?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backUser/getAllUser?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/backUser/getAllUser?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
		</div>
	</section>
</body>
</html>