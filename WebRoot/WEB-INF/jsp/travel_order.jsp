<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>景区订单</title>
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
			<h2>旅游订单</h2>
		</div>
		<div class="public_tag">
			<ul>
				<li><a class="cur" href="#">全部订单</a></li>
				<li><a href="#">待付款</a></li>
				<li><a href="#">待出游</a></li>
				<li><a href="#">待评价</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------景区订单---------------->
		<div class="order_list">
			<div class="column_title">
				<ul>
					<li style="width:35%;">订单信息</li>
					<li style="width:10%;">数量</li>
					<li style="width:10%;">单价</li>
					<li style="width:10%;">总价</li>
					<li style="width:20%;">订单状态</li>
					<li style="width:15%;">操作</li>
				</ul>
			</div>
			<div class="list_con">
				<ul>
					<li>
						<div class="serial">订单编号：3501417528<a href="#"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="images/09.jpg" /></a></div>
									<div class="name">
										<a href="#">龙潭大峡谷门票</a>
										<p>下单日期：2017-03-06</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;">x1</div>
								<div class="price" style="width:10%;">￥80.9</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥160.9</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p>已付款</p>
										<a href="order_details.html">订单详情</a>
									</div>
								</div>
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="post_comment.html">评价</a>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="serial">订单编号：3501417528<a href="#"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="images/09.jpg" /></a></div>
									<div class="name">
										<a href="#">龙潭大峡谷门票</a>
										<p>下单日期：2017-03-06</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;">x1</div>
								<div class="price" style="width:10%;">￥80.9</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥160.9</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p>未付款</p>
										<a href="order_details.html">订单详情</a>
									</div>
								</div>
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="buy" href="#">去付款</a>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					<li>
						<div class="serial">订单编号：3501417528<a href="#"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="images/09.jpg" /></a></div>
									<div class="name">
										<a href="#">龙潭大峡谷门票</a>
										<p>下单日期：2017-03-06</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;">x1</div>
								<div class="price" style="width:10%;">￥80.9</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥160.9</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p>已付款</p>
										<a href="order_details.html">订单详情</a>
									</div>
								</div>
								<div class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="post_comment.html">评价</a>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
  <%@include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>