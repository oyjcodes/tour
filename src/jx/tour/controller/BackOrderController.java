package jx.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.pojo.ContentVo;
import jx.tour.pojo.OrderVo;
import jx.tour.service.OrderService;
import jx.tour.utils.PageUtils;

@Controller
@RequestMapping("/backOrder")
public class BackOrderController {
@Autowired
private OrderService orderService;
@Autowired
private PageUtils pageUtils;
@RequestMapping("/getAllOrder")	
  public String getAllOrder(@RequestParam(required = false,defaultValue = "1",value = "page")Integer page,Model model){
	//引入分页查询，使用PageHelper分页功能  
    //在查询之前传入当前页，然后多少记录   
    PageHelper.startPage(page,4);      
    //startPage后紧跟的这个查询就是分页查询  
    List<OrderVo> list = orderService.getAllorderVo();

    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以    
    PageInfo<OrderVo> pageInfo = new PageInfo<>(list,4);  
    pageUtils.setCurrentPageNum(page);
    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数    
    model.addAttribute("pageInfo",pageInfo);  
		return "admin/order";
	}
}
