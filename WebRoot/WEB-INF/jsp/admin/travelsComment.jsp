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
<title>游记评论</title>

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
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
			<h1 class="page-header">【游记评论管理】</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>评价列表</caption>
					<thead>
						<tr>
							<th style="width:50px;">编号</th>
							<th style="width:100px;">用户编号</th>
							<th>用户名</th>
							<th>游记标题</th>
							<th style="width:70px;">图片</th>
							<th style="width:50px;">状态</th>
							<th style="width:150px;">评价内容</th>
							<th style="width:100px;">评价时间</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.id}</td>
								<td>${item.usernum}</td>
								<td>${item.username}</td>
								<td>${item.title}</td>
								
								<td>
								    <div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic1}" />
									</div>
								</td>
								
								<td><c:if test="${item.stage eq 0}">
										<font color="red">待审</font>
									</c:if>
									<c:if test="${item.stage eq 1}">
									    <font color="blue">通过</font>
									</c:if>
							    </td>
								<td  style="width:300px;">${item.content}</td>
								<td><fmt:formatDate value="${item.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								 
								<td style="width: 188px;">
					            <a
									href="${pageContext.request.contextPath}/backComment/rejectTravelsComment?id=${item.id}"><button
											type="button" class="btn btn-warning">撤回</button></a> <a
									href="${pageContext.request.contextPath}/backComment/passTravelsComment?id=${item.id}"><button
											type="button" class="btn  btn-default">通过</button></a>
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
							href="${pageContext.request.contextPath}/backComment/getTravelsComment?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backComment/getTravelsComment?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backComment/getTravelsComment?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/backComment/getTravelsComment?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
			</form>
		</div>
	</section>
</body>
</html>