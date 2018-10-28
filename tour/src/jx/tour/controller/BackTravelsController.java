package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsWithBLOBs;
import jx.tour.service.BackTravelsService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backTravel")  
public class BackTravelsController {
	@Autowired
	private BackTravelsService backTravelsService;
	@Autowired
	PageUtils pageUtils;

	//得到所有的酒店信息进行分页
	@RequestMapping("/requestAllTravels")
	public String requestAllTravels(@RequestParam(required = false, defaultValue = "1", value = "page") Integer page,
			Model model) {
		// 引入分页查询，使用PageHelper分页功能
		// 在查询之前传入当前页，然后多少记录
		PageHelper.startPage(page, 3);
		// startPage后紧跟的这个查询就是分页查询
		List<TravelsWithBLOBs> list = backTravelsService.getAllTravles();

		// 使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
		PageInfo<TravelsWithBLOBs> pageInfo = new PageInfo<>(list, 3);
		pageUtils.setCurrentPageNum(page);
		//pageINfo封装了分页的详细信息，也可以指定连续显示的页数
		model.addAttribute("pageInfo", pageInfo);
		return "admin/travel";
	}

	@RequestMapping("/pass")
	public String pass(Model model, int id) {
		backTravelsService.pass(id);
		return "redirect:/backTravel/requestAllTravels";
	}
	@RequestMapping("/passSome")
	@ResponseBody
	public List<Travels> passSome(Model model, int ids[]) {
		backTravelsService.passSome(ids); 
		List<Travels> list  =backTravelsService.getPassTravels(ids);
		return list;  
	}
	

	@RequestMapping("/reject")
	public String reject(Model model, int id) {

		backTravelsService.reject(id);

		return "redirect:/backTravel/requestAllTravels";
	}
}
