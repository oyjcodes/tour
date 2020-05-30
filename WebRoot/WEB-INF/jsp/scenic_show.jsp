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
  	<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.min.js"></script> 
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
						<p>江西风景独好</p>
					</div>
					<!------------------景区列表-------------------->
					<div id="scenic_list">
						<ul>
						<c:forEach items="${pageInfo.list}" var="sc">  
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
			
		<div style="position:absolute;right:30px;bottom:240px;margin-right:20px;">
		   <ul class="pagination pagination-lg">
						<li><a
							href="${pageContext.request.contextPath}/scenic/getSomeScenic?page=${pageInfo.prePage}">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/scenic/getSomeScenic?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
								   <c:if test="${status.index <7}">
									<li><a
										href="${pageContext.request.contextPath}/scenic/getSomeScenic?page=${status.index}">${status.index}</a></li>
								   </c:if>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/scenic/getSomeScenic?page=${pageInfo.nextPage}">&raquo;</a></li>
					</ul>
		</div>
			
			<div class="w380 fr">
				<!--引入侧边页面side.jsp-->
				<%@ include file="/WEB-INF/jsp/commons/newslist_side.jsp"%>

				<!--引入尾部-->
				<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
			</div>
			
</body>
</html>