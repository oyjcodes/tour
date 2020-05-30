<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    <title>确认订单</title>
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

<!-------------------版头------------------->
 <%@include file="/WEB-INF/jsp/my_commons/mhead.jsp"%>  
<!-----------------确认订单---------------->
<div id="confirm_order">
	<div class="cw1000">	
		<!-----------------订单信息---------------->
		<div class="info_mo">
			<table>
				<tr>
				    <th class="cwt">订单号</th>
					<th class="cwt">商品信息</th>
					<th class="cwt">单价</th>
					<th class="cwt">数量</th>
					<th class="cwt">总价</th>
					<th class="cwt">下单时间</th>
				</tr>
				<tr>
				    <td class="cwt">${order.orderId}</td>
					<td><a href="#"><img class="pic" width=53 height=53 src="/pic/${order.tpic}" />${order.tname}</a></td>
					<td class="cwt">￥${order.tprice}</td>
					<td class="cwt">x${order.qty_item_1}</td>
					<td class="cwt">￥${order.total}</td>
					<td class="cwt"><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</table>
		</div>
		  
		
		<div class="pay_method">
			<img src="images/uui.png" />
		</div>
		<div class="calculation">
		
		<form action="${pageContext.request.contextPath}/order/giveMoney" method="post" >
		    <input type="hidden" name="userid" value="${user.userid}"/>
		    <input type="hidden" name="pid" value="${order.id}" /><!-- 特产id -->
		    <input type="hidden" name="ordernum" value="${order.orderId}" />  
		    <input type="hidden" name="tname" value="${order.tname}" />
		    <input type="hidden" name="tprice" value="${order.tprice}" />     
		    <input type="hidden" name="tnum" value="${order.qty_item_1}"/>
		    <input type="hidden" name="total" value="${order.total}" />  
		    <input type="hidden" name="allnum" value="${order.allnum}"/>  
		    <%-- <input type="hidden" name="time" value="${order.orderTime}"/> --%>  <%-- <fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>  --%>
			<input type="submit" value="结算" />
		</form>  
		
			<span>应付金额： <b>￥${order.total}</b></span>
		</div>
	</div>
	<div class="clear"></div>
</div>
<!-----------------版底---------------->
  	<%@ include file="/WEB-INF/jsp/my_commons/mfoot.jsp"%>
</body>
</html>