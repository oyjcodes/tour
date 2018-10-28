<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
 <title>商城列表</title>
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
			<!------------------公共盒子-------------------->
			<div class="public_box bg1">
				<div class="public_title">
					<div class="fl"><img src="images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="images/lamp_ico.png"/></div>
						<div class="name">特产商城</div>
					</div>
					<div class="fr"><img src="images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------列表分类-------------------->
				<!-- <div id="list_sort">
					<span>产品类型：</span>
					<div class="list_1">
						<a href="#">全部</a>
						<a href="#">农产品</a>
						<a href="#">水果</a>
						<a href="#">工艺品</a>
						<a href="#">副食品</a>
						<div class="clear"></div>
					</div>
  
				</div> -->
				<!------------------特产列表-------------------->
				<div id="mall_list">
					<ul>
						<c:forEach items="${pageInfo.list}" var="specialty" varStatus="id">
								<li>
									<div class="pic">
										<a href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${specialty.tnum}&id=${specialty.id}"><img class="scale-effect" src="/pic/${specialty.tpic}" /></a>
									</div>
									<div class="con">
										<h3>
											<a href="project.html">${specialty.tname}</a>
										</h3>
										<!-- <label>江西物流</label> -->
									</div>
									<div class="price">
									    
										<p>
											<span>价格：</span>￥<label>${specialty.tprice}</label>
										</p>
										<span>心动就把我吃掉！！</span>
									</div>
									<div class="other">
										<!-- <span>76人付款</span><a href="project.html">132条评论</a> -->
									</div>
									<div class="view">
										<a href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${specialty.tnum}&id=${specialty.id}">查看详情</a>
									</div>
									<div class="clear"></div>
								</li>
							</c:forEach>
					</ul>
				</div>
				
			</div>
	
		</div>
		
		
		<div style="position:absolute;right:30px;bottom:200px;margin-right:50px;">
		   <ul class="pagination pagination-lg">
						<li><a
							href="${pageContext.request.contextPath}/specialty/getAllSpecialty?page=${pageInfo.prePage}">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">  
									<li class="active">
									   <a href="${pageContext.request.contextPath}/specialty/getAllSpecialty?page=${status.index}">${status.index}</a>
									</li>
									 
								</c:when>
								<c:otherwise>
								   <c:if test="${status.index <7}">
									<li><a
										href="${pageContext.request.contextPath}/specialty/getAllSpecialty?page=${status.index}">${status.index}</a></li>
								   </c:if>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath}/specialty/getAllSpecialty?page=${pageInfo.nextPage}">&raquo;</a></li>
					</ul>
		</div>
		
		<div class="w380 fr">
		
	<!--引入侧边页面side.jsp-->
	<%@ include file="/WEB-INF/jsp/commons/newslist_side.jsp"%>
		
		<div class="clear"></div>
    </div>
</div>
	  
		<!--引入尾部-->
	<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
</body>
</html>