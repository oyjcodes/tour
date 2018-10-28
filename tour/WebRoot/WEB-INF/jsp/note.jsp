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
<head>
<title>游记</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-------------Amazeui--------------->
<script type="text/javascript" src="js/amazeui.js"></script>
<link rel="stylesheet" type="text/css" href="css/amazeui.css">
<!------------核心样式-------------->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<!-------------------工具栏------------------->
	<!--引入页面头部head.jsp-->
	<%@ include file="/WEB-INF/jsp/commons/head.jsp"%>
	<!------------------游记版头-------------------->
	<div id="note_head">
		<div class="head">
			<div class="banner">
				<img src="images/DD0E49BD-47F5-4B10-85DB-FE2390B91541.jpg" />
			</div>
			<div class="title">
				<div class="cw1200">
					<p>${travelsArticle.title}</p>
				</div>
				<!-- <span><img src="images/eye_ico.png"/>999+</span> -->
			</div>
		</div>
		<div class="user">
			<div class="cw1200">
				<div class="pic">
					<img src="/pic/${travelsArticle.userimag}" />
				</div>
				<div class="meta">
					<label>作者：${travelsArticle.username}</label> <span>&nbsp;&nbsp;发布于：<fmt:formatDate
							value="${travelsArticle.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="operation" style="cursor:pointer;">
					<!--  隐藏域，点赞时传入游记的id编号 -->
					<input type="hidden" id="tid" value="${travelsArticle.id}" />
					 <img id="good" src="images/favour_ico.png" />


					<div id="goodnum">${travelsArticle.readnum}</div>

				</div>

			</div>

		</div>
		<script>
			$("#good")
					.click(
							function() {
								var goodnum = $("#goodnum").text();
								//alert(goodnum);     
								var tnum = $("#tid").val();
								//alert(tnum);   
								$(function() {
									var params = {};
									params.tnum = tnum;
									params.goodnum = goodnum;//注意params.名称  名称与实体bean中名称一致  
									$.ajax({
												type : 'post',
												url : '${pageContext.request.contextPath}/travel/addNum.action',
												data : params,
												success : function(data) {//返回json结果      

													//alert(data.goodnum);
													$("#goodnum").text(data.goodnum);
												},
												error : function(data) {
													alert("出现错误");
												}
											});
								});
							});
		</script>

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
								<img src="images/f_t_article.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------文章-------------------->
					<div id="article">

						<div class="con">
							<p>${travelsArticle.describle1}</p>
							<img src="/pic/${travelsArticle.pic1}" />
							<p>${travelsArticle.describle2}</p>
							<img src="/pic/${travelsArticle.pic2}" />
							<p>${travelsArticle.describle3}</p>
							<img src="/pic/${travelsArticle.pic3}" />
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
								<form
									action="${pageContext.request.contextPath}/travel/travelComment"
									method="post">
									<input type="hidden" name="usernum" value="${user.userid}">
									<input type="hidden" name="travelnum"
										value="${travelsArticle.id}">

									<div class="input-group input-group-lg">
										<input name="content" type="text" class="form-control"
											placeholder="说说你的看法..."> <span
											class="input-group-btn">
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

								<c:forEach items="${travelCommentList}" var="comment"
									varStatus="id">
									<li>
										<div class="pic">
											<img src="/pic/${comment.userimag}" />
										</div>
										<div class="con">
											<label>【用户名】${comment.username}</label>
											<p>${comment.content}</p>
											<span>发表于：<fmt:formatDate value="${comment.ptime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></span>
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
							<div class="name">其它分享</div>
							<div class="more">
								<a
									href="${pageContext.request.contextPath}/travel/getAlltravels">更多>></a>
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------其他人分享-------------------->
					<div id="other_share">
						<ul>
							<c:forEach items="${otherTravelList}" var="travel" varStatus="id">
								<li>

									<div class="pic">
										<div class="cover">
											<a
												href="${pageContext.request.contextPath}/travel/travelArticle?id=${travel.id}"><img
												class="scale-effect " src="/pic/${travel.pic1}" /></a>
										</div>
										<div class="head">
											<img src="/pic/${travel.userimag}" />
										</div>
									</div>
									<div class="meta">
										<p>
											<a href="note.html">${travel.signature}</a>
										</p>
										<span>作者：${travel.username}<label><img
												src="images/state_icon1.png" />${travel.readnum}</label>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--引入尾部-->
	<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>
</body>
</html>