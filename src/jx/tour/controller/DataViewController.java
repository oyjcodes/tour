package jx.tour.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jx.tour.pojo.OrderNumber;
import jx.tour.service.DataViewService;

@Controller
@RequestMapping("/view")
public class DataViewController {
	@Autowired
	private DataViewService dataViewService;

	// 得到各个地方的特产商城下单数量（形成折线图一）
	@RequestMapping("/getOrderNumber")
	@ResponseBody
	public Map<String, Object> getOrderNumber(Model model) {
		System.err.println("-------------------------------------");
		List<OrderNumber> list = dataViewService.getoOrderNumber();

		List<String> name = new ArrayList<String>();
		List<Integer> value1 = new ArrayList<Integer>();
		List<Double> value2= new ArrayList<Double>();

		// 单独挑出两种数据的集合放入map
		for (OrderNumber echartsDataBallBean : list) {
			name.add(echartsDataBallBean.getName());// 对应xAxis data
			value1.add(echartsDataBallBean.getValue1());// 对应yAxis data
			value2.add(echartsDataBallBean.getValue2());// 对应yAxis data
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value1", value1);
		map.put("value2", value2);
		return map;
	}

}
