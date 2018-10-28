package jx.tour.service.impl;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.ContentMapper;
import jx.tour.mapper.SpecialtyMapper;
import jx.tour.mapper.SpecialtyVoMapper;
import jx.tour.pojo.Content;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtyVo;
import jx.tour.service.BackSpecialtyService;

@Service
public class BackSpecialtyServiceImp implements BackSpecialtyService {
@Autowired
private SpecialtyVoMapper specialtyVoMapper;
@Autowired
private SpecialtyMapper specialtyMapper;
@Autowired
private ContentMapper contentMapper;
	@Override
	public List<SpecialtyVo> selectAllSpecialty() {
		List<SpecialtyVo> list = specialtyVoMapper.getAllSpecialty();
		return list;
	}
	@Override
	public void editSpecialty(Specialty specialty) {
		// TODO Auto-generated method stub
		specialtyMapper.updateByPrimaryKey(specialty);
	}
	@Override
	public void downSpecialty(int specialtyid) {
		 
		specialtyVoMapper.downSpecialty(specialtyid);
	}
	@Override
	public void upSpecialty(int specialtyid) {
		specialtyVoMapper.upSpecialty(specialtyid);
		
	}
	@Override
	public void addSpecialty(Specialty specialty) {
		 specialtyMapper.insert(specialty);
		
	}
	@Override
	public void publishSpecialty(Content content) {
		content.setCategoryid(1);
		content.setCreated(new Date());
		content.setStage(1);
		contentMapper.insert(content);
		
	}
	
}
