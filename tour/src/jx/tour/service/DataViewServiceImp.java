package jx.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.DataViewMapper;
import jx.tour.pojo.OrderNumber;

@Service
public class DataViewServiceImp implements DataViewService {
@Autowired
private DataViewMapper dataViewMapper;
	@Override
	public List<OrderNumber> getoOrderNumber() {
		 List<OrderNumber> list = dataViewMapper.getOrderNumber();
		return list;
	}

}
