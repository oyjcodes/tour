package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.HComment;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.SpecialtycommentVo;
import jx.tour.pojo.TravelCommentVo;
import jx.tour.service.BackCommentService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backComment")
// 查询所有的风景
public class BackCommentController {
@Autowired
private PageUtils pageUtils;
@Autowired
private BackCommentService  backCommentService;
	@RequestMapping("/getScenicComment")
	public String getScenicComment(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<ScenicComment> list = backCommentService.getAllScenicComment();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<ScenicComment> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/scenicComment";       

	}

	// 审核通过风景评论
	@RequestMapping("/passScenicComment")
	public String passScenicComment(Model model,int cid) {
		backCommentService.passScenicComment(cid);
		return "redirect:/backComment/getScenicComment";  

	}

	// 审核通过风景评论
	@RequestMapping("/rejectScenicComment")
	public String rejectScenicComment(Model model,int cid) {
		backCommentService.rejectScenicComment(cid);
		return "redirect:/backComment/getScenicComment";
	}
	
	@RequestMapping("/getSpecialtyComment")
	public String getSpecialtyComment(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<SpecialtycommentVo> list = backCommentService.getAllSpecialtyComment();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<SpecialtycommentVo> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/specialtyComment";       

	}

	// 审核通过风景评论
	@RequestMapping("/passSpecialtyComment")
	public String passSpecialtyComment(Model model,int id) {
		backCommentService.passSpecialtyComment(id);
		return "redirect:/backComment/getSpecialtyComment";  

	}
	// 审核通过风景评论
	@RequestMapping("/rejectSpecialtyComment")
	public String rejectSpecialtyComment(Model model,int id) {
		backCommentService.rejectSpecialtyComment(id);
		return "redirect:/backComment/getSpecialtyComment";  
	}
	
	
	
	@RequestMapping("/getHotelComment")
	public String getHotelComment(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<HComment> list = backCommentService.getAllHotelCommnet();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<HComment> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/hotelComment";       

	}

	// 审核通过风景评论
	@RequestMapping("/passHotelComment")
	public String passHotelComment(Model model,int id) {
		backCommentService.passHotelComment(id);
		return "redirect:/backComment/getHotelComment";  

	}
	// 审核通过风景评论
	@RequestMapping("/rejectHotelComment")
	public String rejectHotelComment(Model model,int id) {
		backCommentService.rejectHotelComment(id);
		return "redirect:/backComment/getHotelComment";   
	}
	
	
	
	
	
	
	@RequestMapping("/getTravelsComment")
	public String getTravelsComment(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<TravelCommentVo> list = backCommentService.getAllTravelsComment();
        for(TravelCommentVo s:list){
        	System.out.println("pic1========="+s.getPic1());   
        }
	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<TravelCommentVo> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/travelsComment";       

	}

	// 审核通过风景评论
	@RequestMapping("/passTravelsComment")
	public String passTravelsComment(Model model,int id) {
		backCommentService.passTravelsComment(id);
		return "redirect:/backComment/getTravelsComment";  

	}
	// 审核通过风景评论
	@RequestMapping("/rejectTravelsComment")
	public String rejectTravelsComment(Model model,int id) {
		backCommentService.rejectTravelsCommment(id);				
		return "redirect:/backComment/getTravelsComment";  
	}
}
