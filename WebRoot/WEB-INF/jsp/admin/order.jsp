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
<title>后台订单模块</title>

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
			<h1 class="page-header">订单管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>订单列表</caption>
					<thead>
						<tr>
							<th>订单编号</th>
							<th>用户名</th>
							<th>商品</th>
							<th>图片</th>
							<th>数量</th>
							<th>总额</th>
							<th>下单时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.ordernum}</td>
								<td>${item.username}</td>
								<td>${item.tname}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.tpic}" />
									</div></td>
								<td><font color="red">${item.tnum}</font></td>
								<td>${item.total}</td>
								<td><font color="blue"><fmt:formatDate
											value="${item.time}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">未付款</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                    已付款
									    </c:if>
							    </td>

								<td style="display: none">/pic/${item.tpic}</td>
								<td style="display: none">/pic/${item.pic2}</td>
								<td style="display: none">/pic/${item.pic3}</td>
								<td style="display: none">${item.tprice}</td>
								<td style="width: 188px;">
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#myModal" name="view">查看详情</button> 
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
							href="${pageContext.request.contextPath}/backOrder/getAllOrder?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backOrder/getAllOrder?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backOrder/getAllOrder?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- <li class="active"><a>1</a></li> -->
						<li><a
							href="${pageContext.request.contextPath}/backOrder/getAllOrder?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
			</form>
		</div>
	</section>
	
<!-- 模态框 （Modal）修改特产 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">订单详情</h4>
				</div>
				<div class="modal-body" style="top:15px;">
					<form name="editForm" class="form-horizontal" role="form"
						action="${pageContext.request.contextPath}/backSpecialty/editSpecialty.action"
						method="post" enctype="multipart/form-data">
						<!-- 模态框左侧部分 -->
						<input type="hidden" name="id" id="id" />
						<div style="float: left; width: 50%;">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">订单编号</label>
								<div class="col-sm-7">
									<input type="text" value="" class="form-control" id="ordernum"
										name="ordernum"  readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">订购用户</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="username"
										name="username"  readonly>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label">商品名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="tname"
										name="tname"  readonly>
								</div>
							</div>
							
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">下单时间</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="time" name="time"  readonly >
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">商品单价</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="tprice" name="tprice"  readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">订购数量</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="tnum" name="tnum"  readonly> 
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">总价</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="total" name="total"  readonly>
								</div>
							</div>
						</div>

						<!-- 模态框右侧部分 -->
						<div style="float: left; width: 50%;">

							<div class="form-group">
								<label for="pic1" class="col-sm-2 control-label">图片一</label>
								 
								<div style="float: left; width: 120px; heigth: 120px;">
									<img id="tpic" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
								</div>
							</div>
							<div class="form-group">
								<label for="pic2" class="col-sm-2 control-label">图片二</label>
								 
								<div style="float: left; width: 120px; heigth: 120px;">
									<img id="pic2" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
								</div>
							</div>

							<div class="form-group">
								<label for="pic3" class="col-sm-2 control-label">图片三</label>
								 
								<div style="float: left; width: 120px; heigth: 120px;">
									<img id="pic3" style="width: 100%; heigth: 100%;" class="pic"
										src="" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer" style="text-align: center" style="height:70px;">
				
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button> -->
					 
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	 
	<script>
		//取页面的值传给模态框
		$(function() {
			$("Button[name='view']").each(
					function() {
						$(this).click(
								function() {
									var ordernum = $(this).parent().parent()
											.children().eq(0).text();
									var username = $(this).parent().parent()
											.children().eq(1).text();
									var tname = $(this).parent().parent()
											.children().eq(2).text();
									var tnum = $(this).parent().parent()
											.children().eq(4).text();
									var total = $(this).parent().parent()
									.children().eq(5).text();
									var time = $(this).parent().parent()
											.children().eq(6).text();
									var tpic = $(this).parent().parent()
											.children().eq(8).text();

									var pic2 = $(this).parent().parent()
											.children().eq(9).text();
									var pic3 = $(this).parent().parent()
											.children().eq(10).text();
									var tprice = $(this).parent().parent()
									.children().eq(11).text();


									 

									$("#ordernum").val(ordernum);
									$("#username").val(username);
									$("#tname").val(tname);
									$("#tnum").val(tnum);
									$("#total").val(total);
									$("#time").val(time);
									$("#tprice").val(tprice);
									 
									$("img#tpic").attr("src", tpic);
									$("img#pic2").attr("src", pic2);
									$("img#pic3").attr("src", pic3);

								})

					});
		});
	</script>
</body>
</html>