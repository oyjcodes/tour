package jx.tour.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.ContentVo;
import jx.tour.pojo.GiveGood;
import jx.tour.pojo.HComment;
import jx.tour.pojo.Travelcomment;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.TravelsService;
import jx.tour.service.UploadFileService;
import jx.tour.utils.PageUtils;
@Controller
@RequestMapping("/travel")
public class TravelController {
	@Autowired
	private TravelsService travelsService;
	@Autowired
	private UploadFileService uploadService;
	@Autowired
	private PageUtils pageUtils;
	@RequestMapping("/travelArticle")
	public String travelArticle(Model model,int id)throws Exception{
		System.out.println("进入"+"\n");  
		System.out.println(id);
		TravelsVo travelsVo = travelsService.getTravelsVo(id);
		List<HComment> travelCommentList = travelsService.getTravelsComment(id);
		List<TravelsVo> otherTravelList = travelsService.getOtherTravels(id);
		model.addAttribute("travelsArticle", travelsVo);
		model.addAttribute("travelCommentList", travelCommentList);   
		model.addAttribute("otherTravelList", otherTravelList);
		return "note";
	}
	
	@RequestMapping("/getAlltravels")
	public String getAlltravels(Model model,@RequestParam(required = false,defaultValue = "1",value = "page")Integer page)throws Exception{
		

		//引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录   
	    PageHelper.startPage(page,4);      
	    //startPage后紧跟的这个查询就是分页查询  
	    List<TravelsVo> list = travelsService.getAllTravels();

	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
	    PageInfo<TravelsVo> pageInfo = new PageInfo<>(list,4);  
	    pageUtils.setCurrentPageNum(page);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    model.addAttribute("pageInfo",pageInfo);  
	    model.addAttribute("pageUtils",pageUtils);    
		
 
		return "note_list";
		
	}
	//游记页面跳转
	@RequestMapping("/write_note")
	public String write_note(Model model,HttpSession session)throws Exception {
		if(session.getAttribute("user")!=null)
		  return "write_note";
		else
			return "redirect:/check/toLogin";
	}
	
	@RequestMapping("/travelComment")
	public String travelComment(Model model,Travelcomment travelcomment){
		travelsService.giveTravelCommment(travelcomment);
		int num = travelcomment.getTravelnum();
		return "redirect:/travel/travelArticle?id="+num+"";
	}
	
	//我的全部游记查询
	@RequestMapping("/my_note")
	public String my_note(Model model,int id)throws Exception {
		List<TravelsVo> userAllTravels = travelsService.getUserAllTravels(id);
		model.addAttribute("userAllTravels", userAllTravels);
		return "my_note";     
	}
	
	//删除游记
	@RequestMapping("/deleteTravel")
	public String  deleteTravel(Model model,int userid,int travelid){
		travelsService.deleteTravel(travelid);
		return "redirect:/travel/my_note?id="+userid+"";
		
	}
	
	
	//个人游记跳转到修改页面
	@RequestMapping("/editTravel")
	public String editTravel(Model model,int id)throws Exception {
		TravelsVo travelsVo = travelsService.getTravelsVo(id);
		model.addAttribute("travel", travelsVo);
		return "edit_note";
	}
	@RequestMapping("/updateTravel")
	public String updateTravel(Model model,@RequestParam("file") MultipartFile[] files,HttpServletRequest request,TravelsVo travel)throws Exception {
		List<String> savePath = uploadService.uploadFile(files);
        for(int i=0;i<savePath.size();i++){
        	if(i==0){
        		travel.setPic1(savePath.get(i));
        	}
        	if(i==1){
        		travel.setPic2(savePath.get(i));
        	}
        	if(i==2){
        		travel.setPic3(savePath.get(i));
        	}
        }
        travel.setPtime(new Date());
        travelsService.editTravel(travel);
		return "redirect:/travel/getAlltravels";
	}
	//个人主页   
	@RequestMapping("/my_index")
	public String my_index(Model model)throws Exception {      
		//model.addAttribute("items",null);  
		return "my_index";
	}
	  
	@RequestMapping("/collection_list")
	public String collection_list(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "collection_list";
	}
	@RequestMapping("/note_comments")
	public String note_comments(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "note_comments";
	}
	@RequestMapping("/project_order")
	public String project_order(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "project_order";
	}
	@RequestMapping("/travel_order")
	public String travel(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "travel_order";
	}
	@RequestMapping("/my_info")
	public String my_info(Model model)throws Exception {
		//model.addAttribute("items",null);
		return "my_info";
	}
	//游记点赞
	@RequestMapping("/addNum")      
	@ResponseBody  
	public GiveGood addNum(GiveGood giveGood){   
		int num = giveGood.getGoodnum();
		travelsService.addGood(giveGood);    
		giveGood.setGoodnum(++num);              
		return giveGood;                           
	}
}
