package jx.tour.mapper;


import jx.tour.pojo.PasswordVo;
import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;

public interface UserVoMapper {
	 //更新用户昵称、地址、签名等数据
	public void updateBaseInformation(UserWithBLOBs user);
	//修改密码
	public void updatePassword(PasswordVo passwordVo);
	//更新用户头像
	public void updateUserImage(User user);
	/*后台*/
	//限制用户
	public void downUser(int userid);
	//解绑用户
	public void upUser(int userid);
	
		
	 
}