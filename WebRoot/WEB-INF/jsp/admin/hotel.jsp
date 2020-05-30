<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>风景模块</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<!-- <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"> -->
<link rel="apple-touch-icon-precomposed" href="images/t_logo.jpg">
<link rel="shortcut icon" href="images/t_logo.jpg">
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/admin-scripts.js"></script>

</head>
<body class="user-select">
	<section class="container-fluid">

		<!--头部-->
		<%@ include file="/WEB-INF/jsp/admin/common/head.jsp"%>
		<!--头部-->


		<!-- 左边的菜单 -->
		<%@ include file="/WEB-INF/jsp/admin/common/menu.jsp"%>
		<!-- 左边的菜单 -->

		<!-- 右边主区域 -->
		<div
			class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
			id="main">
			<h1 class="page-header">酒店管理</h1>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption>特产列表</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>酒店名称</th>
							<th>所在地</th>
							<th>图片</th>
							<th>价格</th>
							<th>电话</th>
							<th>状态</th>
							<th>酒店地址</th>
							<th>操作</th>


						</tr>
					</thead>

					<tbody id="load">
						<c:forEach items="${pageInfo.list}" var="item" varStatus="id">
							<tr>
								<td class="article-title">${item.hid}</td>
								<td>${item.hname}</td>
								<td>${item.areaName}</td>
								<td><div style="width: 50px; heigth: 50px;" class="pdiv">
										<img style="width: 100%; heigth: 100%;" class="pic"
											src="/pic/${item.pic}" />
									</div></td>
								<td><font color="red">${item.price}</font></td>
								<td>${item.tel}</td>
								<td><c:if test="${item.stage eq 0}">
										<font color="orange">下架</font>
									</c:if> <c:if test="${item.stage eq 1}">
									                    上架
							          </c:if></td>
								<td>${item.haddress}</td>
								<td style="display: none">${item.stage}</td>
								<td style="display: none">/pic/${item.pic}</td>
								<td style="display: none">${item.hnum}</td>
								<td style="display: none">${item.describle}</td>
								<td style="width: 188px;">
									<button type="button" class="btn btn-info" data-toggle="modal"
										data-target="#editModal" name="edit">修改</button> <a
									href="${pageContext.request.contextPath}/backHotel/downHotel?id=${item.hid}">
										<button type="button" class="btn btn-warning">下架</button>
								</a> <a
									href="${pageContext.request.contextPath}/backHotel/upHotel?id=${item.hid}">
										<button type="button" class="btn  btn-default">上架</button>
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>


			<footer class="message_footer">
				<nav>
					<ul class="pagination pagenav"
						style="position: absolute; right: 70px; top: 500px;">
						<li><a
							href="${pageContext.request.contextPath}/backSpecialty/requestAllSpecialty?page=${pageInfo.prePage}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${pageInfo.pages}"
							varStatus="status">

							<c:choose>
								<c:when test="${pageUtils.currentPageNum==i}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/backHotel/requestAllHotel?page=${status.index}">${status.index}</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/backHotel/requestAllHotel?page=${status.index}">${status.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- <li class="active"><a>1</a></li> -->
						<li><a
							href="${pageContext.request.contextPath}/backHotel/requestAllHotel?page=${pageInfo.nextPage}"
							aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</ul>
				</nav>
			</footer>
		</div>
	</section>

