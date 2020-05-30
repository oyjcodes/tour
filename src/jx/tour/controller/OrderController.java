package jx.tour.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.Order;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtycommentVo;
import jx.tour.pojo.User;
import jx.tour.pojo.Userorder;
import jx.tour.pojo.UserorderVo;
import jx.tour.service.HotelService;
import jx.tour.service.OrderService;
import jx.tour.service.ScenicService;
import jx.tour.service.SpecialtyService;
import jx.tour.utils.OrderFactory;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private SpecialtyService specialtyService;
	//提交特产订单
	@RequestMapping("/giveOrder")
	public String giveOrder(Model model,Order order){
		double price = order.getTprice();
		int num = order.getQty_item_1();    
		double total = price*num;
		order.setTotal(total);
		order.setOrderTime(new Date());
		order.setOrderId(OrderFactory.getOrderIdByTime());
		model.addAttribute("order", order);
		return "order";      
	}
	@RequestMapping(value="/giveMoney",method=RequestMethod.POST)
	public String giveMoney(Model model,UserorderVo order,HttpSession session){
		 order.setTime(new Date());
		 User user =  (User) session.getAttribute("user");
		 if(user!=null){
			 //插入用户的订单
			 orderService.insertOrder(order);
			 //得到该订单商品所在的库存信息
			 int num = (order.getAllnum()) -(order.getTnum());
			 order.setAllnum(num);
			 /* System.out.println("剩下数量："+num+"商品id="+order.getPid()); */
			 //减少相应的库存
			 orderService.updateNum(order);
			 //查询该用户的订单信息
			 List<UserorderVo> orderList =  orderService.findAllOrder(order);
			 model.addAttribute("orderList", orderList);
			 return "project_order";  
		 }  
		 else{
			 return "redirect:/check/toLogin";
		 }
	}
	//删除商品订单
	@RequestMapping("/deleteOrder")
	public String deleteOrder(Model model,UserorderVo order){
		 //删除订单
		 orderService.delete(order);
		 //查询订单
		 List<UserorderVo> orderList =  orderService.findAllOrder(order);
		 model.addAttribute("orderList", orderList);
		 return "project_order";
	}
	//查询我的订单
	@RequestMapping("/getOrder")
	public String getOrder(Model model,UserorderVo order){
		 //查询订单
		 List<UserorderVo> orderList =  orderService.findAllOrder(order);
		 model.addAttribute("orderList", orderList);
		 return "project_order";
	}
}