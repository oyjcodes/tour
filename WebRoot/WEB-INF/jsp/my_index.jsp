<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>我的主页</title>
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
		<div class="w700 fr">
			<div class="public_box">
				<div class="public_title">
					<h2>我的游记</h2>
				</div>
				<!-----------------游记列表---------------->
				<div class="note_list">
					<ul>
					
						<li>
							<div class="pic">
								<img src="images/y1.jpg" />
							</div>
							<div class="con">
								<a href="#"><h3>我的2016# 萌哥带我走天崖之爱了爱普吉</h3></a>
								<div class="user">
									<span><img src="images/user_head_pic.jpg" />作者：<font>木子</font></span>
									<label><img src="images/state_icon1.png" />18</label> <label><img
										src="images/state_icon2.png" />20</label>
								</div>
								<p>从和我哥第一次的旅行开始 他就一直想带我去他心心念念的 普｜吉｜岛 然后还有他最爱的普吉上的 皇｜帝｜岛
									我们提前半年订的机票 机票订的很冲动 !!!!就是某天看到了亚航大促的推送 时间订在9月29—10月9号 跨过十</p>
							</div>
						</li>
						
					</ul>
					<div class="h_more">
						<a href="#">共<b>29</b>篇游记
						</a>
					</div>
				</div>
			</div>
			
			
			
			<!-- 门票订单 -->
			<div class="public_box">
				<div class="public_title">
					<h2>门票订单</h2>
				</div>
				<!-----------------门票订单---------------->
				<div class="order_list">
					<div class="column_title">
						<ul>
							<li style="width: 35%;">订单信息</li>
							<li style="width: 10%;">数量</li>
							<li style="width: 10%;">单价</li>
							<li style="width: 10%;">总价</li>
							<li style="width: 20%;">订单状态</li>
							<li style="width: 15%;">操作</li>
						</ul>
					</div>
					<div class="list_con">
						<ul>
							<li>
								<div class="serial">
									订单编号：3501417528<a href="#"><i class="del"></i>删除</a>
								</div>
								<div class="cont">
									<div class="con">
										<div class="info" style="width: 35%;">
											<div class="pic">
												<a href="#"><img width=53 height=53 src="images/09.jpg" /></a>
											</div>
											<div class="name">
												<a href="#">龙潭大峡谷门票</a>
												<p>下单日期：2017-03-06</p>
											</div>
											<div class="clear"></div>
										</div>
										<div class="number" style="width: 10%;">x1</div>
										<div class="price" style="width: 10%;">￥80.9</div>
										<div class="m_price" style="width: 10%;">
											<div class="middle">￥160.9</div>
										</div>
										<div class="state" style="width: 20%;">
											<div class="middle">
												<p>已付款</p>
												<a href="order_details.html">订单详情</a>
											</div>
										</div>
										<div class="operation" style="width: 15%;">
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
					<div class="h_more">
						<a href="#">共<b>29</b>个订单
						</a>
					</div>
				</div>

			</div>
			
				
			<div class="public_box">
				<div class="public_title">
					<h2>商品订单</h2>
				</div>
				<!-----------------商品订单---------------->
				<div class="order_list">
					<div class="column_title">
						<ul>
							<li style="width: 35%;">订单信息</li>
							<li style="width: 10%;">数量</li>
							<li style="width: 10%;">单价</li>
							<li style="width: 10%;">总价</li>
							<li style="width: 20%;">订单状态</li>
							<li style="width: 15%;">操作</li>
						</ul>
					</div>
					<div class="list_con">
						<ul>
							<li>
								<div class="serial">
									订单编号：3501417528<a href="#"><i class="del"></i>删除</a>
								</div>
								<div class="cont">
									<div class="con">
										<div class="info" style="width: 35%;">
											<div class="pic">
												<a href="#"><img width=53 height=53 src="images/09.jpg" /></a>
											</div>
											<div class="name">
												<a href="#">孟津特供香酥梨一斤</a>
												<p>下单日期：2017-03-06</p>
											</div>
											<div class="clear"></div>
										</div>
										<div class="number" style="width: 10%;">x1</div>
										<div class="price" style="width: 10%;">￥80.9</div>
										<div class="m_price" style="width: 10%;">
											<div class="middle">￥160.9</div>
										</div>
										<div class="state" style="width: 20%;">
											<div class="middle">
												<p>已付款</p>
												<a href="order_details.html">订单详情</a>
											</div>
										</div>
										<div class="operation" style="width: 15%;">
											<div class="middle">
												<a class="evaluation" href="post_comment.html">评价</a>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<div class="con">
										<div class="info" style="width: 35%;">
											<div class="pic">
												<a href="#"><img width=53 height=53 src="images/09.jpg" /></a>
											</div>
											<div class="name">
												<a href="#">孟津特供香酥梨一斤</a>
												<p>下单日期：2017-03-06</p>
											</div>
											<div class="clear"></div>
										</div>
										<div class="number" style="width: 10%;">x1</div>
										<div class="price" style="width: 10%;">￥80.9</div>

										<div class="clear"></div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="h_more">
						<a href="#">共<b>29</b>个订单
						</a>
					</div>
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>