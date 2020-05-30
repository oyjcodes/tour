<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>游记评论</title>
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
			<ul>
				<li><a class="cur" href="note_comments.html">游记评论</a></li>
				<li><a href="scenic_comments.html">景区评论</a></li>
				<li><a href="activities_comments.html">活动评论</a></li>
				<li><a href="project_comments.html">商品评论</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------游记评论---------------->
		<div class="comments_list">
			<ul>
				<li class="pd_r150">
					<div class="note">
						<div class="pic"><img src="images/user_head_pic.jpg"/></div>
						<div class="con">
							<a href="#"><h3>长滩岛适合玩几天，行程如何安排？</h3></a>
							<p>作者：<span>林小巫</span><label>5个评论</label></p>
						</div>
					</div>
					<div class="text">
						<p>我评论：长滩岛很小，但是怎么呆都不够，如果只是玩3天就够啦，如果有时间，一躺就是一整天</p>
					</div>
					<div class="del" style="top:65px;">
						<a href="#"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
				<li class="pd_r150">
					<div class="note">
						<div class="pic"><img src="images/user_head_pic.jpg"/></div>
						<div class="con">
							<a href="#"><h3>长滩岛适合玩几天，行程如何安排？</h3></a>
							<p>作者：<span>林小巫</span><label>5个评论</label></p>
						</div>
					</div>
					<div class="text">
						<p>我评论：长滩岛很小，但是怎么呆都不够，如果只是玩3天就够啦，如果有时间，一躺就是一整天</p>
					</div>
					<div class="del" style="top:65px;">
						<a href="#"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
				<li class="pd_r150">
					<div class="note">
						<div class="pic"><img src="images/user_head_pic.jpg"/></div>
						<div class="con">
							<a href="#"><h3>长滩岛适合玩几天，行程如何安排？</h3></a>
							<p>作者：<span>林小巫</span><label>5个评论</label></p>
						</div>
					</div>
					<div class="text">
						<p>我评论：长滩岛很小，但是怎么呆都不够，如果只是玩3天就够啦，如果有时间，一躺就是一整天</p>
					</div>
					<div class="del" style="top:65px;">
						<a href="#"><i class="del_ico"></i>删除评论</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
  <%@include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>