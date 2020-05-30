package jx.tour.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.InformationMapper;
import jx.tour.mapper.TravelsVoMapper;
import jx.tour.pojo.Information;
import jx.tour.pojo.InformationExample;
import jx.tour.pojo.Search;
import jx.tour.pojo.TravelsVo;
import jx.tour.service.InformationService;

@Service
public class InformationServiceImpl implements InformationService {
@Autowired
private InformationMapper informationMapper;
@Autowired
private TravelsVoMapper travelsVoMapper;
	@Override
	public Information getInformation(int information_id) {
		Information information = informationMapper.selectByPrimaryKey(information_id);
		return information;
	}
	@Override
	public List<Information> getOtherInformations(int id) {
		List<Information> informationList = travelsVoMapper.findOtherInformation(id);
		return informationList;
	}
	@Override
	public List<Information> getALLInformations() {
		InformationExample informationExample = new InformationExample();
	    InformationExample.Criteria criteria = informationExample.createCriteria();
		criteria.andIdIsNotNull();
		criteria.andStageEqualTo(1);
		List<Information> list = informationMapper.selectByExample(informationExample);
		return list;
	}
	@Override
	public List<Information> getInformationByTitle(Search search) {
		//根据资讯标题模糊查询资讯信息
		List<Information>  informations = travelsVoMapper.findInformationByTitle(search);
		return informations;
	}

}
