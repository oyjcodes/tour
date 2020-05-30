package jx.tour.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.ManagerMapper;
import jx.tour.mapper.UserMapper;
import jx.tour.mapper.UserVoMapper;
import jx.tour.pojo.Manager;
import jx.tour.pojo.PasswordVo;
import jx.tour.pojo.User;
import jx.tour.pojo.UserExample;
import jx.tour.pojo.UserWithBLOBs;
import jx.tour.service.UserService;

@Service
public class UserServiceImpl implements UserService {
@Autowired
private UserMapper userMapper;
@Autowired
private UserVoMapper userVoMapper;
@Autowired
private ManagerMapper managerMapper;
	@Override
	public UserWithBLOBs searchUserMessage(UserWithBLOBs user) {
		UserWithBLOBs exitUser = userMapper.selectByPrimaryKey(user.getUserid());
		return exitUser;
	}
	@Override
	//我的信息更新显示
	public int updateUserText(UserWithBLOBs user) {
		int result = 1;
		try {
			userVoMapper.updateBaseInformation(user);
		} catch (Exception e) {
			result = 0;
		}
		return result;
	}
	@Override
	public int updatePassword(PasswordVo passwordVo) {
		//输入的原始密码错误
		int result = 1;
		String password = passwordVo.getPassword();
		String password1= passwordVo.getPassword1();
		String password2 = passwordVo.getPassword2();
		String password3 = passwordVo.getPassword3();
		//输入的密码与原始密码不相等
		if(!password.equals(password1)){
			result = 2;
			return result;
		} 
		//输入的新密码与原密码相等
		else if(password2.equals(password)){
			result = 3;
			return result;
		}
		//两次输入的密码值不相等
		else if(!password2.equals(password3)){
			result = 4;
			return result;
		}
		else{
			userVoMapper.updatePassword(passwordVo);
			return result;
		}
		
	}
	@Override
	public void updateUserImage(User user) {
		userVoMapper.updateUserImage(user);
	}
	@Override
	public UserWithBLOBs getUserMessage(User user) {
		UserWithBLOBs exitUser = userMapper.selectByPrimaryKey(user.getUserid());
		return exitUser;
	}
	@Override
	public List<UserWithBLOBs> getAllUsers() {
		UserExample userExample = new UserExample();
		UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andUseridIsNotNull();
		List<UserWithBLOBs> list = userMapper.selectByExampleWithBLOBs(userExample);
		return list;
	}
	@Override
	public void downUser(int userid) {
		userVoMapper.downUser(userid);
		
	}
	@Override
	public void upUser(int userid) {
		userVoMapper.upUser(userid);
		
	}
	@Override
	public Manager getManager(int usernum) {
		Manager manager = managerMapper.selectByPrimaryKey(usernum);
		return manager;
	}
	@Override
	public void editManager(Manager manager) {
		managerMapper.updateByPrimaryKey(manager);
		
	}
}
