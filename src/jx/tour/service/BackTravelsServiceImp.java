package jx.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.TravelsMapper;
import jx.tour.mapper.TravelsVoMapper;
import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsExample;
import jx.tour.pojo.TravelsWithBLOBs;

@Service
public class BackTravelsServiceImp implements BackTravelsService {
@Autowired
private TravelsMapper travelsMapper;
@Autowired 
private TravelsVoMapper travelsVoMapper;
	@Override
	public List<TravelsWithBLOBs> getAllTravles() {
		TravelsExample travelsExample = new TravelsExample();
		TravelsExample.Criteria criteria = travelsExample.createCriteria();
		criteria.andIdIsNotNull();
		List<TravelsWithBLOBs> list = travelsMapper.selectByExampleWithBLOBs(travelsExample);
		return list;
	}

	@Override
	public void pass(int id) {
		travelsVoMapper.pass(id);
	}
	@Override
	public void reject(int id) {
		travelsVoMapper.noPass(id);
	}
	@Override
	public void passSome(int[] ids) {
		travelsVoMapper.passSome(ids);
		
	}

	@Override
	public List<Travels> getPassTravels(int[] ids) {
		List<Travels> list = travelsVoMapper.getPassTravels(ids);
		return list;
	}

	 
}
