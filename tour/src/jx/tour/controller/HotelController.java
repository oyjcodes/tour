package jx.tour.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.mapper.HotelRecommendMapper;
import jx.tour.mapper.ScenicCommentMapper;
import jx.tour.mapper.SpecialtyCommentMapper;
import jx.tour.pojo.HComment;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.HotelWithBLOBs;
import jx.tour.pojo.Hotelcomment;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.Specialty;
import jx.tour.service.HotelService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private ScenicCommentMapper scenicCommentMapper;
	@Autowired
	private SpecialtyCommentMapper specialtyCommentMapper;
	@Autowired
	private HotelRecommendMapper hotelRecommendMapper;
	@Autowired
	private PageUtils pageUtils;
//根据特产id得到具体的酒店信息、评价以及相关的信息
@RequestMapping("/getHotel")
public String getHotel(Model model,int hnum,int hid)
			throws Exception {
		Hotel hotel = hotelService.getHotel(hid);
		List<Hotel> otherHotelList = hotelService.getOtherHotel(hnum, hid);
		List<HComment> hotelcomments = hotelService.getHotelComment(hid);
		model.addAttribute("hotel", hotel);
		model.addAttribute("otherHotelList", otherHotelList);
		model.addAttribute("hotelcomments",hotelcomments);
		return "hotel";
 }
@RequestMapping("/getAllHotel")
public String getAllHotelotel(Model model,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page)
			throws Exception {
	List<Scenic> scenics = scenicCommentMapper.getScenic();
	model.addAttribute("scenics", scenics);
	List<Specialty> specialties = specialtyCommentMapper.getSpecialty();
	model.addAttribute("specialties", specialties);
	
	//引入分页查询，使用PageHelper分页功能  
    //在查询之前传入当前页，然后多少记录   
    PageHelper.startPage(page,10);      
    //startPage后紧跟的这个查询就是分页查询  
    List<HotelWithBLOBs> list = hotelService.getAllHotels();

    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
    PageInfo<HotelWithBLOBs> pageInfo = new PageInfo<>(list,10);  
    pageUtils.setCurrentPageNum(page);
    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
    model.addAttribute("pageInfo",pageInfo);  
    model.addAttribute("pageUtils",pageUtils);  
	
	 
	
	
	List<Hotel> hotels = hotelService.getSomeHotels();
	model.addAttribute("hotels", hotels);
	return "hotel_show";   
 }
@RequestMapping("/giveHotelComment")
@ResponseBody  
public List<HComment> giveHotelComment(Model mdoel,Hotelcomment hotelcomment){
	System.out.println("-----------------------------------");  
	hotelcomment.setPtime(new Date());
	//保存评论信息
	hotelService.saveHotelComment(hotelcomment);
	//查询该酒店的所有评论信息
	int hid = hotelcomment.getHid();
	List<HComment> hComment = hotelService.getHotelComment(hid);
	return hComment;         
} 
}