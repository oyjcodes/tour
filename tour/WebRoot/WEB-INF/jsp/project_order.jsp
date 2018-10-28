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
 <title>商品订单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="css/user.css">   
</head>
<body>
  <%@include file="/WEB-INF/jsp/my_commons/mhead.jsp"%>
  
  <!-----------------框架---------------->
<div class="cw1000">
	<div class="public_box pd10">
		<div class="list_title">
			<h2>商品订单</h2>
		</div>
		<div class="public_tag">
			<ul>
				<li><a class="cur">全部订单</a></li>
				<!-- <li><a href="#">待付款</a></li> -->
				<!-- <li><a href="#">待收货</a></li> -->
			<!-- 	<li><a href="#">待评价</a></li> -->
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------商品订单---------------->
		<div class="order_list">
			<div class="column_title">
				<ul>
					<li style="width:35%;">订单信息</li>
					<li style="width:10%;">数量</li>
					<li style="width:10%;">单价</li>
					<li style="width:10%;">总价</li>
					<!-- <li style="width:20%;">订单状态</li> -->
					<li style="width:35%;">操作</li>
				</ul>
			</div>
			<div class="list_con">
				<ul>
				<!--一个订单号 -->
					<c:forEach items="${orderList}" var="order">  
					<li>
						<div class="serial">订单编号：${order.ordernum}<a href="${pageContext.request.contextPath}/order/deleteOrder?ordernum=${order.ordernum}&userid=${order.userid}"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="/pic/${order.tpic}" /></a></div>
									<div class="name">
										<a href="#">${order.tname}</a>
										<p>下单日期：<fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
									</div>
									<div class="clear"></div>
							</div>
								<div class="number" style="width:10%;margin-top:18px;">x${order.tnum}</div>
								<div class="price"  style="width:10%;margin-top:18px;">￥${order.tprice}</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥${order.total}</div></div>
								<!-- 操作 -->
								   <div class="operation" style="width:35%;">
									  <div class="middle">
										<a class="evaluation" href="#">评价</a><!-- post_comment.html -->
									  </div>
								   </div>
							    <!-- 操作 -->
								<div class="clear"></div>
							</div>
						</div>
					</li>
	<!--一个订单号 -->
	</c:forEach>
	
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
  
  <%@include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>