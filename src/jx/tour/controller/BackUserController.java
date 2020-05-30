package jx.tour.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

 
import jx.tour.pojo.Manager;
import jx.tour.pojo.UserWithBLOBs;
import jx.tour.service.UserService;
import jx.tour.utils.PageUtils;
 

@Controller
@RequestMapping("/backUser")
public class BackUserController {   
	@Autowired
	private UserService userService;
	@Autowired
	private PageUtils pageUtils;
	@RequestMapping("/getAllUser")
	public String getAllUser(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<UserWithBLOBs> list = userService.getAllUsers();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<UserWithBLOBs> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
		return "admin/user";
	}
	@RequestMapping("/upUser")
	public String upUser(Model modle,int userid){
	   userService.upUser(userid);
	   return "redirect:/backUser/getAllUser" ;
	    
	}
	@RequestMapping("/downUser")
	public String downUser(Model modle,int userid){
	   userService.downUser(userid);
	   return "redirect:/backUser/getAllUser" ;  
	    
	}
	
	//得到当前登录的管理员信息
	@RequestMapping("/getManager")
	@ResponseBody
	public Manager getManager(Model model,HttpSession session){
		Manager manager = (Manager)session.getAttribute("manager");
		int usernum = manager.getUsernum();
		Manager exitManager = userService.getManager(usernum);
		return exitManager;
	}
	
}
