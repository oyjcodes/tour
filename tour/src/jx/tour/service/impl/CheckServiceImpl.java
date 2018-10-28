package jx.tour.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.UserMapper;
import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;
import jx.tour.service.CheckService;

@Service
public class CheckServiceImpl implements CheckService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public UserWithBLOBs checkLogin(int userId, String password) {
		
		UserWithBLOBs user = userMapper.selectByPrimaryKey(userId);
		if (user!=null&&user.getPassword().equals(password)) {
			return user;
		}
		else
			return null;
	}

	@Override   
	public int register(UserWithBLOBs user) {
		int result = 1;
		User exitUser = userMapper.selectByPrimaryKey(user.getUserid());
		if(exitUser!=null){
			result = 0;
		}
		else{
			user.setUserimag("user/newuser.png");
			 userMapper.insert(user);
		}
		return result;
	}
}
