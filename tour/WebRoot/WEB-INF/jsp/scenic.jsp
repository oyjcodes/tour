<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>江西旅游网</title>
<!-- Bootstrap -->  
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>   
<!-----jquery库-->  
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<!---Amazeui-->
<script type="text/javascript" src="js/amazeui.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<link rel="stylesheet" type="text/css" href="css/amazeui.css">
<!---核心样式-->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
	<!--引入页面头部head.html-->
	<%@ include file="/WEB-INF/jsp/commons/head.jsp"%>
	<!------------------景区版头-------------------->
	<div id="scenic_head" style="background:url(/pic/${scenic.pic1}) no-repeat center;background-size:100%;"> 
		<div class="cw1200">
			<div class="title">
				<p>${scenic.name}</p>  
			</div>
			<a class="view_gallery" id="botn">查看图库<i
				class="am-icon-chevron-circle-right"></i></a>

			<ul style="display: none;" data-am-widget="gallery"
				class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default"
				data-am-gallery="{ pureview: true }">
				<li>
					<div class="am-gallery-item">
					<a href="#" class=""> <img src="/pic/${scenic.pic1}" alt="[${scenic.name}]:人生就像一场旅行，不必在乎目的地，在乎的是沿途的风景以及看风景的心情，让心灵去旅行!" /></a>
					</div>
				</li>
				
			<li>
					<div class="am-gallery-item"><a href="#" class=""> <img src="/pic/${scenic.pic2}" alt="[${scenic.name}]:有的事情现在不做，就一辈子也不会做了!某天也许会相遇在这个好地方!" />
						</a>
					</div>
				</li>
				
				<li>
					<div class="am-gallery-item">
						<a href="#"class=""> <img src="/pic/${scenic.pic3}" alt="[${scenic.name}]:一个背包，几本书，所有喜欢的歌，一张单程车票，一颗潇洒的心!" />
						</a>
					</div>
				</li>
			</ul>
			<!-- 景区图片介绍 -->
			<script>
				$("#botn").live("click", function() {
					$(".am-gallery-item img").click();
				});

				$(document).ready(function() {
					$(".am-icon-chevron-left").attr("class", "am-icon-close");
				});
			</script>

		</div>
	</div>
	<!------------------子页框架-------------------->
	<div id="sub_from">
		<div class="cw1200">
			<div class="w810 fl">
				<!------------------公共盒子-------------------->
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
					<!------------------景区介绍-------------------->
					<div id="article">
						<div class="con">
							<p>${scenic.describle}</p>
						</div>
						<div class="map">
							<iframe frameborder="0" width="730" height="500"
								src="${scenic.video}" allowfullscreen></iframe>
						</div>
					</div>
				</div>
				<!------------------公共盒子-------------------->
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
								<img src="images/f_t_comment.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------评论-------------------->
					<div id="comment">
						<c:if test="${not empty sessionScope.user}">
							<div class="release">
								<img src="/pic/${user.userimag}" /> 
								
								<!----------评论提交----------->   
								 <form action="${pageContext.request.contextPath}/scenic/scenicComment" method="post">
								     <input type="hidden" name="usernum" value="${user.userid}">
								     <input type="hidden" name="scenicNum" value="${scenic.scenicnum}">   
								     <input type="hidden" name="secenynum" value="${scenic.scenicid}">
								   
								      <div class="input-group input-group-lg">
											<input name="content" type="text" class="form-control" placeholder="说说你的看法...">
											 <span class="input-group-btn">  
												<button class="btn btn-success btn-lg" type="submit">发表评论</button>
											</span>    
									 </div>
								</form>
								<!----------评论提交----------->
								
								
								<div class="clear"></div>
							</div>
						</c:if>
						<div class="list">
							<div class="tag">
								<a class="cur" href="#">最新评论</a>
							</div>
							<ul>

								<c:forEach items="${scenicComment}" var="comment">

									<li>
										<div class="pic">
											<img src="/pic/${comment.userimag}" />
										</div>
										<div class="con">
											<label>【用户名】${comment.username}</label>
											<p>${comment.content}</p>
											<span>发表于：<fmt:formatDate value="${comment.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
										</div>
										<div class="tip">
											<%-- <span>${comment.floor}楼</span> --%>
										</div>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>

				</div>
			</div>
			<div class="w380 fr">
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
								<img src="images/f_t_online_book.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------在线预订-------------------->
					<form>
						<div id="online_book">
							<ul>
								<li>景区名称：<span>${scenic.name}</span></li>
								<li>电话咨询：<span>${scenic.tel}</span></li>
								<li>开放时间：<span>${scenic.time}</span></li>
								<li>详细地址：<span>${scenic.scenicaddress}</span></li>
								<li>费用：<label>￥${scenic.cost}</label></li>
							</ul>
							<%-- <input type="hidden" name="id" value="${user.userid}"><!-- 用户id -->
							<input type="hidden" name="pid" value="${scenic.scenicid}"><!-- 风景区id -->
							<input type="hidden" name="tname" value="${scenic.name}"><!-- 风景名称 -->
							<input type="hidden" name="tprice" value="${scenic.cost}"><!--风景区票价 -->
							<input type="hidden" name="pic1"  value="${scenic.pic1}">
							 <div class="input-group input-group-lg">
							<span class="input-group-btn">  
								<button class="btn btn-success btn-lg" type="submit">预定门票</button>
							</span>    
							</div> --%>
						</div>
					</form>
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
								<img src="images/f_t_surrounding_specialty.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------周边推荐-------------------->
					<div id="public_recom">
						<ul>
							<c:forEach items="${someSpecialtyList}" var="specialty"
								varStatus="id">
								<li><a
									href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${specialty.tnum}&id=${specialty.id}">
										<div class="pic">
											<img class="scale-effect" src="/pic/${specialty.tpic}" />
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
								<img src="images/f_t_surrounding_hotel.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------周边推荐-------------------->
					<div id="public_recom">
						<ul>
							<c:forEach items="${someHotelList}" var="hotel" varStatus="id">
								<li><a href="${pageContext.request.contextPath}/hotel/getHotel?hnum=${hotel.hnum}&hid=${hotel.hid}">
										<div class="pic">
											<img class="scale-effect" src="/pic/${hotel.pic}" />
										</div>
										<p>${hotel.hname}</p>
								</a></li>
							</c:forEach>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>

			<!--引入尾部-->
			<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
</body>
</html>
