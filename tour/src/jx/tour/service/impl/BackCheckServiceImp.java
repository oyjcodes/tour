package jx.tour.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.ManagerMapper;
import jx.tour.pojo.Manager;
import jx.tour.service.BackCheckService;

@Service
public class BackCheckServiceImp implements BackCheckService {
@Autowired
private ManagerMapper managerMapper;
	@Override
	public int checkLogin(Manager manager) {
		int flag = 0;
		String usernum = manager.getUsernum();
		int password = manager.getPassword();  
		Manager user = managerMapper.selectByPrimaryKey(usernum);
		if(user!=null){ 
			if(user.getPassword() == password){
				flag = 1;//登录成功  
			}else{
				flag = 2;//密码错误，请重新输入    
			}
		}
		else{  
			flag = 3;//账号输入错误         
		}
		
		return flag;   
	}

}
