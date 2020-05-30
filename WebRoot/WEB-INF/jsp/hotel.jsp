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
	<!------------------子页框架-------------------->
	<div id="sub_from" style="padding-top: 10px;">
		<div class="cw1200">
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
						<div class="name">酒店信息</div>
					</div>
					<div class="fr">
						<img src="images/from_title_right.png" />
					</div>
					<div class="clear"></div>
				</div>
				<!------------------酒店信息-------------------->
				<div id="activity_enrolment">
					<div class="pic">
						<img src="/pic/${hotel.pic}" />
					</div>
					<div class="con">
						<h2>${hotel.hname}</h2>
						<ul>
							<li>联系方式：<span>${hotel.tel}</span></li>
							<li>地址：<span>${hotel.haddress}</span></li>
							<li>报价：<label>￥${hotel.price}元</label>起
							</li>
						</ul>
						<!-- <div class="buy">
							<a href="submit_orders.html">立即预定</a>
						</div> -->
						<div class="clear"></div>
					</div>
				</div>
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
								<div class="name">酒店详情</div>
							</div>
							<div class="fr">
								<img src="images/from_title_right.png" />
							</div>
							<div class="clear"></div>
						</div>
						<!------------------酒店详情-------------------->
						<div id="article">${hotel.describle}</div>
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
									<img src="images/f_t_comment2.png" />
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
	                                
								   <input type="hidden" id="hid" name="hid" value="${hotel.hid}">
								   <input type="hidden" id="usernum" name="usernum" value="${user.userid}">
									
										<div class="input-group input-group-lg">
											<input id="contents" name="content"  type="text" class="form-control"> 
											<span
												class="input-group-btn">  
												<button id="giveGood" class="btn btn-success btn-lg" type="button">发表评论</button>
											</span>
										</div>
								<script>
										
										   
								$("#giveGood").click(function(){
									var usernum= $("#usernum").val();  
									var hid = $("#hid").val();
									var content = $("#contents").val();  
									 $(function() {
										 var params = {};  
										 params.hid = hid;  
							             params.content = content;  
							             params.usernum = usernum;//注意params.名称  名称与实体bean中名称一致  
										$.ajax({
											type : 'post',
						  					url  : '${pageContext.request.contextPath}/hotel/giveHotelComment.action',
											data :  params,  
											success : function(data) {//返回json结果     
												
												var html = '';
												$.each(data, function(i, comment) {
													var time = new Date(comment.ptime) ;
													commonTime = time.toLocaleString();
													 html += '<li>'
													 +'<div class="pic"><img src="/pic/'+comment.userimag+'" /></div>'
													+'<div class="con">'
														+'<label>【用户名】'+comment.username+'</label>'
														+'<p>'+comment.content+'</p>'	  	
														+'<span>发表于：'+commonTime+'</span>'
													+'</div>'   
												+'</li>';   
								  				});       
												 $(".uid").html(html); 
												 //alert(html);
							                 },      
							                 error:function(data){  
							                     alert("出现错误");         
							                 }  
									     	});      
									}); 
								});   	
								</script>
									<div class="clear"></div>  
								</div>
								
							</c:if>
							<div class="list">
								<!-- <div class="tag">
									<a class="cur">最新评价</a>
								</div> -->
								<ul class="uid">  
									<c:forEach items="${hotelcomments}" var="comment">

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
									<img src="images/f_t_surrounding_hotel.png" />
								</div>
							</div>
							<div class="fr">
								<img src="images/from_title_right.png" />
							</div>
							<div class="clear"></div>
						</div>
						<!------------------周边酒店推荐-------------------->
						<div id="activity_recom">
							<ul id="uid">
								<c:forEach items="${otherHotelList}" var="comment">
									<li>
										<div class="pic">
											<a title="" href="${pageContext.request.contextPath}/hotel/getHotel?hnum=${comment.hnum}&hid=${comment.hid}"><img alt="" class="scale-effect"
												src="/pic/${comment.pic}" /></a>
										</div>
										<div class="con">
											<a href="#">${comment.hname}</a> <span><i
												class="am-icon-clock-o"></i>￥${comment.price}元起</span>
										</div>
										<div class="clear"></div>
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
