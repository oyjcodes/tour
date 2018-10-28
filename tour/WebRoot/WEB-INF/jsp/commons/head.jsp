<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
</head>
<body>    
	<!--工具栏-->
	<div id="toolbar">
		<div class="cw1200">
			<ul class="fl">
				<li class="tb"><p>您好，欢迎访问江西文化旅游网！</p></li>
				<c:if test="${empty sessionScope.user}">
					<li class="tb"><a
						href="${pageContext.request.contextPath}/check/toLogin">登录</a><span>|</span></li>
					<li class="tb"><a
						href="${pageContext.request.contextPath}/check/toRegister">注册</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.user}">
					<li class="tb"><p>[${sessionScope.user.username}]欢迎加入family！！</p></li>
				</c:if>
				
			</ul>
			<ul class="fr">
				<c:if test="${not empty sessionScope.user}">
					<li class="tb"><a href="#">${user.username}</a> <!----用户-->
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
						</div> <span>|</span></li>
					<!-- <li class="tb"><a href="shop_car.html"><i class="cart_ico"></i>购物车</a><span>|</span></li> -->
				</c:if>
				<li class="tb">用户帮助中心<span>|</span></li>
				<li class="tb"><img src="images/tel_ico.gif" /><font>40000-40000</font></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>

	<!---版头-->
	<div id="header">
		<div class="cw1200">
			<!-------------------logo------------------->
			<div class="logo fl">
				<a title="" href="index.html"><img alt=""
					src="images/t_logo.jpg"></a>
			</div>
			<div class="search_nav fl"> 
				<!-------------------搜索------------------->
				<div class="search radius6">
					<form name="searchform" method="post" action="${pageContext.request.contextPath}/search/getMessage">
					    <select name="classid" id="choose">
							<option value="0">景区</option>
							<option value="1">特产</option>
							<option value="2">游记</option>
							<option value="3">资讯</option>
						</select> 
						<input class="inp_srh" name="keyboard" placeholder="请输入您要搜索的关键词">
						<input class="btn_srh" type="submit" name="submit" value="搜索">
					</form>
				</div>



				<!---导航-->
				<div class="nav">
					<ul>
						<li><a title="" class="cur" href="${pageContext.request.contextPath}/">首页</a></li>
						<li><a class="tta" title="" href="${pageContext.request.contextPath}/scenic/getSomeScenic">醉美江西</a></li>
						<li><a title="" href="${pageContext.request.contextPath}/specialty/getAllSpecialty">特产商城</a></li>
						<li><a title="" href="${pageContext.request.contextPath}/travel/getAlltravels">大话江西</a></li>
						<li><a title="" href="${pageContext.request.contextPath}/information/getALLInformations">新闻资讯</a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>