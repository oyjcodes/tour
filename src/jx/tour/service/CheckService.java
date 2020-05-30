package jx.tour.service;

import java.util.List;

import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;

public interface CheckService {
  //进行登录验证
	public UserWithBLOBs checkLogin(int userId,String password);
  //注册功能
	public int register(UserWithBLOBs user);
 
}
