<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!------------------公共盒子-------------------->
	<div class="public_box bg2">
		<div class="public_title">
			<div class="fl">
				<img src="images/from_title_left.png" />
			</div>
			<div class="con">
				<div class="lamp_ico">
					<img src="images/lamp_ico.png" />
				</div>
				<div class="name">
					<img src="images/f_t_mobile_platform.png" />
				</div>
			</div>
			<div class="fr">
				<img src="images/from_title_right.png" />
			</div>
			<div class="clear"></div>
		</div>
		<!------------------移动平台-------------------->
		<div id="mobile_platform">
			<img src="images/mp_pic.jpg" />
			<img src="images/rwm.jpg" />
			<p>查看微信公众号/查询优惠政策请扫二维码</p>
		</div>
	</div>
	<!------------------公共盒子-------------------->
	<div class="public_box bg2">
		<div class="public_title">
			<div class="fl">
				<img src="images/from_title_left.png" />
			</div>
			<div class="con">
				<div class="lamp_ico">
					<img src="images/lamp_ico.png" />
				</div>
				<div class="name">
					玩在江西
				</div>
				<div class="more">
					<a href="${pageContext.request.contextPath}/scenic/getSomeScenic">更多>></a>
				</div>
			</div>
			<div class="fr">
				<img src="images/from_title_right.png" />
			</div>
			<div class="clear"></div>
		</div>
		<!------------------公共推荐-------------------->
		<div id="public_recom">
			<ul>
				<c:forEach items="${scenics}" var="scenic" varStatus="id">
					<li><a href="${pageContext.request.contextPath}/scenic/getScenic?id=${scenic.scenicid}&scenicnum=${scenic.scenicnum}">
							<div class="pic">
								<img class="scale-effect" src="/pic/${scenic.pic1}" />
							</div>
							<p>${scenic.name}</p>
					</a></li>
				</c:forEach>
				<div class="clear"></div>
			</ul>
		</div>
	</div>
	<!------------------公共盒子-------------------->
	<div class="public_box bg2">
		<div class="public_title">
			<div class="fl">
				<img src="images/from_title_left.png" />
			</div>
			<div class="con">
				<div class="lamp_ico">
					<img src="images/lamp_ico.png" />
				</div>
				<div class="name">
					吃在江西
				</div>
				<div class="more">
					<a href="${pageContext.request.contextPath}/specialty/getAllSpecialty">更多>></a>
				</div>
			</div>
			<div class="fr">
				<img src="images/from_title_right.png" />
			</div>
			<div class="clear"></div>
		</div>
		<!------------------公共推荐-------------------->
		<div id="public_recom">
			<ul>
				<c:forEach items="${specialties}" var="specialty" varStatus="id">
					<li><a href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${specialty.tnum}&id=${specialty.id}">
							<div class="pic">
								<img class="scale-effect" src="/pic/${specialty.tpic}"/>
							</div>
							<p>${specialty.tname}</p>
					</a></li>
				</c:forEach>
				<div class="clear"></div>
			</ul>
		</div>
	</div>
	
	
	<!------------------公共盒子-------------------->
	<div class="public_box bg2">
		<div class="public_title">
			<div class="fl">
				<img src="images/from_title_left.png" />
			</div>
			<div class="con">
				<div class="lamp_ico">
					<img src="images/lamp_ico.png" />
				</div>
				<div class="name">
					 住在江西
				</div>
				<div class="more">
					<a href="${pageContext.request.contextPath}/hotel/getAllHotel">更多>></a>
				</div>
			</div>
			<div class="fr">
				<img src="images/from_title_right.png" />
			</div>
			<div class="clear"></div>
		</div>
		<!------------------公共推荐-------------------->
		<div id="public_recom">
			<ul>
				<c:forEach items="${hotels}" var="hotel" varStatus="id">
					<li><a href="${pageContext.request.contextPath}/hotel/getHotel?hnum=${hotel.hnum}&hid=${hotel.hid}">
							<div class="pic">
								<img class="scale-effect" src="/pic/${hotel.pic}"/>
							</div>
							<p>${hotel.hname}</p>
					</a></li>
				</c:forEach>
				<div class="clear"></div>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>