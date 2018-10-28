package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.mapper.ScenicMapper;
import jx.tour.pojo.ContentExample.Criteria;
import jx.tour.pojo.Content;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicExample;
import jx.tour.pojo.ScenicVo;
import jx.tour.pojo.ScenicWithBLOBs;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtyVo;
import jx.tour.service.BackScenicService;
import jx.tour.service.BackSpecialtyService;
import jx.tour.service.ScenicService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;
import sun.awt.ModalExclude;

@Controller
@RequestMapping("/backSpecialty")
public class BackSpecialtyController { 
	@Autowired
	private BackSpecialtyService backSpecialtyService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private PageUtils pageUtils;
    //得到所有的特产信息进行分页
	@RequestMapping("/requestAllSpecialty")
	public String requestAllSpecialty(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {  
	    //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<SpecialtyVo> list = backSpecialtyService.selectAllSpecialty();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<SpecialtyVo> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/specialty";     
	}
	//编辑特产信息
	@RequestMapping("/editSpecialty")
	public String editSpecialty(Model model,@RequestParam("file") MultipartFile[] files,Specialty specialty) throws Exception{
		System.out.println("======================="+specialty.getTnum());
		List<String> savePath = uploadFileService.uploadSpecialtyImag(files,specialty.getTnum());
			for(int i=0;i<savePath.size();i++){
	        	if(i==0){
	        		specialty.setTpic(savePath.get(i));
	        	}
	        	if(i==1){
	        		specialty.setPic2(savePath.get(i));
	        	}
	        	if(i==2){
	        		specialty.setPic3(savePath.get(i));
	        	}
	        }
		try{
			backSpecialtyService.editSpecialty(specialty); 
		}catch(Exception e){  
			model.addAttribute("error","还有图片未选择");
			return "admin/error";
		}   
		 
		 return "redirect:/backSpecialty/requestAllSpecialty";  
	}
	
	@RequestMapping("/upSpecialty")
	public String upSpecialty(Model model,int id){
		try{  
			backSpecialtyService.upSpecialty(id);
		}catch(Exception e){
			model.addAttribute("error","上架错误");
			return "admin/error";
		}
		
		return "redirect:/backSpecialty/requestAllSpecialty";  
	}
	@RequestMapping("/downSpecialty")
	public String downSpecialty(Model model,int id){  
		try{  
			backSpecialtyService.downSpecialty(id);
		}catch(Exception e){
			model.addAttribute("error","下架错误");
			return "admin/error";
		}
		
		return "redirect:/backSpecialty/requestAllSpecialty";  
	}
	@RequestMapping("/addSpecialty")
	public String addSpecialty(@RequestParam(value = "file")MultipartFile[] files,Specialty specialty,Model model) throws Exception{
		int specialtyNum = specialty.getTnum();
		specialty.setStage(1);  
		
		//调用插入图片的方法  
		List<String> savePath = uploadFileService.uploadSpecialtyImag(files, specialtyNum);  
		if (savePath != null) {
			for (int i = 0; i < savePath.size(); i++) {
				if (i == 0) {
					specialty.setTpic(savePath.get(i));
				}
				if (i == 1) {
					specialty.setPic2(savePath.get(i));
				}
				if (i == 2) {
					specialty.setPic3(savePath.get(i));
				}
			}
		}
		//进风景信息插入数据库
		try {
			backSpecialtyService.addSpecialty(specialty);
		} catch (Exception e) {
			model.addAttribute("error","还有信息未填写");
			return "admin/error";
		}
		
		 return "redirect:/backSpecialty/requestAllSpecialty";  
	}
	
	
	
	@RequestMapping("/publishSpecialty")
	public String publishSpecialty(Model model,Content content){
		backSpecialtyService.publishSpecialty(content);
		return "redirect:/backContent/getPublishContent?categoryid=1";  
	}
}
