package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.mapper.HotelRecommendMapper;
import jx.tour.mapper.ScenicCommentMapper;
import jx.tour.mapper.SpecialtyCommentMapper;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.Information;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Specialty;
import jx.tour.service.AreaService;
import jx.tour.service.HotelService;
import jx.tour.service.IndexService;
import jx.tour.service.InformationService;
import jx.tour.service.ScenicService;
import jx.tour.service.SpecialtyService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/information")
public class InformationController {
	@Autowired
	private InformationService informationService;
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private PageUtils pageUtils;

	@RequestMapping("/getInformation")
	// @RequestParam里边指定request传入参数名称和形参进行绑定。
	// 通过required属性指定参数是否必须要传入
	// 通过defaultValue可以设置默认值，如果id参数没有传入，将默认值和形参绑定。
	public String getScenic(Model model, @RequestParam(value = "id") Integer information_id) throws Exception {
		Information information = informationService.getInformation(information_id);
		model.addAttribute("information", information);
		List<Information> informationsList = informationService.getOtherInformations(information_id);
		model.addAttribute("informationsList", informationsList);
		return "information";
	}

	@RequestMapping("/getALLInformations")
	public String getALLInformations(Model model,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page) {
		
		//引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,10);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<Information> list = informationService.getALLInformations();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
	    PageInfo<Information> pageInfo = new PageInfo<>(list,10);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    model.addAttribute("pageInfo",pageInfo);  
	    model.addAttribute("pageUtils",pageUtils);  
		 
		// 在边框出显示其他的风景（玩在江西）、特产（吃在江西）、酒店（住在江西）
		List<Scenic> scenics = scenicService.getScenics();
		model.addAttribute("scenics", scenics);

		// 随机得到三个特产
		List<Specialty> specialties = specialtyService.getSomeSpecialty();
		model.addAttribute("specialties", specialties);
		// 随机得到三个酒店
		List<Hotel> hotels = hotelService.getSomeHotels();
		model.addAttribute("hotels", hotels);
		return "news_list";

	}

}