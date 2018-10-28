<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<head>
<title>我的游记</title>
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
	<div class="public_box pd30">
		<div class="public_tag">
			 <h1>我的游记</h1>
		</div>
		<!-----------------游记列表---------------->
		<div class="note_list">
			<ul>
			
			<c:forEach items="${userAllTravels}" var="travel" varStatus="id">
				<li class="pd_r150">
					<div class="pic"><img src="/pic/${travel.pic1}"/></div>
					<div class="con">
						<a href="${pageContext.request.contextPath}/travel/travelArticle?id=${travel.id}"><h3>${travel.title}</h3></a>
						<div class="user">
							<span><img src="/pic/${travel.userimag}" />作者：<font>${travel.username}</font></span>
							<label><img src="images/state_icon1.png" />${travel.readnum}</label>
						</div>
						<p>${travel.signature}</p>  
					</div>
					<div class="operation">
						<a href="${pageContext.request.contextPath}/travel/editTravel?id=${travel.id}"><i class="edit_ico"></i>修改</a>
						<a href="${pageContext.request.contextPath}/travel/deleteTravel?userid=${user.userid}&travelid=${travel.id}"><i class="del_ico"></i>删除</a>
					</div>
				</li>
				</c:forEach>
				
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
  	<%@ include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>