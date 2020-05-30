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

import jx.tour.mapper.InformationMapper;
import jx.tour.pojo.Information;
import jx.tour.service.BackInformationService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backInformation")   
public class BackInformationController { 
	@Autowired
	private BackInformationService backInformationService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private PageUtils pageUtils;
    //得到所有的广告信息进行分页
	@RequestMapping("/requestAllInformation")
	public String requestAllAds(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {  
	    //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<Information> list = backInformationService.getAllInformations();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<Information> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/information";     
	}

	// 编辑特产信息
	@RequestMapping("/editInformation")
	public String editSpecialty(Model model,MultipartFile file, Information information) throws Exception {
		String save = uploadFileService.uploadInformationImag(file);
		information.setPic(save);
		information.setStage(1);
		information.setPtime(new Date());
		try{
		   backInformationService.editInformation(information);
		}catch(Exception e){
			model.addAttribute("error","修改错误,可能未上传图片");
			return "admin/error";  
		}
		return "redirect:/backInformation/requestAllInformation";  
	}
	
	@RequestMapping("/upInformation")
	public String upInformation(Model model,int id){
		try{  
			backInformationService.upInformation(id);
		}catch(Exception e){
			model.addAttribute("error","上架信息有误");
			return "admin/error";
		}
		
		return "redirect:/backInformation/requestAllInformation";  
	}
	@RequestMapping("/downInformation")
	public String downInformation(Model model,int id){  
		try{  
			backInformationService.downInformation(id);
		}catch(Exception e){
			model.addAttribute("error","下架信息有误");
			return "admin/error";
		}
		return "redirect:/backInformation/requestAllInformation";  
	}
	@RequestMapping("/addInformation")
	public String addInformation(MultipartFile file,Information information,Model model) throws Exception{
		String save = uploadFileService.uploadInformationImag(file);
		information.setPic(save);
		information.setStage(1);
		information.setPtime(new Date());
		try {
			backInformationService.addInformation(information);
		} catch (Exception e) {
			model.addAttribute("error","还有信息未填写");
			return "admin/error";
		}
		
		return "redirect:/backInformation/requestAllInformation";  
	}
}
