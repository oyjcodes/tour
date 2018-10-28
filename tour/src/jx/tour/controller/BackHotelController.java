package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.HotelVo;
import jx.tour.pojo.HotelWithBLOBs;
import jx.tour.service.BackHotelService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;


@Controller
@RequestMapping("/backHotel")
public class BackHotelController { 
	@Autowired
	private BackHotelService backHotelService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	PageUtils pageUtils;
    //得到所有的酒店信息进行分页
	@RequestMapping("/requestAllHotel")
	public String requestAllSpecialty(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {  
	    //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<HotelVo> list = backHotelService.getAllHotel();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<HotelVo> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/hotel";     
	}
	//编辑酒店信息
	@RequestMapping("/editHotel")
	public String editHotel(Model model,@RequestParam("file") MultipartFile[] files,HotelWithBLOBs hotel) throws Exception{
		List<String> savePath = uploadFileService.uploadHotelImag(files,hotel.getHnum());
			 
	    hotel.setPic(savePath.get(0));
	        	 
		try{
			backHotelService.editHotel(hotel);
		}catch(Exception e){  
			model.addAttribute("error","还有图片未选择");
			return "admin/error";
		}   
		 
		 return "redirect:/backHotel/requestAllHotel";  
	}
	
	@RequestMapping("/upHotel")
	public String upHotel(Model model,int id){
		try{  
			backHotelService.upHotel(id);
		}catch(Exception e){
			model.addAttribute("error","上架错误");
			return "admin/error";
		}
		
		return "redirect:/backHotel/requestAllHotel";  
	}
	@RequestMapping("/downHotel")
	public String downHotel(Model model,int id){  
		try{  
			backHotelService.downHotel(id);
		}catch(Exception e){
			model.addAttribute("error","下架错误");
			return "admin/error";
		}
		
		return "redirect:/backHotel/requestAllHotel";  
	}
	@RequestMapping("/addHotel")
	public String addHotel(@RequestParam(value = "file")MultipartFile[] files,HotelWithBLOBs hotel,Model model) throws Exception{
		int hNum = hotel.getHnum();
		hotel.setStage(1);  
		
		//调用插入图片的方法  
		List<String> savePath = uploadFileService.uploadHotelImag(files, hNum); 
		hotel.setPic(savePath.get(0));
		//将酒店信息插入数据库
		try {
			backHotelService.addHotel(hotel);
		} catch (Exception e) {
			model.addAttribute("error","还有信息未填写");
			return "admin/error";
		}
		
		return "redirect:/backHotel/requestAllHotel";  
	}
}
