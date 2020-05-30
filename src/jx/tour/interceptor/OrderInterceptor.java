package jx.tour.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jx.tour.pojo.Order;
import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;

/**
 * 
 * <p>Description:登陆认证拦截器 </p>
 */
public class OrderInterceptor implements HandlerInterceptor {
@Autowired
private Order order;
 
	
	//进入 Handler方法之前执行
	//用于身份认证、身份授权
	//比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.err.println("进入------------------");  
		//判断session
		HttpSession session  = request.getSession();
		//从session中取出用户身份信息
		UserWithBLOBs user = (UserWithBLOBs) session.getAttribute("user");
		
		if(user != null){
			//身份存在，放行
			return true;
		}
		
		String goUrl =  request.getRequestURI().substring(6);
		session.setAttribute("goUrl",goUrl);    
		int id = Integer.parseInt((String)request.getParameter("id")); //单价
		String qty_item_1 = (String) request.getParameter("qty_item_1"); //购买数量 
		int num = Integer.parseInt(qty_item_1);
		String tpic = (String) request.getParameter("tpic"); //图片
		String tprice = (String) request.getParameter("tprice"); //单价
		String tname = (String) request.getParameter("tname"); //单价
		double price = Double.parseDouble(tprice);
		double total  =num*price; //总价      
		order.setTotal(total);
		order.setQty_item_1(num);     
		order.setTpic(tpic);
		order.setTprice(price);  
		order.setId(id);
		order.setTname(tname); 
		session.setAttribute("order", order);       
		/*System.err.println("购买"+qty_item_1);    
		System.err.println("图片"+tpic);    
		System.err.println("单价"+tprice);    
		System.err.println("总价"+total);      */   
		
		//结算前用户还未登录，则需要跳转到登陆页面进行登录 
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);     
		
		//return false表示拦截，不向下执行
		//return true表示放行    
		return false;        
	}

	//进入Handler方法之后，返回modelAndView之前执行
	//应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	    System.out.println("进入买单controller");  
		
	}

	//执行Handler完成执行此方法
	//应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		 
	}

}
