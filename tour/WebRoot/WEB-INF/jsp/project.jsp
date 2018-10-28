<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<head>
<title>商品详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-------------jquery库(商城图片放大，切换展示)-------------->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>   
<!-------------Amazeui--------------->
<script type="text/javascript" src="js/amazeui.js"></script>
<link rel="stylesheet" type="text/css" href="css/amazeui.css">
<!------------核心样式-------------->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>
	<!-------------------工具栏------------------->
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
						<div class="name">
							<img src="images/f_t_item_info.png" />
						</div>
					</div>
					<div class="fr">
						<img src="images/from_title_right.png" />
					</div>
					<div class="clear"></div>
				</div>
				<!------------------特产信息-------------------->
				<div id="item_info">
					<!-----------------主图---------------->
					<div class="preview">
						<div id="vertical" class="bigImg">
							<img src="/pic/${specialty.tpic}" id="midimg" />
							<div style="display: none;" id="winSelector"></div>
						</div>
						<div id="imageMenu">
							<ul>
								<li id="onlickImg"><img src="/pic/${specialty.tpic}" /></li>
								<li><img src="/pic/${specialty.pic2}" /></li>
								<li><img src="/pic/${specialty.pic3}" /></li>
							</ul>
						</div>
						<div id="bigView" style="display: none;">
							<img width="800" height="800" />
						</div>
					</div>
					<!-----------------内容信息---------------->
					<div class="cont_info">
						<div class="name">
						
							<h2>${specialty.tname}</h2>
						</div>
						<!-------------商品属性（价位数量）---------------->
						<div class="p_number">
							<div class="unit_price">
								<ul>
									<li class="fl">商品单价：<strong id="price_item_1">￥${specialty.tprice}</strong></li>
									<!-- <li class="fr">已成交：3笔</li> -->
									<div class="clear"></div>
								</ul>
							</div>
							<!------------商品规格-------------->
							<script type="text/javascript">
								$(
								function() {
									$(".yListr ul li em").click(
										function() {
												$(this).addClass("yListrclickem").siblings().removeClass("yListrclickem");})
										})
							</script>
			<!-- 表单提交 -->
				<form action="${pageContext.request.contextPath}/order/giveOrder" method="post">  
							<!-------------数量增减变动价格（产品页）-------------->
							<script type="text/javascript" src="js/payfor.js"></script>
							<div class="add_chose">
								<label>数量：</label> 
								<a class="reduce" onClick="setAmount.reduce('#qty_item_1')" href="javascript:void(0)">-</a> 
					
									 <!--订购商品的数量 -->
									 <input type="text" name="qty_item_1" value="1" id="qty_item_1" onKeyUp="setAmount.modify('#qty_item_1')" class="text" />
									 <a class="add" onClick="setAmount.add('#qty_item_1')" href="javascript:void(0)">+</a> 
									 <span>库存：${specialty.stocknum}件</span>
								<div class="clear"></div>
							</div>
							<div class="buy">
								<ul>
									<li>总价：<span class="total-font" id="total_item_1">￥0.00</span></li>
									<li><span class="jifen">购买特产可获得：<b
											id="total_points">18</b>积分
									</span></li>
									<%-- <li><a class="go_buy" href="${pageContext.request.contextPath}/specialty/giveOrder">购买消费券</a> --%>
									
									<!-- <a class="car_buy" href="shop_car.html">加入购物车</a> --></li>
									<!-- <li>运费：<span class="tp_bg">卖家承担运费</span></li> -->
									<li>提醒：<span class="tp_bg">特产商品均由各地品牌商特供，请放心购买</span></li>
								</ul>
						  </div>     
				            <input type="hidden" name="id" value="${specialty.id}">
							<input type="hidden" name="tname" value="${specialty.tname}">
							<input type="hidden" name="tprice" value="${specialty.tprice}">
							<input type="hidden" name="tpic"  value="${specialty.tpic}">
							<input type="hidden" name="allnum" value="${specialty.stocknum}"/> 
			                <div id="ss"><input id="go_buy" style="margin-top:40px;" type="submit" value="订购消费券"/>
			                </div>
			    </form>
				<!-- 表单提交 -->
							
							
							
						</div>
						
					</div>
				</div>
				
				<div class="clear"></div>
			
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
							<div class="name">
								<img src="images/f_t_project_d.png" />
							</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------特产详情-------------------->
					<div id="project_details">
						${specialty.tdescrible}
						<ul>
							<li><img src="/pic/${specialty.tpic}" /></li>
							<br />

							<li><img src="/pic/${specialty.pic2}" /></li>
							<br />
							<li><img src="/pic/${specialty.pic3}" /></li>
							<br />
						</ul>
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
								
								
								<!----------评论提交----------->   
								 <form action="${pageContext.request.contextPath}/specialty/publishSpecialtyComment" method="post">
								   <input type="hidden" name="areanum" value="${specialty.tnum}">
								   <input type="hidden" name="tnum" value="${specialty.id}">
								   <input type="hidden" name="usernum" value="${user.userid}">
								   
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
								<a class="cur" href="#">最新评价</a>
							</div>
							<ul>
								<c:forEach items="${specialtyCommnet}" var="comment">

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
							<div class="name">附近特产</div>
						</div>
						<div class="fr">
							<img src="images/from_title_right.png" />
						</div>
						<div class="clear"></div>
					</div>
					<!------------------商品推荐-------------------->
					<div id="project_recom">
						<ul>
							<c:forEach items="${specialties}" var="comment">
								<li>
									<div class="pic">
										<a title="" href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${comment.tnum}&id=${comment.id}"><img alt="" class="scale-effect"
											src="/pic/${comment.tpic}" /></a>
									</div>
									<div class="con">
										<a href="${pageContext.request.contextPath}/specialty/getSpecialty?tnum=${comment.tnum}&id=${comment.id}">${comment.tname}</a> <p>
										￥<label>${comment.tprice}</label>
									</p>
									</div>
									<div class="clear"></div>
								</li>
							</c:forEach>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<!-----------------版底---------------->
	<!--引入尾部-->
	<%@ include file="/WEB-INF/jsp/commons/foot.jsp"%>




	<!-----------------产品主图特效---------------->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// 图片上下滚动
							var count = $("#imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
							var interval = $("#imageMenu li:first").width();
							var curIndex = 0;

							$('.scrollbutton').click(function() {
								if ($(this).hasClass('disabled'))
									return false;

								if ($(this).hasClass('smallImgUp'))
									--curIndex;
								else
									++curIndex;

								$('.scrollbutton').removeClass('disabled');
								if (curIndex == 0)
									$('.smallImgUp').addClass('disabled');
								if (curIndex == count - 1)
									$('.smallImgDown').addClass('disabled');

								$("#imageMenu ul").stop(false, true).animate({
									"marginLeft" : -curIndex * interval + "px"
								}, 600);
							});

							// 解决 ie6 select框 问题
							$.fn.decorateIframe = function(options) {
								if ($.browser.msie && $.browser.version < 7) {
									var opts = $.extend({},
											$.fn.decorateIframe.defaults,
											options);
									$(this)
											.each(
													function() {
														var $myThis = $(this);
														//创建一个IFRAME
														var divIframe = $("<iframe />");
														divIframe.attr("id",
																opts.iframeId);
														divIframe.css(
																"position",
																"absolute");
														divIframe.css(
																"display",
																"none");
														divIframe.css(
																"display",
																"block");
														divIframe
																.css(
																		"z-index",
																		opts.iframeZIndex);
														divIframe.css("border");
														divIframe.css("top",
																"0");
														divIframe.css("left",
																"0");
														if (opts.width == 0) {
															divIframe
																	.css(
																			"width",
																			$myThis
																					.width()
																					+ parseInt($myThis
																							.css("padding"))
																					* 2
																					+ "px");
														}
														if (opts.height == 0) {
															divIframe
																	.css(
																			"height",
																			$myThis
																					.height()
																					+ parseInt($myThis
																							.css("padding"))
																					* 2
																					+ "px");
														}
														divIframe
																.css("filter",
																		"mask(color=#fff)");
														$myThis
																.append(divIframe);
													});
								}
							}
							$.fn.decorateIframe.defaults = {
								iframeId : "decorateIframe1",
								iframeZIndex : -1,
								width : 0,
								height : 0
							}
							//放大镜视窗
							$("#bigView").decorateIframe();

							//点击到中图
							var midChangeHandler = null;

							$("#imageMenu li img")
									.bind(
											"click",
											function() {
												if ($(this).attr("id") != "onlickImg") {
													midChange($(this).attr(
															"src").replace(
															"small", "mid"));
													$("#imageMenu li")
															.removeAttr("id");
													$(this).parent().attr("id",
															"onlickImg");
												}
											})
									.bind(
											"mouseover",
											function() {
												if ($(this).attr("id") != "onlickImg") {
													window
															.clearTimeout(midChangeHandler);
													midChange($(this).attr(
															"src").replace(
															"small", "mid"));
													$(this).css();
												}
											})
									.bind(
											"mouseout",
											function() {
												if ($(this).attr("id") != "onlickImg") {
													$(this).removeAttr("style");
													midChangeHandler = window
															.setTimeout(
																	function() {
																		midChange($(
																				"#onlickImg img")
																				.attr(
																						"src")
																				.replace(
																						"small",
																						"mid"));
																	}, 1000);
												}
											});

							function midChange(src) {
								$("#midimg").attr("src", src).load(function() {
									changeViewImg();
								});
							}

							//大视窗看图
							function mouseover(e) {
								if ($("#winSelector").css("display") == "none") {
									$("#winSelector,#bigView").show();
								}

								$("#winSelector").css(fixedPosition(e));
								e.stopPropagation();
							}

							function mouseOut(e) {
								if ($("#winSelector").css("display") != "none") {
									$("#winSelector,#bigView").hide();
								}
								e.stopPropagation();
							}

							$("#midimg").mouseover(mouseover); //中图事件
							$("#midimg,#winSelector").mousemove(mouseover)
									.mouseout(mouseOut); //选择器事件

							var $divWidth = $("#winSelector").width(); //选择器宽度
							var $divHeight = $("#winSelector").height(); //选择器高度
							var $imgWidth = $("#midimg").width(); //中图宽度
							var $imgHeight = $("#midimg").height(); //中图高度
							var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

							function changeViewImg() {
								$("#bigView img").attr(
										"src",
										$("#midimg").attr("src").replace("mid",
												"big"));
							}

							changeViewImg();

							$("#bigView").scrollLeft(0).scrollTop(0);
							function fixedPosition(e) {
								if (e == null) {
									return;
								}
								var $imgLeft = $("#midimg").offset().left; //中图左边距
								var $imgTop = $("#midimg").offset().top; //中图上边距
								X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
								Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
								X = X < 0 ? 0 : X;
								Y = Y < 0 ? 0 : Y;
								X = X + $divWidth > $imgWidth ? $imgWidth
										- $divWidth : X;
								Y = Y + $divHeight > $imgHeight ? $imgHeight
										- $divHeight : Y;

								if ($viewImgWidth == null) {
									$viewImgWidth = $("#bigView img")
											.outerWidth();
									$viewImgHeight = $("#bigView img").height();
									if ($viewImgWidth < 200
											|| $viewImgHeight < 200) {
										$viewImgWidth = $viewImgHeight = 800;
									}
									$height = $divHeight * $viewImgHeight
											/ $imgHeight;
									$("#bigView").width(
											$divWidth * $viewImgWidth
													/ $imgWidth);
									$("#bigView").height($height);
								}

								var scrollX = X * $viewImgWidth / $imgWidth;
								var scrollY = Y * $viewImgHeight / $imgHeight;
								$("#bigView img").css({
									"left" : scrollX * -1,
									"top" : scrollY * -1
								});
								$("#bigView")
										.css(
												{
													"top" : 75,
													"left" : $(".preview")
															.offset().left
															+ $(".preview")
																	.width()
															+ 15
												});

								return {
									left : X,
									top : Y
								};
							}

						});
	</script>
</body>
</html>