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
import jx.tour.pojo.Content;
import jx.tour.pojo.ContentExample.Criteria;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicExample;
import jx.tour.pojo.ScenicVo;
import jx.tour.pojo.ScenicWithBLOBs;
import jx.tour.service.BackScenicService;
import jx.tour.service.ScenicService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backScenic")
public class BackScenicController {
	@Autowired
	private BackScenicService backScenicService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private ScenicService scenicService;
	
	@Autowired
	private ScenicMapper scenicMapper;
	//得到首页展示的所有风景
	@Autowired
	private PageUtils pageUtils;
	@RequestMapping("/requestAdsScenics")
	@ResponseBody
	public EUDateGridResult requestAdsScenics(Integer page, Integer rows) {  
		EUDateGridResult result = backScenicService.getContentScenics(page, rows);
		return result;
	}
    //得到所有的风景信息
	@RequestMapping("/requestAllScenics")
	public String requestAllScenics(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model) {  
	    //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,5);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<ScenicVo> list = backScenicService.getAllScenics();  

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo<ScenicVo> pageInfo = new PageInfo<>(list,5);  
	    pageUtils.setTotal(pageInfo.getTotal());
	    pageUtils.setPageNum(pageInfo.getPages());
	    pageUtils.setCurrentPageNum(page);
	    pageUtils.setBackPageNum(pageInfo.getPrePage());      
	    pageUtils.setNextPageNum(pageInfo.getNextPage());
	    
	     
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    model.addAttribute("pageUtils", pageUtils);
	    return "admin/scenic";     
	}
	
	
	//提交景点修改信息
	@RequestMapping("/editScenic")
	public String editScenic(Model model,@RequestParam("file") MultipartFile[] files,Scenic scenic) throws Exception{
		List<String> savePath = uploadFileService.uploadScenicImag(files,scenic.getScenicnum());
		if(savePath!=null){
			for(int i=0;i<savePath.size();i++){
	        	if(i==0){
	        		scenic.setPic1(savePath.get(i));
	        	}
	        	if(i==1){
	        		scenic.setPic2(savePath.get(i));
	        	}
	        	if(i==2){
	        		scenic.setPic3(savePath.get(i));
	        	}
	        }
		}
		try{
			scenicService.updateScenic(scenic);  
		}catch(Exception e){
			model.addAttribute("error","还有图片未选择");
			return "admin/error";
		}
		 
		 return "redirect:/backScenic/requestAllScenics";  
	}
	
	//保存新增的景点信息
	@RequestMapping("/addScenic")
	public String addScenic(@RequestParam(value = "file")MultipartFile[] file,ScenicWithBLOBs scenic,Model model) throws Exception{
		 int scenicNum = scenic.getScenicnum();
		 scenic.setStage(1);  
		
		//调用插入图片的方法  
		List<String> savePath = uploadFileService.uploadScenicImag(file,scenicNum);  
		if (savePath != null) {
			for (int i = 0; i < savePath.size(); i++) {
				if (i == 0) {
					scenic.setPic1(savePath.get(i));
				}
				if (i == 1) {
					scenic.setPic2(savePath.get(i));
				}
				if (i == 2) {
					scenic.setPic3(savePath.get(i));
				}
			}
		}
		//进风景信息插入数据库
		try {
			scenicService.addScenic(scenic);
		} catch (Exception e) {
			model.addAttribute("error","还有信息未填写");
			return "admin/error";
		}
		
		 return "redirect:/backScenic/requestAllScenics";  
	} 
	
	//下架风景信息
	@RequestMapping("/downScenic")
	public String downScenic(Model model,int id){
		try{  
			scenicService.downScenic(id);
		}catch(Exception e){
			model.addAttribute("error","下架错误");
			return "admin/error";
		}
		
		return "redirect:/backScenic/requestAllScenics";  
	}
	@RequestMapping("/upScenic")
	public String upScenic(Model model,int id){
		try{   
			scenicService.upScenic(id);
		}catch(Exception e){
			model.addAttribute("error","上架错误");
			return "admin/error";
		}
		
		return "redirect:/backScenic/requestAllScenics";  
	}
	@RequestMapping("/downSomeScenics")
	@ResponseBody
	public List<ScenicVo> downSomeScenics(Model model,int ids[]){
		System.out.println("-=-------------------------------\n");
		for(int i=0;i<ids.length;i++){
			try{  
				scenicService.downScenic(ids[i]);
			}catch(Exception e){
				model.addAttribute("error","下架错误");
			}
		}
		List<ScenicVo> list = scenicService.selectdownScenics(ids);
		return list;
		 
	}
	@RequestMapping("/publishScenic")
	public String publishScenic(Model model,Content content){
		
		backScenicService.publishScenic(content);
		return "redirect:/backContent/getPublishContent?categoryid=0";  
	}
	
}