<!-- 模态框 （Modal）修改酒店 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
               
                <h4 class="modal-title" id="myModalLabel">酒店信息修改</h4>
            </div>
            
            <!--   添加主体 开始-->
            <div class="modal-body" style="top:15px;"> 
               <form name="editForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backHotel/editHotel.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->
							<input type="hidden" name="hid" id="hid" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">酒店名称</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="hname"
											name="hname" placeholder="请输入酒店名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">酒店城市</label>
									<div class="col-sm-4">
										<select name="hnum" id="hnum">
										<option value="1101">南昌</option>
										<option value="1102">九江</option>
										<option value="1103">赣州</option>
										<option value="1104">上饶</option>
										<option value="1105">宜春</option>
										<option value="1106">吉安</option>
										<option value="1107">抚州</option>
										<option value="1108">鹰潭</option>
										<option value="1109">萍乡</option>
										<option value="1110">新余</option>
										<option value="1111">景德镇</option>
									</select>  
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">价格</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="price"
											name="price" placeholder="请输入价格">
									</div>
								</div>

							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">酒店地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="haddress"
										name="haddress" placeholder="请输入酒店地址">
								</div>
							</div>


							<div class="form-group">
									<label class="col-sm-2 control-label">酒店状态</label>
									<div class="col-sm-4">
										<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
									</div>
								</div>
						</div>

							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">酒店描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入酒店描述"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话咨询</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="tel" name="tel"
											placeholder="请输入咨询电话">
									</div>
								</div>

								
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片一</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic"
											name="pic" placeholder="图片一">

									</div>
									<div style="float: left; width: 50px; heigth: 50px;">
										<img id="pic" style="width: 100%; heigth: 100%;" class="pic"
											src="" />
									</div>
								</div>

							</div>
						</form>
            </div>
            <!--   添加主体结束 -->
             
             
             <!--    开始按钮 -->
            <div class="modal-footer"  style="text-align: center" style="height:50px">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="editForm.submit();" type="button"class="btn btn-primary">提交更改</button>
            </div>
            <!--    结束按钮 -->
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<!-- 新增酒店信息 -->
<div class="modal fade" id="addHotelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
               
                <h4 class="modal-title" id="myModalLabel">酒店信息修改</h4>
            </div>
            
            <!--   添加主体 开始-->
            <div class="modal-body" style="top:15px;"> 
               <form name="addForm" class="form-horizontal" role="form"
							action="${pageContext.request.contextPath}/backHotel/addHotel.action"
							method="post" enctype="multipart/form-data">
							<!-- 模态框左侧部分 -->
							<input type="hidden" name="hid" id="hid" />
							<div style="float: left; width: 50%;">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">酒店名称</label>
									<div class="col-sm-7">
										<input type="text" value="" class="form-control" id="hname"
											name="hname" placeholder="请输入酒店名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">酒店城市</label>
									<div class="col-sm-4">
										<select name="hnum" id="hnum">
										<option value="1101">南昌</option>
										<option value="1102">九江</option>
										<option value="1103">赣州</option>
										<option value="1104">上饶</option>
										<option value="1105">宜春</option>
										<option value="1106">吉安</option>
										<option value="1107">抚州</option>
										<option value="1108">鹰潭</option>
										<option value="1109">萍乡</option>
										<option value="1110">新余</option>
										<option value="1111">景德镇</option>
									</select>  
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">价格</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="price"
											name="price" placeholder="请输入价格">
									</div>
								</div>

							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">酒店地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="haddress"
										name="haddress" placeholder="请输入酒店地址">
								</div>
							</div>


							<div class="form-group">
									<label class="col-sm-2 control-label">酒店状态</label>
									<div class="col-sm-4">
										<select name="stage" id="stage">
										<option value="1">上架</option>
										<option value="0">下架</option>

									</select>
									</div>
								</div>
						</div>

							<!-- 模态框右侧部分 -->
							<div style="float: left; width: 50%;">

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">酒店描述</label>
									<div class="col-sm-9">
										<textarea rows="7" class="form-control" id="describle"
											name="describle" placeholder="请输入酒店描述"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话咨询</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="tel" name="tel"
											placeholder="请输入咨询电话">
									</div>
								</div>

								
								<div class="form-group">
									<label for="pic1" class="col-sm-2 control-label">图片一</label>
									<div class="col-sm-5" style="float: left;">
										<input type="file" name="file" class="form-control" id="pic"
											name="pic" placeholder="图片一">

									</div>
									 
								</div>

							</div>
						</form>
            </div>
            <!--   添加主体结束 -->
             
             
             <!--    开始按钮 -->
            <div class="modal-footer"  style="text-align: center" style="height:50px">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button onclick="addForm.submit();" type="button"class="btn btn-primary">增加酒店</button>
            </div>
            <!--    结束按钮 -->
            
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
	<script>
		//取页面的值传给模态框
		$(function() {
			$("Button[name='edit']").each(
					function() {
						$(this).click(
								function() {
									var hid = $(this).parent().parent()
											.children().eq(0).text();
									var hname = $(this).parent().parent()
											.children().eq(1).text();
									var areaName = $(this).parent().parent()
											.children().eq(2).text();
									var price = $(this).parent().parent()
											.children().eq(4).text();
									var tel = $(this).parent().parent()
											.children().eq(5).text();
									var haddress = $(this).parent().parent()
											.children().eq(7).text();

									var stage = $(this).parent().parent()
											.children().eq(8).text();
									var pic = $(this).parent().parent()
											.children().eq(9).text();

									var hnum = $(this).parent().parent()
											.children().eq(10).text();
									var describle = $(this).parent().parent()
											.children().eq(11).text();

									$("#hid").val(hid);
									$("#hname").val(hname);
									$("#areaName").val(areaName);
									$("#price").val(price);
									$("#tel").val(tel);
									$("#haddress").val(haddress);
									$("#describle").val(describle);
									$("select#stage").val(stage);
									$("select#hnum").val(hnum);
									$("img#pic").attr("src", pic);

								})

					});
		})
	</script>
</body>
</html>