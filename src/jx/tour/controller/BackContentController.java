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
import jx.tour.pojo.Content;
import jx.tour.pojo.ContentVo;
import jx.tour.service.BackContentService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backContent")
public class BackContentController { 
	@Autowired
	private BackContentService backContentService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private PageUtils pageUtils;
	@RequestMapping("/getPublishContent")
    public String getPublishSpecialty(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Integer categoryid,Model model){
		
		//引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,4);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<ContentVo> list = backContentService.getPublishContent(categoryid);

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
	    PageInfo<ContentVo> pageInfo = new PageInfo<>(list,4);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
	    model.addAttribute("pageInfo",pageInfo);  
	    return "admin/content";     
		
	}
    //对前台的发布表项进行下架
	@RequestMapping("/downPublishContent")
    public String downPublishSpecialty(int cid,int categoryid,Model model){
		
		try{  
			backContentService.downPublishContent(cid);
		}catch(Exception e){
			model.addAttribute("error","下架错误");
			return "admin/error";
		}
		
		return "redirect:/backContent/getPublishContent?categoryid="+categoryid+"";  
		
	}
	
    //对前台发布表项进行上架
	@RequestMapping("/upPublishContent")
    public String upPublishSpecialty(int cid,int categoryid,Model model){
		try{  
			backContentService.upPublishContent(cid);
		}catch(Exception e){
			model.addAttribute("error","下架错误");
			return "admin/error";
		}
		
		return "redirect:/backContent/getPublishContent?categoryid="+categoryid+"";  
		
	}
    //发布信息到content表中
	@RequestMapping("/addContent")
    public String addContentSpecialty(Content content) {
		
		backContentService.addContent(content);
		return "redirect:/backContent/getPublishContent?categoryid="+content.getCategoryid()+"";  
	}
	 //修改content表中的信息
	@RequestMapping("/editContent")
	public String editContent(Content content,MultipartFile file,Model model){
		String save;
		try {
			save = uploadFileService.uploadContentImag(file, content);
		} catch (Exception e1) {
			model.addAttribute("error","未上传图片");
			return "admin/error";
		}
		content.setPic(save);
		content.setStage(1);
		content.setCreated(new Date());

	    backContentService.editContent(content);

	    return "redirect:/backContent/getPublishContent?categoryid="+content.getCategoryid()+"";  
		
		
	}
	
}
