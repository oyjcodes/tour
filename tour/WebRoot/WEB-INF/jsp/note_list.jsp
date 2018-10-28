<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<head>
    <title>游记分享</title>
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
<!-------------------工具栏------------------->
	<%@ include file="/WEB-INF/jsp/commons/head.jsp"%>
<!------------------游记分享-------------------->
<div id="note_list">
	<div class="banner">
		<h2>留下你的回忆</h2>
		<p>发现美丽江西，记录精彩瞬间，保存美好回忆</p>
	</div>
	<div class="tag">
		<div class="cw1200">
			<a class="cur">最新游记</a>
			<a href="${pageContext.request.contextPath}/travel/write_note">我要写游记</a>
		</div>
	</div>
	<div class="con">
			<div class="cw1200">
				<ul class="am-avg-sm-2">
					<c:forEach items="${pageInfo.list}" var="travel" varStatus="id">
						<li>
							<div class="box">
								<div class="pic">
									<div class="cover">
										<a
											href="${pageContext.request.contextPath}/travel/travelArticle?id=${travel.id}"><img
											class="scale-effect " src="/pic/${travel.pic1}" />"/></a>
									</div>
									<div class="head">
										<img src="/pic/${travel.userimag}" />
									</div>
								</div>
								<div class="meta">
									<p>
										<a href="note.html">${travel.signature}</a>
									</p>
									<span>2017/02/02 作者：${travel.username}<label><img
											src="images/state_icon1.png" />${travel.readnum}</label></span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
</div>
<div style="position:absolute;right:0px;margin-right:20px;">
		   <ul class="pagination pagination-lg">
						<li><a
							href="${pageContext.request.contextPath}/travel/getAlltravels?page=${pageInfo.prePage}">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/travel/getAlltravels?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/travel/getAlltravels?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/travel/getAlltravels?page=${pageInfo.nextPage}">&raquo;</a></li>
					</ul>
		</div>
<!-----------------版底---------------->
<!--引入尾部-->
	<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
</body>
</html>