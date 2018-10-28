package jx.tour.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.HCommentMapper;
import jx.tour.mapper.ScenicCommentMapper;
import jx.tour.mapper.SpecialtyCommentMapper;
import jx.tour.mapper.TravelsVoMapper;
import jx.tour.pojo.HComment;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.SpecialtycommentVo;
import jx.tour.pojo.TravelCommentVo;

@Service
public class BackCommentServiceImp implements BackCommentService {
@Autowired
private ScenicCommentMapper scenicCommentMapper;
@Autowired
private SpecialtyCommentMapper specialtyCommentMapper;
@Autowired 
private HCommentMapper hCommentMapper;
@Autowired
private TravelsVoMapper travelsVoMapper;

	@Override
	public List<ScenicComment> getAllScenicComment() {
		List<ScenicComment> list  = scenicCommentMapper.getAllScenicComment();
		return list;
	}

	@Override
	public void passScenicComment(int cid) {
		scenicCommentMapper.passScenicComment(cid);
		
	}

	@Override
	public void rejectScenicComment(int cid) {
		scenicCommentMapper.rejectScenicComment(cid);
	}

	@Override
	public List<SpecialtycommentVo> getAllSpecialtyComment() {
		List<SpecialtycommentVo> list = specialtyCommentMapper.getAllSpecialtyComment();
		return list;
	}

	@Override
	public void passSpecialtyComment(int id) {
		specialtyCommentMapper.passSpecialtyComment(id);
		
	}

	@Override
	public void rejectSpecialtyComment(int id) {
		specialtyCommentMapper.rejectSpecialtyComment(id);
		
	}

	@Override
	public List<HComment> getAllHotelCommnet() {
		List<HComment> list = hCommentMapper.getAllHotelCommnet();
		return list;
	}

	@Override
	public void rejectHotelComment(int id) {
		hCommentMapper.rejectHotelComment(id);
		
	}

	@Override
	public void passHotelComment(int id) {
		hCommentMapper.passHotelComment(id);
		
	}

	@Override
	public List<TravelCommentVo> getAllTravelsComment() {
		List<TravelCommentVo> list  = travelsVoMapper.getAllTravelsComment();
		return list;
	}

	@Override
	public void passTravelsComment(int id) {
		travelsVoMapper.passTravelsComment(id);
		
	}

	@Override
	public void rejectTravelsCommment(int id) {
		travelsVoMapper.rejectTravelsCommment(id);
		
	}
   
}
