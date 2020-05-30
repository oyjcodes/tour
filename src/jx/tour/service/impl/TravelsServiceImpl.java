package jx.tour.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.TravelcommentMapper;
import jx.tour.mapper.TravelsMapper;
import jx.tour.mapper.TravelsVoMapper;
import jx.tour.pojo.GiveGood;
import jx.tour.pojo.HComment;
import jx.tour.pojo.Search;
import jx.tour.pojo.Travelcomment;
import jx.tour.pojo.TravelsVo;
import jx.tour.pojo.TravelsWithBLOBs;
import jx.tour.service.TravelsService;
@Service
public class TravelsServiceImpl implements TravelsService {
@Autowired
private TravelsVoMapper travelsVoMapper;
@Autowired
private TravelsMapper travelsMapper;
@Autowired
private TravelcommentMapper travelcommentMapper;
	@Override
	public TravelsVo getTravelsVo(int Travels_id) {
		TravelsVo travelsVo = travelsVoMapper.findTravelArticle(Travels_id);
		return travelsVo;
	}
	@Override
	public List<HComment> getTravelsComment(int Travels_id) {
		List<HComment> traveCommentlList  =  travelsVoMapper.findTravelComment(Travels_id);
		return traveCommentlList;
	}
	@Override
	public List<TravelsVo> getOtherTravels(int id) {
		List<TravelsVo> otherTravelsList = travelsVoMapper.findOtherTravels(id);
		return otherTravelsList;
	}
	@Override
	public List<TravelsVo> getAllTravels() {
		List<TravelsVo> travelsList = travelsVoMapper.findALLTravels();
		return travelsList;
	}
	@Override
	//将游记信息保存进数据库中
	public void saveTravel(TravelsWithBLOBs travel) {
		travel.setStage(0);
		travelsMapper.insert(travel);
	}
	@Override
	public List<TravelsVo> getTravelsByName(Search search) {
		//根据游记的标题模糊查询游记
		List<TravelsVo>  travels = travelsVoMapper.findTravelsByName(search);
		return travels;
	}
	//评论游记
	@Override
	public void giveTravelCommment(Travelcomment travelcomment) {
		travelcomment.setPtime(new Date());
		travelcomment.setStage(1);
		travelcommentMapper.insert(travelcomment);
	}
	@Override
	public void addGood(GiveGood giveGood) {
		int num=giveGood.getGoodnum();
		giveGood.setGoodnum(++num);
		travelsVoMapper.addGood(giveGood);  
		 
	}
	@Override
	public List<TravelsVo> getUserAllTravels(int userid) {
		List<TravelsVo> userAllTravels = travelsVoMapper.findUserAllTravels(userid);
		return userAllTravels;
	}
	@Override
	public void editTravel(TravelsVo travelsVo) {
		travelsVoMapper.updateTravel(travelsVo);
	}
	@Override
	public void deleteTravel(int travelid) {
		travelsMapper.deleteByPrimaryKey(travelid);
		
	}

}
