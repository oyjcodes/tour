package jx.tour.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.stereotype.Service;

import jx.tour.mapper.UserorderMapper;
import jx.tour.mapper.UserorderVoMapper;
import jx.tour.pojo.OrderVo;
import jx.tour.pojo.Userorder;
import jx.tour.pojo.UserorderExample;
import jx.tour.pojo.UserorderVo;
import jx.tour.service.OrderService;

@Service
public class OrderServiceImp implements OrderService {
@Autowired
private UserorderMapper userorderMapper;
@Autowired
private UserorderVoMapper userorderVoMapper;
	@Override
	public void insertOrder(Userorder order) {
		userorderMapper.insert(order);   
		  
	}
	@Override
	public void updateNum(UserorderVo userorderVo) {
		userorderVoMapper.updateNum(userorderVo);
		
	}
	@Override
	public List<UserorderVo> findAllOrder(UserorderVo userorder) {
		List<UserorderVo> orderList = userorderVoMapper.findAllOrders(userorder);
		return orderList;
	}
	@Override
	public void delete(UserorderVo order) {
	  String ordernum = order.getOrdernum();
	  UserorderExample example = new UserorderExample();
	  UserorderExample.Criteria criteria = example.createCriteria();
	  criteria.andOrdernumEqualTo(ordernum);
	  userorderMapper.deleteByExample(example);
	}
	@Override
	public List<OrderVo> getAllorderVo() {
		List<OrderVo> list = userorderVoMapper.getAllorderVo();
		return list;
	}       
	

}
