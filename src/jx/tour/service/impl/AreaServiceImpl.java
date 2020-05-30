package jx.tour.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.RecommendMapper;
import jx.tour.mapper.ScenicMapper;
import jx.tour.mapper.SpecialtyMapper;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicExample;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtyExample;
import jx.tour.service.AreaService;
@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	private ScenicMapper scenicMapper;
	@Autowired
	private SpecialtyMapper specialtyMapper;
	@Autowired
	private RecommendMapper recommendMapper;
	@Override
	//显示特定城市的风景
	public List<Scenic> getALLScenicList(int id) {
		ScenicExample  example = new ScenicExample();
		ScenicExample.Criteria criteria = example.createCriteria();
		criteria.andScenicnumEqualTo(id);
		List<Scenic> scenicList = scenicMapper.selectByExample(example);
		return scenicList;
	}
	@Override
	//显示特定城市的特产
	public List<Specialty> getALLSpecialty(int id) {
		SpecialtyExample example = new SpecialtyExample();
		SpecialtyExample.Criteria criteria = example.createCriteria();
		criteria.andTnumEqualTo(id);
		List<Specialty> specialtiesList = specialtyMapper.selectByExample(example);
		return specialtiesList;
	}
	//显示特定城市的美食
	@Override
	public List<Specialty> getALLGoodFood(int id) {
		SpecialtyExample example = new SpecialtyExample();
		SpecialtyExample.Criteria criteria = example.createCriteria();
		criteria.andTnumEqualTo(id);
		criteria.andTcategoryEqualTo("2");
		List<Specialty> foodList = specialtyMapper.selectByExample(example);
		return foodList;
	}
	
	
	
	@Override
	  //随机显示江西某个城市的6种特产
	public List<Specialty> getSomeSpecialty(int id) {
		List<Specialty> someSpecialtyList = recommendMapper.findGoodSpecialty(id);
		return someSpecialtyList;
	}
	@Override
	//从特产表中随机抽取6种不同的美食
	public List<Specialty> getSomeFood(int id) {
		List<Specialty> someFoodList = recommendMapper.findGoodFood(id);
		return someFoodList;
	}
	@Override
	//随机显示江西某个城市的6个红色景点
	public List<Scenic> getSomeRedScenic(int id) {
		List<Scenic> someRedScenicList = recommendMapper.findSomeRedScenic(id);
		return someRedScenicList;
	}
	@Override
	public List<Hotel> getSomHotels(int id) {
		List<Hotel> hotelsList =  recommendMapper.findSomeHotels(id);
		return hotelsList;
	}
	
	 
}
