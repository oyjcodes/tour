package jx.tour.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jx.tour.mapper.UserMapper;
import jx.tour.pojo.PasswordVo;
import jx.tour.pojo.User;
import jx.tour.pojo.UserExample;
import jx.tour.pojo.UserWithBLOBs;
import jx.tour.service.UploadFileService;
import jx.tour.service.UserService;
@Controller
@RequestMapping("/getUser")
public class UserupdateController {
	@Autowired
	private UserService userService;
	@Autowired
	private UploadFileService uploadService;
	//我的信息显示
	@RequestMapping("/my_info")
	public String my_info(Model model)throws Exception {
		return "my_info"; 
	}
	//修改密码显示
	@RequestMapping("/security")
	public String security(Model model)throws Exception {
		return "security";
	}
	//我的头像显示
	@RequestMapping("/my_head")
	public String my_head(Model model)throws Exception {
		return "my_head";
	}
	//修改昵称、地址、签名
	@RequestMapping("/updateText")
	public String updateText(Model model,@ModelAttribute("user")UserWithBLOBs user,HttpSession session)throws Exception {
		int i = userService.updateUserText(user);
		UserWithBLOBs newUser = userService.searchUserMessage(user);
		session.setAttribute("user",newUser);
		return "redirect:/getUser/my_info";    
	}
	//修改密码
	@RequestMapping("/updatePassword")
	public String updatePassword(Model model,PasswordVo passwordVo,HttpSession session){
		int result = userService.updatePassword(passwordVo);
		// 输入的密码与原始密码不相等
		if (result == 2) {
			 model.addAttribute("passwoedError1","与原始密码不相等");
		}
		// 输入的新密码与原密码相等
		else if (result == 3) {
			 model.addAttribute("passwoedError2","与原始密码一致");
		}
		// 两次输入的密码值不相等
		else if (result == 4) {
			model.addAttribute("passwoedError3","两次输入的密码值不相等");
		}
		else{
			model.addAttribute("success","密码修改成功，请重新登录！！");
			session.invalidate();
		}
		return "security";
	}
	@RequestMapping("/updateImage")
	public String updateImage(Model model,@RequestParam("file") MultipartFile file,User user,HttpSession session)throws Exception{
		String picPath = uploadService.uploadUserImag(file);
		user.setUserimag(picPath);   
		userService.updateUserImage(user);
		UserWithBLOBs exitUser = userService.getUserMessage(user);
		session.setAttribute("user",exitUser);   
		return "my_head";  
	}   
	@RequestMapping("/tospeak_list")
	public String tospeak_list(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "speak_list";
	}
	@RequestMapping("/project_order")
	public String project_order(Model model)throws Exception {
		return "project_order";
	}
	@RequestMapping("/my_note")
	public String my_note(Model model)throws Exception {
		return "my_note";
	}
	@RequestMapping("/my_index")
	public String my_index(Model model)throws Exception {
		return "my_index";
	}
}
