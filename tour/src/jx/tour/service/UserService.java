package jx.tour.service;
import java.util.List;

import jx.tour.pojo.Manager;
import jx.tour.pojo.PasswordVo;
import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;

public interface UserService {
	    //我的信息查询显示
		public UserWithBLOBs searchUserMessage(UserWithBLOBs user);
		//根据用户id信息查询显示
		public UserWithBLOBs getUserMessage(User user);
		//我的信息更新显示
		public int updateUserText(UserWithBLOBs user);
		//修改密码
		public int updatePassword(PasswordVo passwordVo);
	    //更新用户头像
		public void updateUserImage(User user);
		
		/*后台*/
		//查询所有的用户信息
		public List<UserWithBLOBs> getAllUsers();
		//限制用户
		public void downUser(int userid);
		//解绑用户
		public void upUser(int userid);
		
		//查询当前登录的管理员信息
		public Manager getManager(int usernum);
		//修改管理员信息
		public void editManager(Manager manager);
		
	
}
