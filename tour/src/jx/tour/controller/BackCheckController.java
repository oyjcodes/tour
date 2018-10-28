package jx.tour.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jx.tour.pojo.Manager;
import jx.tour.service.BackCheckService;
import jx.tour.service.UserService;
@Controller
@RequestMapping("/backCheck")
public class BackCheckController {
@Autowired
private BackCheckService backCheckService;
@Autowired
private UserService userService;
	@RequestMapping("/loginCheck")
	public String loginCheck(Model model,HttpSession session,Manager manager){
		int result = backCheckService.checkLogin(manager);
		if(result ==1){
			session.setAttribute("manager",manager);
			return "admin/index";
		}  
		else if(result ==2){
			model.addAttribute("error", "密码错误");
			return "redirect:/admin";  
		}
		else{
			model.addAttribute("error", "账号错误");
			return "redirect:/admin";
		}
	}
	// 退出
		@RequestMapping("/logout")
		public String logout(HttpSession session) throws Exception {

			// 清除session
			session.invalidate();

			// 重定向到主页页面
			return "redirect:/admin";
		}
		
		
		@RequestMapping("/editManager")
		public String editManager(Model model,Manager manager){
			userService.editManager(manager);
			return "redirect:/admin";
		}
		
}
