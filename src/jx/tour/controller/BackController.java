package jx.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackController {
	//展示后台主界面
	@RequestMapping("/admin")
		public String showIndexPage() {
			return "admin/login";   
	}
	//展示后台其它页面
   @RequestMapping("/{page}")
	public String showPage(@PathVariable String page) {
		return "admin/"+page; 
	}
}
