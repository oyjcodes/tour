package jx.tour.service.impl;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.SccommentMapper;
import jx.tour.mapper.ScenicCommentMapper;
import jx.tour.mapper.ScenicMapper;
import jx.tour.mapper.ScenicVoMapper;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.ScenicVo;
import jx.tour.pojo.ScenicWithBLOBs;
import jx.tour.pojo.Search;
import jx.tour.service.ScenicService;

@Service
public class ScenicServiceImpl implements ScenicService{
   @Autowired
   private ScenicMapper scenicMapper;
   @Autowired
   private ScenicVoMapper scenicVoMapper;
   @Autowired
   private ScenicCommentMapper scenicCommentMapper;
   @Autowired
   private SccommentMapper sccommentMapper;
	@Override
	public Scenic getScenic(int scenic_id) {
		Scenic scenic = scenicMapper.selectByPrimaryKey(scenic_id);
		return scenic;
	}
	@Override
	public List<ScenicComment> getScenicComment(int scenic_id) {
		List<ScenicComment> scenicComment = scenicCommentMapper.getScenicComment(scenic_id);
		return scenicComment;
	}

	@Override
	public List<Scenic> getScenics() {
		List<Scenic> someScenic = scenicCommentMapper.getScenic();
		return someScenic;
	}

	@Override
	public List<Scenic> getSomeScenics() {
		List<Scenic> someScenic = scenicCommentMapper.getSomeScenic();
		return someScenic;
	}

	//根据景点名称模糊查询具体景点信息
	@Override
	public List<Scenic> getScenicByName(Search search) {
		
		List<Scenic> scenicList = scenicCommentMapper.getScenicByName(search);
		return scenicList;
	}
	
	@Override
	//发布景点评论信息
	public void publishScenicComment(ScenicComment sccomment) {
		 sccomment.setPtime(new Date());
		 sccomment.setStage(1);  
		 sccommentMapper.insert(sccomment);    
	}

	  
	/*后台service*/
	@Override
	public void downScenic(int scenicid) { 
		scenicVoMapper.downScenic(scenicid);
	}

	@Override
	public void addScenic(ScenicWithBLOBs scenic) {
		scenicMapper.insertSelective(scenic);
	}

	@Override
	public void updateScenic(Scenic scenic) {
		scenicMapper.updateByPrimaryKey(scenic);
	}

	@Override
	public void upScenic(int scenicid) {
		scenicVoMapper.upScenic(scenicid);
		
	}

	@Override
	public List<ScenicVo> selectdownScenics(int[] ids) {
		List<ScenicVo> list = scenicVoMapper.selectScenics(ids);
		return list;
	}
}
