package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.pojo.Ads;
import jx.tour.pojo.Content;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.Information;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.AreaService;
import jx.tour.service.IndexService;

@Controller
@RequestMapping("/area")
public class AreaController {

	@Autowired
	private AreaService areaService;
	//获取每个城市的景点、美食等信息
	@RequestMapping("/requestContent")
	public String requestArea(Model model,@RequestParam(value = "id") int contentId) throws Exception {
		//所有风景
		List<Scenic> scenictList = areaService.getALLScenicList(contentId);
		//随机特产
		List<Specialty> someSpecialtyList = areaService.getSomeSpecialty(contentId);
		//随机美食
		List<Specialty> someFoodList = areaService.getSomeFood(contentId);
		//随机红色景点
		List<Scenic> someRedScenicList = areaService.getSomeRedScenic(contentId);
		//随机酒店
	    List<Hotel> someHotelList = areaService.getSomHotels(contentId);

		model.addAttribute("scenictList",scenictList);
		model.addAttribute("someSpecialtyList",someSpecialtyList);
		model.addAttribute("someFoodList",someFoodList);
		model.addAttribute("someRedScenicList",someRedScenicList);
		model.addAttribute("someHotelList",someHotelList);
		return "scenic_list";
	}
}
	
