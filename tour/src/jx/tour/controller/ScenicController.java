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
import jx.tour.pojo.Sccomment;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.AreaService;
import jx.tour.service.HotelService;
import jx.tour.service.IndexService;
import jx.tour.service.ScenicService;
import jx.tour.service.SpecialtyService;
import jx.tour.utils.PageUtils;
@Controller
@RequestMapping("/scenic")
public class ScenicController {
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private PageUtils pageUtils;
	@RequestMapping("/getScenic")
	// @RequestParam里边指定request传入参数名称和形参进行绑定。
	// 通过required属性指定参数是否必须要传入
	// 通过defaultValue可以设置默认值，如果id参数没有传入，将默认值和形参绑定。
	public String getScenic(Model model,@RequestParam(value = "id") Integer scenic_id,int scenicnum)
			throws Exception {
		// 调用service根据图片id查询风景信息
		Scenic scenic = scenicService.getScenic(scenic_id);
		model.addAttribute("scenic", scenic);
		List<ScenicComment> scenicComment = scenicService.getScenicComment(scenic_id);
		model.addAttribute("scenicComment", scenicComment);
		List<Specialty> specialties = areaService.getSomeSpecialty(scenicnum);
		model.addAttribute("someSpecialtyList", specialties);
		List<Hotel> hotels =  areaService.getSomHotels(scenicnum);
		model.addAttribute("someHotelList", hotels);
		
		return "scenic";
	}
    @RequestMapping("/getIndexScenic")
	public String getIndexScenic(Model model,@RequestParam(value = "id") Integer scenic_id)
			throws Exception {
		// 调用service根据图片id查询风景信息
		Scenic scenic = scenicService.getScenic(scenic_id);
		model.addAttribute("scenic", scenic);
		List<ScenicComment> scenicComment = scenicService.getScenicComment(scenic_id);
		model.addAttribute("scenicComment", scenicComment);
		List<Specialty> specialties = areaService.getSomeSpecialty(scenic.getScenicnum());
		model.addAttribute("someSpecialtyList", specialties);
		List<Hotel> hotels =  areaService.getSomHotels(scenic.getScenicnum());
		model.addAttribute("someHotelList", hotels);
		return "scenic";
	}
    @RequestMapping("/getSomeScenic")
    public String getSomeScenic(Model model,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page){
    	

		//引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,6);      
	    //startPage后紧跟的这个查询就是分页查询  
		List<Scenic> list =  scenicService.getSomeScenics();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
	    PageInfo<Scenic> pageInfo = new PageInfo<>(list,6);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    model.addAttribute("pageInfo",pageInfo);  
	    model.addAttribute("pageUtils",pageUtils);  
	    
    	List<Scenic> scenics = scenicService.getScenics();
		model.addAttribute("scenics", scenics);
		List<Specialty> specialties = specialtyService.getSomeSpecialty();
		model.addAttribute("specialties", specialties);
		List<Hotel> hotels = hotelService.getSomeHotels();
		model.addAttribute("hotels", hotels);
    	return "scenic_show";
    }
    @RequestMapping("/scenicComment")
    public String sccomment(Model model,ScenicComment sccomment){
    	//风景编号
    	Integer scenicId = sccomment.getSecenynum();
    	//区域编号
    	int scenicnum= sccomment.getScenicNum();
    	/*System.out.println("用户编号："+sccomment.getUsernum()+"评论内容="+sccomment.getContent()); 
    	System.out.println("风景编号："+scenicId+"区域编号="+scenicnum);  */
    	scenicService.publishScenicComment(sccomment);    
    	return "redirect:/scenic/getScenic?id="+scenicId+"&scenicnum="+scenicnum+"";
    }
}