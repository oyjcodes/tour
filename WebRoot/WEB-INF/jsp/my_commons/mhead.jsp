<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>mfoot</title>
</head>
<body>
	<!-------------------版头------------------->
	<div id="header">
		<div class="cw1000">
			<!-------------------logo------------------->
			<div class="logo">
				<a title="" href="index.html"><img alt="" src="images/logo.jpg" /></a>
			</div>
			<!-------------------导航------------------->
			<div class="nav">
				<ul>
					<li><a title=""
						href="${pageContext.request.contextPath}/">首页</a><span>|</span></li>
					<li><a title=""
						href="${pageContext.request.contextPath}/scenic/getSomeScenic">醉美江西</a><span>|</span></li>
					<li><a title=""
						href="${pageContext.request.contextPath}/specialty/getAllSpecialty">特产商城</a><span>|</span></li>
					<li><a title=""
						href="${pageContext.request.contextPath}/travel/getAlltravels">大话江西</a><span>|</span></li>
					<li><a title=""
						href="${pageContext.request.contextPath}/information/getALLInformations">新闻资讯</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<!-------------------用户------------------->
			<c:if test="${not empty sessionScope.user}">
				<div class="user">
					<a class="user-hd" href="#"> <img
						src="/pic/${user.userimag}" /><b></b> 
						<div class="clear"></div>
					</a>
					<div class="user-bd">
						<div class="integral">
							<img src="images/integral_ico.png" />${user.username}
						</div>
						<ul class="nav_sort"> 
							<%-- <li><a href="${pageContext.request.contextPath}/travel/my_index"><i
									class="i1"></i>我的主页</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/travel/write_note"><i
									class="i2"></i>写游记</a></li>
							<li><a href="${pageContext.request.contextPath}/travel/my_note?id=${user.userid}"><i   
									class="i9"></i>我的游记</a></li>       
							<li><a
								href="${pageContext.request.contextPath}/order/getOrder?userid=${user.userid}"><i
									class="i4"></i>商品订单</a></li>
							<li><a href="${pageContext.request.contextPath}/getUser/my_info"><i 
									class="i7"></i>设置</a></li>
							<li><a href="${pageContext.request.contextPath}/check/logout"><i 
									class="i8"></i>退出</a></li>
						</ul>
					</div>
				</div>
				</c:if>
			<div class="clear"></div>
		</div>
	</div>
	<!-----------------用户banner---------------->
	<c:if test="${not empty sessionScope.user}">
	<div id="user_banner">
		<div class="pic">
			<a><img src="/pic/${user.userimag}" /></a> 
		</div>
		<div class="con">
			<h2>${user.username}</h2>
			<%-- <p>个性签名：${user.signature}</p> --%>
		</div>
	</div>
	</c:if>
	<!-----------------快捷导航---------------->
	<div id="quick_nav">
		<%-- <a href="${pageContext.request.contextPath}/travel/my_index"><span
			class="ico1"><img src="images/nav_ico1.png" /></span>个人主页</a> --%> 
			<a href="${pageContext.request.contextPath}/travel/write_note"><span
			class="ico2"><img src="images/nav_ico2.png" /></span>发布游记</a> <a
			href="${pageContext.request.contextPath}/travel/my_note?id=${user.userid}"><span
			class="ico7"><img src="images/nav_ico7.png" /></span>我的游记</a> <a
			href="${pageContext.request.contextPath}/order/getOrder?userid=${user.userid}"><span
			class="ico4"><img src="images/nav_ico4.png" /></span>商品订单</a>
	</div>
</body>
</html>