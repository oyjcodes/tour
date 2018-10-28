package jx.tour.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtycommentVo;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.HotelService;
import jx.tour.service.OrderService;
import jx.tour.service.ScenicService;
import jx.tour.service.SpecialtyService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/specialty")
public class SpecialtyController {
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private PageUtils pageUtils;

	// 根据特产id得到具体的特产信息、评价
	@RequestMapping("/getSpecialty")
	public String getSpecialty(Model model, int tnum,@RequestParam(value = "id") int specialty_id) throws Exception {		
		Specialty specialty = specialtyService.getSpecialty(specialty_id);
		List<ScenicComment> specialtyCommnet = specialtyService.getSpecialtyComment(specialty_id);
		List<Specialty> specialties = specialtyService.getOtherSpecialty(tnum,specialty_id);
		model.addAttribute("specialty", specialty);
		model.addAttribute("specialtyCommnet", specialtyCommnet);
		model.addAttribute("specialties", specialties);
		return "project";
	}

	// 得到所有的特产信息在特产商城显示
	@RequestMapping("/getAllSpecialty")
	public String getAllSpecialty(Model model,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page) throws Exception {
		
		//引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,10);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<Specialty> list = specialtyService.getAllSpecialty();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
	    PageInfo<Specialty> pageInfo = new PageInfo<>(list,10);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    model.addAttribute("pageInfo",pageInfo);  
	    model.addAttribute("pageUtils",pageUtils);  
		
		
		
		//在边框出显示其他的风景（玩在江西）、特产（吃在江西）、酒店（住在江西）
		List<Scenic> scenics = scenicService.getScenics();
		model.addAttribute("scenics", scenics);
		
		//随机得到三个特产
		List<Specialty> specialties = specialtyService.getSomeSpecialty();
		model.addAttribute("specialties", specialties);
		//随机得到三个酒店
		List<Hotel> hotels = hotelService.getSomeHotels();
		model.addAttribute("hotels", hotels);
		return "mall_list";

	}
	
	//发表特产评论
	@RequestMapping("/publishSpecialtyComment")
	public String  publishSpecialtyComment(Model model,SpecialtycommentVo specialtycommentVo){
		int tnum = specialtycommentVo.getAreanum();//区域
		int specialty_id = specialtycommentVo.getTnum();//景点id
		specialtycommentVo.setPtime(new Date());
		specialtyService.publishSpecialtyComment(specialtycommentVo);
		return "redirect:/specialty/getSpecialty?tnum="+tnum+"&id="+specialty_id+"";
	}
}