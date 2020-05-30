package jx.tour.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jx.tour.pojo.User;
import jx.tour.pojo.UserWithBLOBs;
import jx.tour.service.CheckService;

@Controller
@RequestMapping("/check")
public class CheckController {
	@Autowired
	private CheckService checkService;

	// 跳转到登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}
	// 跳转到注册页面
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}
	//进行注册
	@RequestMapping("/register")
	public String register(Model model,HttpSession session,@ModelAttribute("user")UserWithBLOBs user){
		int result = checkService.register(user);
		if(result==0){
			model.addAttribute("userIdExiterror","该账号已存在，请重新输入");
			return "register";
		}
		else{
			session.setAttribute("user", user);
			// 重定向到首页面
			return "redirect:/";
		}
			
		
	}

	// 登陆
	@RequestMapping("/login")
	public String login(Model model,HttpSession session, UserWithBLOBs user) throws Exception {
		int userId = user.getUserid();
		String password = user.getPassword();
		String result = "";
		// 调用service进行用户身份验证
		UserWithBLOBs existUser = checkService.checkLogin(userId, password);
		if (existUser!=null) {
			if(existUser.getStage()==1){
				session.setAttribute("user", existUser);
				// 重定向到首页面
				result = "redirect:/";
				 
			}
			if(existUser.getStage()==0){
				model.addAttribute("errorMessage","该账号被限制，请申请解除限制"); 
				result="login";
			}
			
		}
		else {
			model.addAttribute("errorMessage","登录名和密码错误，请重新输入");
			result="login";
		}
		return result;
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {

		// 清除session
		session.invalidate();

		// 重定向到主页页面
		return "redirect:/";
	}

}
