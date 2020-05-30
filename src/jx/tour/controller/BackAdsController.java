package jx.tour.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.Ads;
import jx.tour.service.BackAdsService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backAds")
public class BackAdsController { 
	@Autowired
	private BackAdsService backAdsService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private PageUtils pageUtils;
    //得到所有的广告信息进行分页
	@RequestMapping("/requestAllAds")
	public String requestAllAds(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {  
	    //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<Ads> list = backAdsService.getAllAds();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<Ads> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/ads";     
	}

	// 编辑特产信息
	@RequestMapping("/editAds")
	public String editSpecialty(Model model,MultipartFile file, Ads ads) throws Exception {
		String save = uploadFileService.uploadAdsImag(file);
		ads.setPic(save);
		ads.setStage(1);
		ads.setPtime(new Date());
		try{
		   backAdsService.editAds(ads);
		   model.addAttribute("error","修改错误,可能未上传图片");
			return "admin/error";
		}catch(Exception e){
			
		}
		return "redirect:/backAds/requestAllAds";  
	}
	
	@RequestMapping("/upAds")
	public String upAds(Model model,int id){
		try{  
			backAdsService.upAds(id);
		}catch(Exception e){
			model.addAttribute("error","上架信息有误");
			return "admin/error";
		}
		
		return "redirect:/backAds/requestAllAds";
	}
	@RequestMapping("/downAds")
	public String downAds(Model model,int id){  
		backAdsService.downAds(id);
		return "redirect:/backAds/requestAllAds";
	}
	@RequestMapping("/addAds")
	public String addAds(MultipartFile file,Ads ads,Model model) throws Exception{
		String save = uploadFileService.uploadAdsImag(file);
		ads.setPic(save);
		ads.setStage(1);
		ads.setPtime(new Date()); 
		try {
			backAdsService.addAds(ads);
		} catch (Exception e) {
			model.addAttribute("error","还有信息未填写");
			return "admin/error";
		}
		
		return "redirect:/backAds/requestAllAds";
	}
}
