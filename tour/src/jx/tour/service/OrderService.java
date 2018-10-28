package jx.tour.service;
import java.util.List;

import jx.tour.pojo.OrderVo;
import jx.tour.pojo.Userorder;
import jx.tour.pojo.UserorderVo;

public interface OrderService {
	 //用户订单插入
	 public void insertOrder(Userorder order);
	 //相应的库存商品数量减少购买的值
	 public void updateNum(UserorderVo userorder);
	 //根据用户的id查询用户的所有订单信息
	 public List<UserorderVo> findAllOrder(UserorderVo userorder);
	 //删除某一个订单
	 public void delete(UserorderVo order);
	 
	 
	//查询所有的订单
    public List<OrderVo> getAllorderVo();
}
