<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>景区列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-------------jquery库-------------->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<!-------------Amazeui--------------->
<script type="text/javascript" src="js/amazeui.js"></script>
<link rel="stylesheet" type="text/css" href="css/amazeui.css">
<!------------核心样式-------------->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<!--引入页面头部head.html-->
	<%@ include file="/WEB-INF/jsp/commons/head.jsp"%>

	<!------------------子页框架-------------------->
	<div id="sub_from">
		<div class="cw1200">
			<div class="w810 fl">
				<!------------------公共盒子------------------>
				<div class="public_box bg1">
					<div class="public_title">
						<div class="fl">
							<img src="images/from_title_left.png" />
						</div>
						<div class="con">
							<div class="lamp_ico">
								<img src="images/lamp_ico.png" />
							</div>
							<div class="name">
								<img src="images/f_t_scenic.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------列表分类-------------------->
					<div id="list_sort">
						<!-- <ul>
							<li><span>产品类型：</span><a class="cur" href="scenic_list.html">旅游景区</a><a
								href="activities_list.html">旅游活动</a>
							<div class="clear"></div></li>
						</ul> -->
						<p>【${someSpecialtyList[0].tcategory}】风景欣赏</p>
					</div>
					<!------------------景区列表-------------------->
					<div id="scenic_list">
						<ul>
						<c:forEach items="${scenictList}" var="sc">  
                             <li>
								<div class="pic">
									<a href="${pageContext.request.contextPath}/scenic/getScenic?id=${sc.scenicid}&scenicnum=${sc.scenicnum}"><img class="scale-effect" src="/pic/${sc.pic1}"/></a>
								</div>
								<div class="con">
									<h3>
										<a href="${pageContext.request.contextPath}/scenic/getScenic?id=${sc.scenicid}&scenicnum=${sc.scenicnum}">${sc.name}</a>
									</h3>
									<p>${sc.title1}</p>
								</div>
								<div class="tip">
									<img src="images/scenic_ico.png" />景区
								</div>
								<div class="clear"></div>
							</li>
                        </c:forEach>  
							
						</ul>
					</div>

				</div>

			</div>
			<div class="w380 fr">
				<!--引入侧边页面side.jsp-->
				<%@ include file="/WEB-INF/jsp/commons/side.jsp"%>

				<!--引入尾部-->
				<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
</body>
</html>