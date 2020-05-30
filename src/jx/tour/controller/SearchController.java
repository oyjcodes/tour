package jx.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.pojo.Ads;
import jx.tour.pojo.Content;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.Information;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.ScenicVo;
import jx.tour.pojo.Search;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.AreaService;
import jx.tour.service.HotelService;
import jx.tour.service.IndexService;
import jx.tour.service.InformationService;
import jx.tour.service.ScenicService;
import jx.tour.service.SpecialtyService;
import jx.tour.service.TravelsService;
import jx.tour.utils.PageUtils;

//搜索框响应信息
@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private TravelsService travelsService;
	@Autowired
	private InformationService informationService;
	@Autowired
	private PageUtils pageUtils;
	//打开前台首页
	@RequestMapping(value="/getMessage",method=RequestMethod.POST)
	public String getMessage(Model model,Search search,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page) {
		String classId = search.getClassid();
		String result = null;
		if(classId.equals("0")){
			 
			//引入分页查询，使用PageHelper分页功能  
		    //在查询之前传入当前页，然后多少记录   
		    PageHelper.startPage(page,5);      
		    //startPage后紧跟的这个查询就是分页查询  
		    List<Scenic> list = scenicService.getScenicByName(search);

		    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
		    PageInfo<Scenic> pageInfo = new PageInfo<>(list,5);  
		    pageUtils.setTotal(pageInfo.getTotal());
		    pageUtils.setPageNum(pageInfo.getPages());
		    pageUtils.setCurrentPageNum(page);
		    pageUtils.setBackPageNum(pageInfo.getPrePage());      
		    pageUtils.setNextPageNum(pageInfo.getNextPage());
		    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
		    model.addAttribute("pageInfo",pageInfo);  
		    model.addAttribute("pageUtils", pageUtils);  
			
			  
			List<Scenic> scenics = scenicService.getScenics();
			model.addAttribute("scenics", scenics);
			List<Specialty> specialties = specialtyService.getSomeSpecialty();
			model.addAttribute("specialties", specialties);
			List<Hotel> hotels = hotelService.getSomeHotels();
			model.addAttribute("hotels", hotels);
			result =  "scenic_show";
		}
		 
		if(classId.equals("1")){
			
			//引入分页查询，使用PageHelper分页功能  
		    //在查询之前传入当前页，然后多少记录   
		    PageHelper.startPage(page,5);      
		    //startPage后紧跟的这个查询就是分页查询  
		    List<Specialty> list = specialtyService.getSpecialtyByName(search);

		    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
		    PageInfo<Specialty> pageInfo = new PageInfo<>(list,5);  
		    pageUtils.setTotal(pageInfo.getTotal());
		    pageUtils.setPageNum(pageInfo.getPages());
		    pageUtils.setCurrentPageNum(page);
		    pageUtils.setBackPageNum(pageInfo.getPrePage());      
		    pageUtils.setNextPageNum(pageInfo.getNextPage());
		    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
		    model.addAttribute("pageInfo",pageInfo);  
		    model.addAttribute("pageUtils", pageUtils);  
			
			
			
 
			 
			//在边框出显示其他的风景（玩在江西）、特产（吃在江西）、酒店（住在江西）
			List<Scenic> scenics = scenicService.getScenics();
			model.addAttribute("scenics", scenics);
			//随机得到三个特产
			List<Specialty> specialties = specialtyService.getSomeSpecialty();
			model.addAttribute("specialties", specialties);
			//随机得到三个酒店
			List<Hotel> hotels = hotelService.getSomeHotels();
			model.addAttribute("hotels", hotels);
			result =  "mall_list";
		}
		if(classId.equals("2")){
			
			//引入分页查询，使用PageHelper分页功能  
		    //在查询之前传入当前页，然后多少记录   
		    PageHelper.startPage(page,4);      
		    //startPage后紧跟的这个查询就是分页查询  
		    List<TravelsVo> list = travelsService.getTravelsByName(search);
		    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
		    PageInfo<TravelsVo> pageInfo = new PageInfo<>(list,4);    
		    pageUtils.setTotal(pageInfo.getTotal());
		    pageUtils.setPageNum(pageInfo.getPages());
		    pageUtils.setCurrentPageNum(page);
		    pageUtils.setBackPageNum(pageInfo.getPrePage());      
		    pageUtils.setNextPageNum(pageInfo.getNextPage());
		    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
		    model.addAttribute("pageInfo",pageInfo);  
		    model.addAttribute("pageUtils", pageUtils);  
			
		 
			result = "note_list";
		}
		if(classId.equals("3")){
			
			//引入分页查询，使用PageHelper分页功能  
		    //在查询之前传入当前页，然后多少记录   
		    PageHelper.startPage(page,5);      
		    //startPage后紧跟的这个查询就是分页查询  
		    List<Information> list = informationService.getInformationByTitle(search);
		    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
		    PageInfo<Information> pageInfo = new PageInfo<>(list,5);  
		    pageUtils.setTotal(pageInfo.getTotal());
		    pageUtils.setPageNum(pageInfo.getPages());
		    pageUtils.setCurrentPageNum(page);
		    pageUtils.setBackPageNum(pageInfo.getPrePage());      
		    pageUtils.setNextPageNum(pageInfo.getNextPage());
		    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
		    model.addAttribute("pageInfo",pageInfo);  
		    model.addAttribute("pageUtils", pageUtils);  
			
			
			
			
			 
			// 在边框出显示其他的风景（玩在江西）、特产（吃在江西）、酒店（住在江西）
			List<Scenic> scenics = scenicService.getScenics();
			model.addAttribute("scenics", scenics);

			// 随机得到三个特产
			List<Specialty> specialties = specialtyService.getSomeSpecialty();
			model.addAttribute("specialties", specialties);
			// 随机得到三个酒店
			List<Hotel> hotels = hotelService.getSomeHotels();
			model.addAttribute("hotels", hotels);
			result =  "news_list";
		}
		return result;
		
	}
}
	
